require 'test_helper'

class DownloadsGeneratorsSuitabilityChangesTest < ActiveSupport::TestCase
  test '::generate, given a ProtectedArea, returns a path to the created csv' do
    pa = FactoryGirl.build(:protected_area)
    expected_path = Rails.root.join("tmp/downloads/#{pa.wdpa_id}_suitability_changes.csv")

    CSV.stubs(:open)
    assert_equal expected_path, Downloads::Generators::SuitabilityChanges.generate(pa)
  end

  test '::generate, given a ProtectedArea, creates a csv file' do
    pa = FactoryGirl.create(:protected_area)
    taxo_class = FactoryGirl.create(:taxonomic_class, name: 'the class')
    taxo_order = FactoryGirl.create(:taxonomic_order, name: 'the order', taxonomic_class: taxo_class)
    species = FactoryGirl.create(:species, name: 'Antilocapra', taxonomic_order: taxo_order)
    FactoryGirl.create(:suitability_change, protected_area: pa, species: species, year: 2040, value: 'Inc')
    FactoryGirl.create(:suitability_change, protected_area: pa, species: species, year: 2070, value: 'Dec')
    FactoryGirl.create(:suitability_change, protected_area: pa, species: species, year: 2100, value: 'None')

    csv_mock = mock
    csv_mock.expects(:<<).with(Downloads::Generators::SuitabilityChanges::HEADERS)
    csv_mock.expects(:<<).with(['Antilocapra', 'the order', 'the class', 'Inc', 'Dec', nil])
    CSV.stubs(:open).yields(csv_mock)

    Downloads::Generators::SuitabilityChanges.generate(pa)
  end
end
