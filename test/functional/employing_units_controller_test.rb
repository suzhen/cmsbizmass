require 'test_helper'

class EmployingUnitsControllerTest < ActionController::TestCase
  setup do
    @employing_unit = employing_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employing_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employing_unit" do
    assert_difference('EmployingUnit.count') do
      post :create, employing_unit: @employing_unit.attributes
    end

    assert_redirected_to employing_unit_path(assigns(:employing_unit))
  end

  test "should show employing_unit" do
    get :show, id: @employing_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employing_unit
    assert_response :success
  end

  test "should update employing_unit" do
    put :update, id: @employing_unit, employing_unit: @employing_unit.attributes
    assert_redirected_to employing_unit_path(assigns(:employing_unit))
  end

  test "should destroy employing_unit" do
    assert_difference('EmployingUnit.count', -1) do
      delete :destroy, id: @employing_unit
    end

    assert_redirected_to employing_units_path
  end
end
