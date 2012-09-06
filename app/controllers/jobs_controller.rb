#coding: utf-8 
class JobsController < ApplicationController
  before_filter :authenticate_user!  

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new
    @employing_unit = EmployingUnit.find(params[:unit_id])
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
   respond_to do |format|
      format.html
      format.js
    end

  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])
    @employing_unit = EmployingUnit.find(params[:employing_unit_id])
    respond_to do |format|
      if @job.save
        @employing_unit.jobs << @job

        format.html { redirect_to @employing_unit, notice: '新工作职位创建成功。' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])
    @employing_unit = @job.employing_unit
    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @employing_unit, notice: '工作职位更新成功。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @employing_unit = @job.employing_unit
    @job.destroy

    respond_to do |format|
      format.html { redirect_to @employing_unit }
      format.json { head :no_content }
    end
  end
end
