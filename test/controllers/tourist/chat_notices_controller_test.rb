require 'test_helper'

class Tourist::ChatNoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tourist_chat_notices_index_url
    assert_response :success
  end

end
