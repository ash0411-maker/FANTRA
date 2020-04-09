require 'test_helper'

class Admin::GuideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_guide_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_guide_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_guide_edit_url
    assert_response :success
  end

end
