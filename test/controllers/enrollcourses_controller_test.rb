require 'test_helper'

class EnrollcoursesControllerTest < ActionController::TestCase
  setup do
    @enrollcourse = enrollcourses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enrollcourses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enrollcourse" do
    assert_difference('Enrollcourse.count') do
      post :create, enrollcourse: { ccode: @enrollcourse.ccode, code: @enrollcourse.code, remark: @enrollcourse.remark }
    end

    assert_redirected_to enrollcourse_path(assigns(:enrollcourse))
  end

  test "should show enrollcourse" do
    get :show, id: @enrollcourse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enrollcourse
    assert_response :success
  end

  test "should update enrollcourse" do
    patch :update, id: @enrollcourse, enrollcourse: { ccode: @enrollcourse.ccode, code: @enrollcourse.code, remark: @enrollcourse.remark }
    assert_redirected_to enrollcourse_path(assigns(:enrollcourse))
  end

  test "should destroy enrollcourse" do
    assert_difference('Enrollcourse.count', -1) do
      delete :destroy, id: @enrollcourse
    end

    assert_redirected_to enrollcourses_path
  end
end
