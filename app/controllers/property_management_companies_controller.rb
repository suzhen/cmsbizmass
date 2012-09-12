#coding: utf-8 
class PropertyManagementCompaniesController < ApplicationController
  # GET /property_management_companies
  # GET /property_management_companies.json
  def index
    @property_management_companies = PropertyManagementCompany.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @property_management_companies }
    end
  end

  # GET /property_management_companies/1
  # GET /property_management_companies/1.json
  def show
    @property_management_company = PropertyManagementCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property_management_company }
    end
  end

  # GET /property_management_companies/new
  # GET /property_management_companies/new.json
  def new
    @property_management_company = PropertyManagementCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property_management_company }
    end
  end

  # GET /property_management_companies/1/edit
  def edit
    @property_management_company = PropertyManagementCompany.find(params[:id])
  end

  # POST /property_management_companies
  # POST /property_management_companies.json
  def create
    @property_management_company = PropertyManagementCompany.new(params[:property_management_company])

    respond_to do |format|
      if @property_management_company.save
        format.html { redirect_to @property_management_company, notice: 'Property management company was successfully created.' }
        format.json { render json: @property_management_company, status: :created, location: @property_management_company }
      else
        format.html { render action: "new" }
        format.json { render json: @property_management_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /property_management_companies/1
  # PUT /property_management_companies/1.json
  def update
    @property_management_company = PropertyManagementCompany.find(params[:id])

    respond_to do |format|
      if @property_management_company.update_attributes(params[:property_management_company])
        format.html { redirect_to @property_management_company, notice: 'Property management company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property_management_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_management_companies/1
  # DELETE /property_management_companies/1.json
  def destroy
    @property_management_company = PropertyManagementCompany.find(params[:id])
    @property_management_company.destroy

    respond_to do |format|
      format.html { redirect_to property_management_companies_url }
      format.json { head :no_content }
    end
  end
end
