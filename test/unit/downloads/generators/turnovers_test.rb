require 'test_helper'

class DownloadsGeneratorsTurnoversTest < ActiveSupport::TestCase
  test '::generate, given a ProtectedArea, returns a path to the created csv' do
    pa = FactoryGirl.build(:protected_area)
    expected_path = Rails.root.join("tmp/downloads/#{pa.wdpa_id}_turnovers.csv")

    CSV.stubs(:open)
    assert_equal expected_path, Downloads::Generators::Turnovers.generate(pa)
  end

  test '::generate, given a ProtectedArea, creates a csv file' do
    pa = FactoryGirl.create(:protected_area)
    taxo_class = FactoryGirl.create(:taxonomic_class, name: 'the class')
    turnovers = [
      FactoryGirl.create(:species_turnover, protected_area: pa, taxonomic_class: taxo_class, year: 2040, median: '0.5', upper: '0.75', lower: '0.25'),
      FactoryGirl.create(:species_turnover, protected_area: pa, taxonomic_class: taxo_class, year: 2070, median: '0.5', upper: '0.75', lower: '0.25'),
      FactoryGirl.create(:species_turnover, protected_area: pa, taxonomic_class: taxo_class, year: 2100, median: '0.5', upper: '0.75', lower: '0.25')
    ]

    pa.species_turnovers = turnovers

    csv_mock = mock
    csv_mock.expects(:<<).with(Downloads::Generators::Turnovers::HEADERS)
    csv_mock.expects(:<<).with(['the class', 0.25, 0.5, 0.75, 0.25, 0.5, 0.75, 0.25, 0.5, 0.75])
    CSV.stubs(:open).yields(csv_mock)

    Downloads::Generators::Turnovers.generate(pa)
  end
end

