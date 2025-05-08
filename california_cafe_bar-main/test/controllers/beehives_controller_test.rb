require "test_helper"

class BeehivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beehives_index_url
    assert_response :success
  end
end
