require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get justify" do
    get :justify
    assert_response :success
  end

end
