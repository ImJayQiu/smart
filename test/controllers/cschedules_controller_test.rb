require 'test_helper'

class CschedulesControllerTest < ActionController::TestCase
  setup do
    @cschedule = cschedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cschedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cschedule" do
    assert_difference('Cschedule.count') do
      post :create, cschedule: { att: @cschedule.att, ayear: @cschedule.ayear, c_code: @cschedule.c_code, code: @cschedule.code, etime: @cschedule.etime, homework: @cschedule.homework, lecturer: @cschedule.lecturer, mid: @cschedule.mid, project: @cschedule.project, report: @cschedule.report, room: @cschedule.room, stime: @cschedule.stime, term: @cschedule.term }
    end

    assert_redirected_to cschedule_path(assigns(:cschedule))
  end

  test "should show cschedule" do
    get :show, id: @cschedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cschedule
    assert_response :success
  end

  test "should update cschedule" do
    patch :update, id: @cschedule, cschedule: { att: @cschedule.att, ayear: @cschedule.ayear, c_code: @cschedule.c_code, code: @cschedule.code, etime: @cschedule.etime, homework: @cschedule.homework, lecturer: @cschedule.lecturer, mid: @cschedule.mid, project: @cschedule.project, report: @cschedule.report, room: @cschedule.room, stime: @cschedule.stime, term: @cschedule.term }
    assert_redirected_to cschedule_path(assigns(:cschedule))
  end

  test "should destroy cschedule" do
    assert_difference('Cschedule.count', -1) do
      delete :destroy, id: @cschedule
    end

    assert_redirected_to cschedules_path
  end
end
