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

    Importers::ProtectedAreas.import
    Importers::HighPriorityProtectedAreas.import

    Importers::Species.import_taxonomies
    Importers::Species.import_counts

    Importers::Turnover.import
    Importers::SuitabilityChanges.import
  end
end
