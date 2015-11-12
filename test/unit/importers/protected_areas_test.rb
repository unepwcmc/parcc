require 'test_helper'

class ImportersProtectedAreasTest < ActiveSupport::TestCase
  test '::import calls #import on a new instance' do
    Importers::ProtectedAreas.expects(:new).returns(
      mock.tap { |m| m.expects(:import) }
    )

    Importers::ProtectedAreas.import
  end

  test '#import creates a ProtectedArea from CSV' do
    CSV.stubs(:foreach).returns([{
      wdpaid: 123,
      name: 'Manbone',
      point: 'polygon',
      iucn_cat: 'II',
      designation: 'National Park',
      country: 'BEN'
    }])

    ProtectedArea.expects(:create).with(
      name: 'Manbone',
      wdpa_id: 123,
      iucn_cat: 'II',
      designation: 'National Park',
      iso_3: 'BEN',
      geom_type: 'polygon'
    )

    Importers::ProtectedAreas.import
  end
end
