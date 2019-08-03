require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get events_show_url
    assert_response :success
  end

  test "should get index" do
    get events_index_url
    assert_response :success
  end

  test "should get new" do
    get events_new_url
    assert_response :success
  end

  test "should get cresate" do
    get events_cresate_url
    assert_response :success
  end

  test "should get edit" do
    get events_edit_url
    assert_response :success
  end

  test "should get update" do
    get events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get events_destroy_url
    assert_response :success
  end

end
