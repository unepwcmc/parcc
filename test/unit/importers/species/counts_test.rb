require 'test_helper'
require 'csv'

class TestImportersSpeciesCounts < ActiveSupport::TestCase
  def setup
    @pa = FactoryGirl.create(:protected_area, wdpa_id: 111222)
    FactoryGirl.create(:taxonomic_class, name: 'Amphibian')
    FactoryGirl.create(:taxonomic_class, name: 'Bird')

    csv = [{
      wdpa_id: 111222,
      taxon_class: 'Amphibian',
      vulnerable_species: 900,
      non_vulnerable_species: 100,
      total_species: 1000
    }, {
      wdpa_id: 111222,
      taxon_class: 'Bird',
      vulnerable_species: 10,
      non_vulnerable_species: 20,
      total_species: 30
    }]

    CSV.stubs(:foreach).returns(csv)
  end

  test '.import adds counts to the found pa' do
    Importers::Species::Counts.import

    @pa = @pa.reload
    assert_equal 1030, @pa.count_total_species
    assert_equal 910, @pa.count_vulnerable_species
    assert_equal 88, @pa.percentage_vulnerable_species
  end

  test '.import creates TaxonomicClassProtectedArea records' do
    Importers::Species::Counts.import
    assert_equal 2, TaxonomicClassProtectedArea.count
  end
end
