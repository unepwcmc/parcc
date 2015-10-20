require 'test_helper'

class ProtectedAreasControllerTest < ActionController::TestCase
  def setup
    @controller = ProtectedAreasController.new

    @pa = FactoryGirl.create(:protected_area)

    taxonomic_classes = [
      FactoryGirl.create(:taxonomic_class, name: 'Amphibian'),
      FactoryGirl.create(:taxonomic_class, name: 'Bird'),
      FactoryGirl.create(:taxonomic_class, name: 'Mammal')
    ]

    taxonomic_classes.each_with_object([]) do |tc, turnovers|
      turnovers |= [
        FactoryGirl.create(:species_turnover,
          protected_area: @pa, taxonomic_class: tc, year: 2040
        ),
        FactoryGirl.create(:species_turnover,
          protected_area: @pa, taxonomic_class: tc, year: 2070
        ),
        FactoryGirl.create(:species_turnover,
          protected_area: @pa, taxonomic_class: tc, year: 2100
        )
      ]
    end
  end

  test '#show returns a success' do
    get :show, id: @pa.wdpa_id
    assert_response :success
  end

  test '#download returns a success' do
    get :download, id: @pa.wdpa_id
    assert_response :success
  end

  test '#vulnerability_table returns a success' do
    get :vulnerability_table, id: @pa.wdpa_id, taxonomic_class: "class"
    assert_response :success
  end

  test '#suitability_changes_table returns a success' do
    get :suitability_changes_table, id: @pa.wdpa_id, taxonomic_class: "class"
    assert_response :success
  end
end
