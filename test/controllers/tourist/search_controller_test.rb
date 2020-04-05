require 'test_helper'

class Tourist::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get tourist_search_search_url
    assert_response :success
  end

end
