require 'test_helper'

class LegalProfilesControllerTest < ActionController::TestCase
  setup do
    @legal_profile = legal_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:legal_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create legal_profile" do
    assert_difference('LegalProfile.count') do
      post :create, legal_profile: { cnpj: @legal_profile.cnpj }
    end

    assert_redirected_to legal_profile_path(assigns(:legal_profile))
  end

  test "should show legal_profile" do
    get :show, id: @legal_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @legal_profile
    assert_response :success
  end

  test "should update legal_profile" do
    patch :update, id: @legal_profile, legal_profile: { cnpj: @legal_profile.cnpj }
    assert_redirected_to legal_profile_path(assigns(:legal_profile))
  end

  test "should destroy legal_profile" do
    assert_difference('LegalProfile.count', -1) do
      delete :destroy, id: @legal_profile
    end

    assert_redirected_to legal_profiles_path
  end
end
