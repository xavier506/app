require 'test_helper'

class NotifiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get notifies_new_url
    assert_response :success
  end

  test "should get index" do
    get notifies_index_url
    assert_response :success
  end

  test "should get show" do
    get notifies_show_url
    assert_response :success
  end

  test "should get edit" do
    get notifies_edit_url
    assert_response :success
  end

  test "should get create" do
    get notifies_create_url
    assert_response :success
  end

  test "should get update" do
    get notifies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get notifies_destroy_url
    assert_response :success
  end

end
