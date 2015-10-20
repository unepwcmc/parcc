class Importers::Species::Counts < Importers::Base
  def import
    csv_reader(source_file_path).each do |record|
      @protected_area = fetch_protected_area(record[:wdpa_id])
      next unless @protected_area

      @taxonomic_class = fetch_taxonomic_class(record[:taxon_class])
      next unless @taxonomic_class

      add_counts record
      add_relation record
    end
  end

  private

  def add_relation record
    TaxonomicClassProtectedArea.create({
      protected_area_id: @protected_area.id,
      taxonomic_class_id: @taxonomic_class.id,
      count_total_species: record[:total_species].to_i,
      count_vulnerable_species: record[:vulnerable_species].to_i
    })
  end

  def add_counts record
    @protected_area.count_total_species += record[:total_species].to_i
    @protected_area.count_vulnerable_species += record[:vulnerable_species].to_i
    @protected_area.percentage_vulnerable_species = (
      @protected_area.count_vulnerable_species.to_f / @protected_area.count_total_species
    ) * 100

    @protected_area.save
  end

  def source_file_path
    Rails.root.join('lib/data/species/taxonomic_class_protected_areas.csv')
  end
end
