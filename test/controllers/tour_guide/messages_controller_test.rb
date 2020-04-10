require 'test_helper'

class TourGuide::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tour_guide_messages_show_url
    assert_response :success
  end

end
