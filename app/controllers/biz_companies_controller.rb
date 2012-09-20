#coding: utf-8 
class BizCompaniesController < ApplicationController
  # GET /biz_companies
  # GET /biz_companies.json
  def index
    @biz_companies = BizCompany.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @biz_companies }
    end
  end

  # GET /biz_companies/1
  # GET /biz_companies/1.json
  def show
    @biz_company = BizCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @biz_company }
    end
  end

  # GET /biz_companies/new
  # GET /biz_companies/new.json
  def new
    @biz_company = BizCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @biz_company }
    end
  end

  # GET /biz_companies/1/edit
  def edit
    @biz_company = BizCompany.find(params[:id])
  end

  # POST /biz_companies
  # POST /biz_companies.json
  def create
    @biz_company = BizCompany.new(params[:biz_company])

    respond_to do |format|
      if @biz_company.save
        format.html { redirect_to @biz_company, notice: '商业品牌创建成功。' }
        format.json { render json: @biz_company, status: :created, location: @biz_company }
      else
        format.html { render action: "new" }
        format.json { render json: @biz_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /biz_companies/1
  # PUT /biz_companies/1.json
  def update
    @biz_company = BizCompany.find(params[:id])

    respond_to do |format|
      if @biz_company.update_attributes(params[:biz_company])
        format.html { redirect_to @biz_company, notice: '商业品牌更新成功。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @biz_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biz_companies/1
  # DELETE /biz_companies/1.json
  def destroy
    @biz_company = BizCompany.find(params[:id])
    @biz_company.destroy

    respond_to do |format|
      format.html { redirect_to biz_companies_url }
      format.json { head :no_content }
    end
  end
end
