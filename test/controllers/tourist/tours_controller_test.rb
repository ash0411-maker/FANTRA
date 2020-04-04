require 'test_helper'

class Tourist::ToursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tourist_tours_index_url
    assert_response :success
  end

  test "should get show" do
    get tourist_tours_show_url
    assert_response :success
  end

end
