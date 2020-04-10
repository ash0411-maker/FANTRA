require 'test_helper'

class Admin::TouristsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tourists_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_tourists_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_tourists_edit_url
    assert_response :success
  end

end
