require 'test_helper'
require 'csv'

class TestImportersSpecies < ActiveSupport::TestCase
  test '.import_taxonomies calls Importers::Species::Taxonomies.import' do
    Importers::Species::Taxonomies.expects(:import)
    Importers::Species.import_taxonomies
  end

  test '.import_counts calls Importers::Species::Counts.import' do
    Importers::Species::Counts.expects(:import)
    Importers::Species.import_counts
  end
end
