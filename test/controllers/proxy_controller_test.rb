require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test "should get cover" do
    get proxy_cover_url
    assert_response :success
  end

end
