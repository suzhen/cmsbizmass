#coding: utf-8
class RecordsController < ApplicationController
  before_filter :authenticate_user!  

  # GET /records
  # GET /records.json
  def index
    @records = Record.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @record = Record.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(params[:record])

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render json: @record, status: :created, location: @record }
      else
        format.html { render action: "new" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])

    respond_to do |format|
      if @record.update_attributes(params[:record])
        if params[:record][:category]=="contact"
          format.html { redirect_to "/manage/contact", notice: '联系方式更新成功。' }
          format.json { head :no_content }
        end
        if params[:record][:category]=="sound"
          format.html { redirect_to "/manage/sound", notice: '首页声音更新成功。' }
          format.json { head :no_content }
        end

      else  
        if params[:record][:category]=="contact"
           format.html { render action: "contact_edit" }
           format.json { render json: @record.errors, status: :unprocessable_entity }
        end
        if params[:record][:category]=="sound"
           format.html { render action: "sound_edit" }
           format.json { render json: @record.errors, status: :unprocessable_entity }
        end

      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url }
      format.json { head :no_content }
    end
  end

  #显示联系我们
  def contact_show
    @record = Record.find_by_category("contact")|| Record.create({:category=>"contact"})

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end
  #新增和修改联系我们
  def contact_edit
    @record= Record.find_by_category("contact") || Record.create({:category=>"contact"})

  end
  #显示首页声音
  def sound_show
    @record = Record.find_by_category("sound")|| Record.create({:category=>"sound"})

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  #新增和修改声音
  def sound_edit
    @record= Record.find_by_category("sound") || Record.create({:category=>"sound"})
    #redirect_to "/manage/sound", notice: '首页声音功能编辑。' 

  end

end
