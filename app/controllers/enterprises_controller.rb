#coding: utf-8 
class EnterprisesController < ApplicationController
  before_filter :authenticate_user!  
  # GET /enterprises
  # GET /enterprises.json
  def index
    @enterprises = Enterprise.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /enterprises/1
  # GET /enterprises/1.json
  def show
    @enterprise = Enterprise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /enterprises/new
  # GET /enterprises/new.json
  def new
    @enterprise = Enterprise.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /enterprises/1/edit
  def edit
    @enterprise = Enterprise.find(params[:id])
  end

  # POST /enterprises
  # POST /enterprises.json
  def create
    @enterprise = Enterprise.new(params[:enterprise])

    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise,:notice=> 'Enterprise was successfully created.' }
      else
        format.html { render :action=> "new" }
      end
    end
  end

  # PUT /enterprises/1
  # PUT /enterprises/1.json
  def update
    @enterprise = Enterprise.find(params[:id])

    respond_to do |format|
      if @enterprise.update_attributes(params[:enterprise])
        format.html { redirect_to @enterprise, :notice=> 'Enterprise was successfully updated.' }
      else
        format.html { render :action=> "edit" }
      end
    end
  end

  # DELETE /enterprises/1
  # DELETE /enterprises/1.json
  def destroy
    @enterprise = Enterprise.find(params[:id])
    @enterprise.destroy

    respond_to do |format|
      format.html { redirect_to enterprises_url }
    end
  end
end
