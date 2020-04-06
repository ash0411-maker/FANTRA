require 'test_helper'

class Tourist::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tourist_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get tourist_orders_show_url
    assert_response :success
  end

end
