require 'test_helper'

class PicSpacesControllerTest < ActionController::TestCase
  setup do
    @pic_space = pic_spaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pic_spaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pic_space" do
    assert_difference('PicSpace.count') do
      post :create, pic_space: @pic_space.attributes
    end

    assert_redirected_to pic_space_path(assigns(:pic_space))
  end

  test "should show pic_space" do
    get :show, id: @pic_space
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pic_space
    assert_response :success
  end

  test "should update pic_space" do
    put :update, id: @pic_space, pic_space: @pic_space.attributes
    assert_redirected_to pic_space_path(assigns(:pic_space))
  end

  test "should destroy pic_space" do
    assert_difference('PicSpace.count', -1) do
      delete :destroy, id: @pic_space
    end

    assert_redirected_to pic_spaces_path
  end
end
