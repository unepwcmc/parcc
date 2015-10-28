PROTECTED_AREAS_SOURCE = Rails.root.join('lib/data/turnover/Amphibian species turnover 2040 wt WDPAID.csv')
PROTECTED_AREAS_DEST   = Rails.root.join('lib/data/protected_areas.csv')

namespace :parcc do
  desc 'Import PARCC data'
  task import: :environment do
    if ENV['DESTRUCTIVE']
      [
        ProtectedArea,
        Species,
        SpeciesProtectedArea,
        SpeciesTurnover,
        TaxonomicClass,
        TaxonomicOrder,
        SuitabilityChange
      ].each(&:delete_all)
    end

    CSV.open(PROTECTED_AREAS_DEST, 'wb') do |dest|
      copy_first_8_columns = -> (row) { dest << row.first(8) }
      CSV.foreach(PROTECTED_AREAS_SOURCE, &copy_first_8_columns)
    end

    Importers::ProtectedAreas.import
    Importers::HighPriorityProtectedAreas.import

    Importers::Species.import_taxonomies
    Importers::Species.import_counts

    Importers::Turnover.import
    Importers::SuitabilityChanges.import
  end
end
