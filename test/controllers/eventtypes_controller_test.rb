require 'test_helper'

class EventtypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eventtypes_index_url
    assert_response :success
  end

end
