class Importers::HighPriorityProtectedAreas < Importers::Base
  def self.import
    instance = new
    instance.import
  end

  def import
    csv_reader(source_file_path).each do |record|
      update_area(record)
    end
  end

  private

  def update_area record
    ProtectedArea.find_by(name: record[:name],
      designation: record[:designation]).try(:update, high_priority: true)
  end

  def source_file_path
    Rails.root.join('lib/data/high_priority_protected_areas.csv')
  end
end
