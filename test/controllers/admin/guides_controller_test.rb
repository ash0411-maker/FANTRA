require 'test_helper'

class Admin::GuidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_guides_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_guides_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_guides_edit_url
    assert_response :success
  end

end
