require 'test_helper'

class HazardsControllerTest < ActionController::TestCase
  setup do
    @hazard = hazards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hazards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hazard" do
    assert_difference('Hazard.count') do
      post :create, hazard: { crda: @hazard.crda, educaff: @hazard.educaff, hda: @hazard.hda, hde: @hazard.hde, hosaff: @hazard.hosaff, htype: @hazard.htype, paff: @hazard.paff, pde: @hazard.pde, peva: @hazard.peva, pin: @hazard.pin, pmiss: @hazard.pmiss, prel: @hazard.prel, remakr: @hazard.remakr, roda: @hazard.roda, year: @hazard.year }
    end

    assert_redirected_to hazard_path(assigns(:hazard))
  end

  test "should show hazard" do
    get :show, id: @hazard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hazard
    assert_response :success
  end

  test "should update hazard" do
    patch :update, id: @hazard, hazard: { crda: @hazard.crda, educaff: @hazard.educaff, hda: @hazard.hda, hde: @hazard.hde, hosaff: @hazard.hosaff, htype: @hazard.htype, paff: @hazard.paff, pde: @hazard.pde, peva: @hazard.peva, pin: @hazard.pin, pmiss: @hazard.pmiss, prel: @hazard.prel, remakr: @hazard.remakr, roda: @hazard.roda, year: @hazard.year }
    assert_redirected_to hazard_path(assigns(:hazard))
  end

  test "should destroy hazard" do
    assert_difference('Hazard.count', -1) do
      delete :destroy, id: @hazard
    end

    assert_redirected_to hazards_path
  end
end
