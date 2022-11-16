require "test_helper"

class ProvinceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get province_index_url
    assert_response :success
  end

  test "should get show" do
    get province_show_url
    assert_response :success
  end
end
