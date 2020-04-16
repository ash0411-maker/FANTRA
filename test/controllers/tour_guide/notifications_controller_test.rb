require 'test_helper'

class TourGuide::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tour_guide_notifications_index_url
    assert_response :success
  end

end
