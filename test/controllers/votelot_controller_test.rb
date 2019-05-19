require 'test_helper'

class VotelotControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get votelot_new_url
    assert_response :success
  end

end
