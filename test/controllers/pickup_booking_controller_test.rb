require 'test_helper'

class PickupBookingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get check" do
    get :check
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
