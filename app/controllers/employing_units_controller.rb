#coding: utf-8 
class EmployingUnitsController < ApplicationController
  before_filter :authenticate_user!  

  # GET /employing_units
  # GET /employing_units.json
  def index
    @employing_units = EmployingUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employing_units }
    end
  end

  # GET /employing_units/1
  # GET /employing_units/1.json
  def show
    @employing_unit = EmployingUnit.find(params[:id])
    @job=Job.new
    @jobs=@employing_unit.jobs
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employing_unit }
    end
  end

  # GET /employing_units/new
  # GET /employing_units/new.json
  def new
    @employing_unit = EmployingUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employing_unit }
    end
  end

  # GET /employing_units/1/edit
  def edit
    @employing_unit = EmployingUnit.find(params[:id])
  end

  # POST /employing_units
  # POST /employing_units.json
  def create
    @employing_unit = EmployingUnit.new(params[:employing_unit])
    respond_to do |format|
      if @employing_unit.save
        format.html { redirect_to @employing_unit, notice: '招聘单位创建成功。' }
        format.json { render json: @employing_unit, status: :created, location: @employing_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @employing_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employing_units/1
  # PUT /employing_units/1.json
  def update
    @employing_unit = EmployingUnit.find(params[:id])

    respond_to do |format|
      if @employing_unit.update_attributes(params[:employing_unit])
        format.html { redirect_to @employing_unit, notice: '招聘单位更新成功。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employing_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employing_units/1
  # DELETE /employing_units/1.json
  def destroy
    @employing_unit = EmployingUnit.find(params[:id])
    @employing_unit.destroy

    respond_to do |format|
      format.html { redirect_to employing_units_url }
      format.json { head :no_content }
    end
  end
end
