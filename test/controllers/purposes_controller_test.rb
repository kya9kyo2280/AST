require 'test_helper'

class PurposesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get purposes_show_url
    assert_response :success
  end

  test "should get index" do
    get purposes_index_url
    assert_response :success
  end

  test "should get new" do
    get purposes_new_url
    assert_response :success
  end

  test "should get cresate" do
    get purposes_cresate_url
    assert_response :success
  end

  test "should get edit" do
    get purposes_edit_url
    assert_response :success
  end

  test "should get update" do
    get purposes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get purposes_destroy_url
    assert_response :success
  end

end
