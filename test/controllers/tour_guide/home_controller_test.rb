require 'test_helper'

class TourGuide::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get tour_guide_home_top_url
    assert_response :success
  end

end
