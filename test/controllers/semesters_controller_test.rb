require 'test_helper'

class SemestersControllerTest < ActionController::TestCase
  setup do
    @semester = semesters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:semesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semester" do
    assert_difference('Semester.count') do
      post :create, semester: { ayear: @semester.ayear, code: @semester.code, e_date: @semester.e_date, remark: @semester.remark, s_date: @semester.s_date, term: @semester.term }
    end

    assert_redirected_to semester_path(assigns(:semester))
  end

  test "should show semester" do
    get :show, id: @semester
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @semester
    assert_response :success
  end

  test "should update semester" do
    patch :update, id: @semester, semester: { ayear: @semester.ayear, code: @semester.code, e_date: @semester.e_date, remark: @semester.remark, s_date: @semester.s_date, term: @semester.term }
    assert_redirected_to semester_path(assigns(:semester))
  end

  test "should destroy semester" do
    assert_difference('Semester.count', -1) do
      delete :destroy, id: @semester
    end

    assert_redirected_to semesters_path
  end
end
