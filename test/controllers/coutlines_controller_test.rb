require 'test_helper'

class CoutlinesControllerTest < ActionController::TestCase
  setup do
    @coutline = coutlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coutlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coutline" do
    assert_difference('Coutline.count') do
      post :create, coutline: { code: @coutline.code, ctype: @coutline.ctype, des: @coutline.des, ename: @coutline.ename, major: @coutline.major, name: @coutline.name }
    end

    assert_redirected_to coutline_path(assigns(:coutline))
  end

  test "should show coutline" do
    get :show, id: @coutline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coutline
    assert_response :success
  end

  test "should update coutline" do
    patch :update, id: @coutline, coutline: { code: @coutline.code, ctype: @coutline.ctype, des: @coutline.des, ename: @coutline.ename, major: @coutline.major, name: @coutline.name }
    assert_redirected_to coutline_path(assigns(:coutline))
  end

  test "should destroy coutline" do
    assert_difference('Coutline.count', -1) do
      delete :destroy, id: @coutline
    end

    assert_redirected_to coutlines_path
  end
end
