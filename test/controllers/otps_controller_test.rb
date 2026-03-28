require "test_helper"

class OtpsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get otps_new_url
    assert_response :success
  end

  test "should get create" do
    get otps_create_url
    assert_response :success
  end
end
