require 'test_helper'

class WbCsvLinesControllerTest < ActionController::TestCase
  setup do
    @wb_csv_line = wb_csv_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wb_csv_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wb_csv_line" do
    assert_difference('WbCsvLine.count') do
      post :create, wb_csv_line: { arrival: @wb_csv_line.arrival, code: @wb_csv_line.code, departure: @wb_csv_line.departure, email: @wb_csv_line.email, name: @wb_csv_line.name, ocode: @wb_csv_line.ocode, origin: @wb_csv_line.origin, phone: @wb_csv_line.phone, price: @wb_csv_line.price, received: @wb_csv_line.received, roomn: @wb_csv_line.roomn, status: @wb_csv_line.status }
    end

    assert_redirected_to wb_csv_line_path(assigns(:wb_csv_line))
  end

  test "should show wb_csv_line" do
    get :show, id: @wb_csv_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wb_csv_line
    assert_response :success
  end

  test "should update wb_csv_line" do
    patch :update, id: @wb_csv_line, wb_csv_line: { arrival: @wb_csv_line.arrival, code: @wb_csv_line.code, departure: @wb_csv_line.departure, email: @wb_csv_line.email, name: @wb_csv_line.name, ocode: @wb_csv_line.ocode, origin: @wb_csv_line.origin, phone: @wb_csv_line.phone, price: @wb_csv_line.price, received: @wb_csv_line.received, roomn: @wb_csv_line.roomn, status: @wb_csv_line.status }
    assert_redirected_to wb_csv_line_path(assigns(:wb_csv_line))
  end

  test "should destroy wb_csv_line" do
    assert_difference('WbCsvLine.count', -1) do
      delete :destroy, id: @wb_csv_line
    end

    assert_redirected_to wb_csv_lines_path
  end
end
