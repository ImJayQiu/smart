require 'test_helper'

class CscoresControllerTest < ActionController::TestCase
  setup do
    @cscore = cscores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cscores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cscore" do
    assert_difference('Cscore.count') do
      post :create, cscore: { att: @cscore.att, ccode: @cscore.ccode, fin: @cscore.fin, homework: @cscore.homework, mid: @cscore.mid, other: @cscore.other, project: @cscore.project, quiz: @cscore.quiz, remark: @cscore.remark, report: @cscore.report }
    end

    assert_redirected_to cscore_path(assigns(:cscore))
  end

  test "should show cscore" do
    get :show, id: @cscore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cscore
    assert_response :success
  end

  test "should update cscore" do
    patch :update, id: @cscore, cscore: { att: @cscore.att, ccode: @cscore.ccode, fin: @cscore.fin, homework: @cscore.homework, mid: @cscore.mid, other: @cscore.other, project: @cscore.project, quiz: @cscore.quiz, remark: @cscore.remark, report: @cscore.report }
    assert_redirected_to cscore_path(assigns(:cscore))
  end

  test "should destroy cscore" do
    assert_difference('Cscore.count', -1) do
      delete :destroy, id: @cscore
    end

    assert_redirected_to cscores_path
  end
end
