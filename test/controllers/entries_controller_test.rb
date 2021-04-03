require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get entries_create_url
    assert_response :success
  end

  test "should get destroy" do
    get entries_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get entries_edit_url
    assert_response :success
  end

  test "should get index" do
    get entries_index_url
    assert_response :success
  end

  test "should get logged_in" do
    get entries_logged_in_url
    assert_response :success
  end

  test "should get new" do
    get entries_new_url
    assert_response :success
  end

  test "should get not_logged_in" do
    get entries_not_logged_in_url
    assert_response :success
  end

  test "should get show" do
    get entries_show_url
    assert_response :success
  end

  test "should get update" do
    get entries_update_url
    assert_response :success
  end
end
