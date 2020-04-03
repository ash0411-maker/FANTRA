require 'test_helper'

class TourGuide::GuidesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tour_guide_guides_show_url
    assert_response :success
  end

  test "should get edit" do
    get tour_guide_guides_edit_url
    assert_response :success
  end

end
