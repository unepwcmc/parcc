class Importers::Turnover < Importers::Base
  extend Memoist
  STATS = [:median, :upper, :lower]

  def self.import
    instance = new
    instance.import
  end

  def import
    files.each { |file| populate_values file }
  end

  def populate_values file_path
    split_filename = File.basename(file_path, '.csv').split
    turnover_defaults = {
      taxonomic_class_id: taxon_class_id_from_name(split_filename.first),
      year: split_filename[3]
    }

    csv_reader(file_path).each do |record|
      create_record(turnover_defaults, record)
    end
  end

  def create_record defaults, record
    stats = record.to_hash.slice(*STATS)
    pa_id = {protected_area_id: pa_id_from_wdpa_id(record[:WDPAID])}

    SpeciesTurnover.create defaults.merge(stats).merge(pa_id)
  end

  memoize def files
    Dir['lib/data/turnover/*']
  end

  memoize def pa_id_from_wdpa_id wdpa_id
    db.select_value(
      "SELECT id from protected_areas where wdpa_id = #{wdpa_id.to_i}"
    ).instance_eval { to_i unless nil? }
  end

  memoize def taxon_class_id_from_name name
    db.select_value(
      "SELECT id from taxonomic_classes where name = '#{name}'"
    ).instance_eval { to_i unless nil? }
  end

  define_method(:db) { ActiveRecord::Base.connection }
end
