require "test_helper"

class Api::V1::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get me" do
    get api_v1_notifications_me_url
    assert_response :success
  end
end
