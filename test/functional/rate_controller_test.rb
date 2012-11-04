require 'test_helper'

class RateControllerTest < ActionController::TestCase
  test "should get create,destroy" do
    get :create,destroy
    assert_response :success
  end

end
