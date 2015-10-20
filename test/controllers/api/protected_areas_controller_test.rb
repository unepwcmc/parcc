require 'test_helper'

class ApiProtectedAreasControllerTest < ActionController::TestCase
  PAS_JSON = File.read(
    Rails.root.join('test/fixtures/api_index.json')
  )

  def setup
    @controller = Api::ProtectedAreasController.new
  end

  test '#index should return a success' do
    get :index
    assert_response :success
  end

  test '#index should render the return value of ProtectedArea::for_api' do
    rendered_json = '[{"wdpa_id": 123},{"wdpa_id":345}]'
    ProtectedArea.expects(:for_api).returns(rendered_json)

    get :index
    assert_equal rendered_json, @response.body.squish
  end

  test '#show should render the return value of ProtectedArea#for_api' do
    rendered_json = '{"wdpa_id":345}'

    pa_mock = mock.tap { |mock| mock.expects(:for_api).returns(rendered_json) }
    ProtectedArea.expects(:find_by_wdpa_id).with('345').returns(pa_mock)

    get :show, id: 345
    assert_equal rendered_json, @response.body.squish
  end

  test '#show returns a 404 status code when no PA is found with given wdpa_id' do
    get :show, id: 123
    assert_equal 404, @response.status
  end

  test '#vulnerability should render the return vale of vulnerability_table_for' do
    rendered_json = '[{"wdpa_id": 123},{"wdpa_id":345}]'
    protected_area = FactoryGirl.create(:protected_area)

    SpeciesProtectedArea.expects(:vulnerability_table_for).with(protected_area.id, 'class').returns(rendered_json)

    get :vulnerability, id: protected_area.wdpa_id, taxonomic_class: "class"
    assert_equal rendered_json, @response.body.squish
  end
end
