require "test_helper"

class ExploreControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get explore_show_url
    assert_response :success
  end
end
