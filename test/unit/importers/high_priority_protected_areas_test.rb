require 'test_helper'
require 'csv'

class TestImportersHighPriorityProtectedAreas < ActiveSupport::TestCase
  test '#import sets high_priority to true to protected areas in the list' do
    pa1 = FactoryGirl.create(
      :protected_area,
      {name: 'Abdoulaye', designation: 'National Reserve'}
    )

    CSV.expects(:foreach).returns([
      {name: 'Abdoulaye', designation: 'National Reserve'}
    ])

    importer = Importers::HighPriorityProtectedAreas.new
    importer.import

    assert_equal true, pa1.reload.high_priority
  end
end
