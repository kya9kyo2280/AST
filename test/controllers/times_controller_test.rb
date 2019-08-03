require 'test_helper'

class TimesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get times_show_url
    assert_response :success
  end

  test "should get index" do
    get times_index_url
    assert_response :success
  end

  test "should get new" do
    get times_new_url
    assert_response :success
  end

  test "should get cresate" do
    get times_cresate_url
    assert_response :success
  end

  test "should get edit" do
    get times_edit_url
    assert_response :success
  end

  test "should get update" do
    get times_update_url
    assert_response :success
  end

  test "should get destroy" do
    get times_destroy_url
    assert_response :success
  end

end
