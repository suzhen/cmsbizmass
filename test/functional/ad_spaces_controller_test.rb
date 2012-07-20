require 'test_helper'

class AdSpacesControllerTest < ActionController::TestCase
  setup do
    @ad_space = ad_spaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_spaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_space" do
    assert_difference('AdSpace.count') do
      post :create, ad_space: @ad_space.attributes
    end

    assert_redirected_to ad_space_path(assigns(:ad_space))
  end

  test "should show ad_space" do
    get :show, id: @ad_space
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_space
    assert_response :success
  end

  test "should update ad_space" do
    put :update, id: @ad_space, ad_space: @ad_space.attributes
    assert_redirected_to ad_space_path(assigns(:ad_space))
  end

  test "should destroy ad_space" do
    assert_difference('AdSpace.count', -1) do
      delete :destroy, id: @ad_space
    end

    assert_redirected_to ad_spaces_path
  end
end
