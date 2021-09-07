require 'test_helper'

class LinebotControllerTest < ActionDispatch::IntegrationTest
  test "should get collback" do
    get linebot_collback_url
    assert_response :success
  end

end
