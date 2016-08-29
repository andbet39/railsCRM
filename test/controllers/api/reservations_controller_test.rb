require 'test_helper'

class Api::ReservationsControllerTest < ActionController::TestCase
  setup do
    @api_reservation = api_reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_reservation" do
    assert_difference('Api::Reservation.count') do
      post :create, api_reservation: {  }
    end

    assert_redirected_to api_reservation_path(assigns(:api_reservation))
  end

  test "should show api_reservation" do
    get :show, id: @api_reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_reservation
    assert_response :success
  end

  test "should update api_reservation" do
    patch :update, id: @api_reservation, api_reservation: {  }
    assert_redirected_to api_reservation_path(assigns(:api_reservation))
  end

  test "should destroy api_reservation" do
    assert_difference('Api::Reservation.count', -1) do
      delete :destroy, id: @api_reservation
    end

    assert_redirected_to api_reservations_path
  end
end
