require 'test_helper'

class HazardtypesControllerTest < ActionController::TestCase
  setup do
    @hazardtype = hazardtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hazardtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hazardtype" do
    assert_difference('Hazardtype.count') do
      post :create, hazardtype: { code: @hazardtype.code, des: @hazardtype.des, name: @hazardtype.name, remark: @hazardtype.remark }
    end

    assert_redirected_to hazardtype_path(assigns(:hazardtype))
  end

  test "should show hazardtype" do
    get :show, id: @hazardtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hazardtype
    assert_response :success
  end

  test "should update hazardtype" do
    patch :update, id: @hazardtype, hazardtype: { code: @hazardtype.code, des: @hazardtype.des, name: @hazardtype.name, remark: @hazardtype.remark }
    assert_redirected_to hazardtype_path(assigns(:hazardtype))
  end

  test "should destroy hazardtype" do
    assert_difference('Hazardtype.count', -1) do
      delete :destroy, id: @hazardtype
    end

    assert_redirected_to hazardtypes_path
  end
end
