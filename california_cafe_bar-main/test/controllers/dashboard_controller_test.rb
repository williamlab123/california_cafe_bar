require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get dashboard_Index_url
    assert_response :success
  end
end
