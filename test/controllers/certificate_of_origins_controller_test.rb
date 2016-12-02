require 'test_helper'

class CertificateOfOriginsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get certificate_of_origins_new_url
    assert_response :success
  end

  test "should get index" do
    get certificate_of_origins_index_url
    assert_response :success
  end

  test "should get show" do
    get certificate_of_origins_show_url
    assert_response :success
  end

  test "should get edit" do
    get certificate_of_origins_edit_url
    assert_response :success
  end

  test "should get create" do
    get certificate_of_origins_create_url
    assert_response :success
  end

  test "should get update" do
    get certificate_of_origins_update_url
    assert_response :success
  end

  test "should get destroy" do
    get certificate_of_origins_destroy_url
    assert_response :success
  end

end
