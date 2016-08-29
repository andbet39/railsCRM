require 'test_helper'

class WubookControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get acquire" do
    get :acquire
    assert_response :success
  end

end
