require "test_helper"

class Api::V1::AmenitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_amenities_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_amenities_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_amenities_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_amenities_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_amenities_destroy_url
    assert_response :success
  end
end
