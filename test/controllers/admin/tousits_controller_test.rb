require 'test_helper'

class Admin::TousitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tousits_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_tousits_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_tousits_edit_url
    assert_response :success
  end

end
