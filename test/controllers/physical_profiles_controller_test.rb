require 'test_helper'

class PhysicalProfilesControllerTest < ActionController::TestCase
  setup do
    @physical_profile = physical_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_profile" do
    assert_difference('PhysicalProfile.count') do
      post :create, physical_profile: { cpf: @physical_profile.cpf }
    end

    assert_redirected_to physical_profile_path(assigns(:physical_profile))
  end

  test "should show physical_profile" do
    get :show, id: @physical_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_profile
    assert_response :success
  end

  test "should update physical_profile" do
    patch :update, id: @physical_profile, physical_profile: { cpf: @physical_profile.cpf }
    assert_redirected_to physical_profile_path(assigns(:physical_profile))
  end

  test "should destroy physical_profile" do
    assert_difference('PhysicalProfile.count', -1) do
      delete :destroy, id: @physical_profile
    end

    assert_redirected_to physical_profiles_path
  end
end
