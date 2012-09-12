require 'test_helper'

class BizCompaniesControllerTest < ActionController::TestCase
  setup do
    @biz_company = biz_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:biz_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create biz_company" do
    assert_difference('BizCompany.count') do
      post :create, biz_company: @biz_company.attributes
    end

    assert_redirected_to biz_company_path(assigns(:biz_company))
  end

  test "should show biz_company" do
    get :show, id: @biz_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @biz_company
    assert_response :success
  end

  test "should update biz_company" do
    put :update, id: @biz_company, biz_company: @biz_company.attributes
    assert_redirected_to biz_company_path(assigns(:biz_company))
  end

  test "should destroy biz_company" do
    assert_difference('BizCompany.count', -1) do
      delete :destroy, id: @biz_company
    end

    assert_redirected_to biz_companies_path
  end
end
