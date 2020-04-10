require 'test_helper'

class TourGuide::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tour_guide_rooms_show_url
    assert_response :success
  end

end
