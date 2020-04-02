require 'test_helper'

class TourGuide::ToursControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tour_guide_tours_new_url
    assert_response :success
  end

  test "should get show" do
    get tour_guide_tours_show_url
    assert_response :success
  end

  test "should get index" do
    get tour_guide_tours_index_url
    assert_response :success
  end

  test "should get edit" do
    get tour_guide_tours_edit_url
    assert_response :success
  end

end
