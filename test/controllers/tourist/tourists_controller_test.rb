require 'test_helper'

class Tourist::TouristsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tourist_tourists_show_url
    assert_response :success
  end

  test "should get edit" do
    get tourist_tourists_edit_url
    assert_response :success
  end

end
