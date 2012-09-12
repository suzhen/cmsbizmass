require 'test_helper'

class PropertyManagementCompaniesControllerTest < ActionController::TestCase
  setup do
    @property_management_company = property_management_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:property_management_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property_management_company" do
    assert_difference('PropertyManagementCompany.count') do
      post :create, property_management_company: @property_management_company.attributes
    end

    assert_redirected_to property_management_company_path(assigns(:property_management_company))
  end

  test "should show property_management_company" do
    get :show, id: @property_management_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property_management_company
    assert_response :success
  end

  test "should update property_management_company" do
    put :update, id: @property_management_company, property_management_company: @property_management_company.attributes
    assert_redirected_to property_management_company_path(assigns(:property_management_company))
  end

  test "should destroy property_management_company" do
    assert_difference('PropertyManagementCompany.count', -1) do
      delete :destroy, id: @property_management_company
    end

    assert_redirected_to property_management_companies_path
  end
end
