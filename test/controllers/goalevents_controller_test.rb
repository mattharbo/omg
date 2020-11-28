require 'test_helper'

class GoaleventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get goalevents_index_url
    assert_response :success
  end

end
