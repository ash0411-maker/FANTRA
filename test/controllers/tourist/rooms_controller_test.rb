require 'test_helper'

class Tourist::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tourist_rooms_show_url
    assert_response :success
  end

end
