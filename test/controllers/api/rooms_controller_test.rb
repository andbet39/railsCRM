require 'test_helper'

class Api::RoomsControllerTest < ActionController::TestCase
  setup do
    @api_room = api_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_room" do
    assert_difference('Api::Room.count') do
      post :create, api_room: {  }
    end

    assert_redirected_to api_room_path(assigns(:api_room))
  end

  test "should show api_room" do
    get :show, id: @api_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_room
    assert_response :success
  end

  test "should update api_room" do
    patch :update, id: @api_room, api_room: {  }
    assert_redirected_to api_room_path(assigns(:api_room))
  end

  test "should destroy api_room" do
    assert_difference('Api::Room.count', -1) do
      delete :destroy, id: @api_room
    end

    assert_redirected_to api_rooms_path
  end
end
