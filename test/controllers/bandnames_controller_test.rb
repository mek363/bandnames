require 'test_helper'

class BandnamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bandnames_new_url
    assert_response :success
  end

end
