require 'test_helper'

class TourGuide::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tour_guide_orders_index_url
    assert_response :success
  end

  test "should get edit" do
    get tour_guide_orders_edit_url
    assert_response :success
  end

end
