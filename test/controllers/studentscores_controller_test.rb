require 'test_helper'

class StudentscoresControllerTest < ActionController::TestCase
  setup do
    @studentscore = studentscores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studentscores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create studentscore" do
    assert_difference('Studentscore.count') do
      post :create, studentscore: { att: @studentscore.att, course_code: @studentscore.course_code, fin: @studentscore.fin, homework: @studentscore.homework, mid: @studentscore.mid, project: @studentscore.project, quiz: @studentscore.quiz, remark: @studentscore.remark, report: @studentscore.report, student_code: @studentscore.student_code }
    end

    assert_redirected_to studentscore_path(assigns(:studentscore))
  end

  test "should show studentscore" do
    get :show, id: @studentscore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @studentscore
    assert_response :success
  end

  test "should update studentscore" do
    patch :update, id: @studentscore, studentscore: { att: @studentscore.att, course_code: @studentscore.course_code, fin: @studentscore.fin, homework: @studentscore.homework, mid: @studentscore.mid, project: @studentscore.project, quiz: @studentscore.quiz, remark: @studentscore.remark, report: @studentscore.report, student_code: @studentscore.student_code }
    assert_redirected_to studentscore_path(assigns(:studentscore))
  end

  test "should destroy studentscore" do
    assert_difference('Studentscore.count', -1) do
      delete :destroy, id: @studentscore
    end

    assert_redirected_to studentscores_path
  end
end
