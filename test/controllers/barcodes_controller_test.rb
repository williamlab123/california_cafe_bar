require "test_helper"

class BarcodesControllerTest < ActionDispatch::IntegrationTest
  test "should get scan" do
    get barcodes_scan_url
    assert_response :success
  end

  test "should get search" do
    get barcodes_search_url
    assert_response :success
  end
end
