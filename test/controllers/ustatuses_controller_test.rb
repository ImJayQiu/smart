require 'test_helper'

class UstatusesControllerTest < ActionController::TestCase
  setup do
    @ustatus = ustatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ustatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ustatus" do
    assert_difference('Ustatus.count') do
      post :create, ustatus: { code: @ustatus.code, date: @ustatus.date, remark: @ustatus.remark, status: @ustatus.status }
    end

    assert_redirected_to ustatus_path(assigns(:ustatus))
  end

  test "should show ustatus" do
    get :show, id: @ustatus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ustatus
    assert_response :success
  end

  test "should update ustatus" do
    patch :update, id: @ustatus, ustatus: { code: @ustatus.code, date: @ustatus.date, remark: @ustatus.remark, status: @ustatus.status }
    assert_redirected_to ustatus_path(assigns(:ustatus))
  end

  test "should destroy ustatus" do
    assert_difference('Ustatus.count', -1) do
      delete :destroy, id: @ustatus
    end

    assert_redirected_to ustatuses_path
  end
end
