class AdSpacesController < ApplicationController
  # GET /ad_spaces
  # GET /ad_spaces.json
  def index
    @ad_spaces = AdSpace.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ad_spaces }
    end
  end

  # GET /ad_spaces/1
  # GET /ad_spaces/1.json
  def show
    @ad_space = AdSpace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad_space }
    end
  end

  # GET /ad_spaces/new
  # GET /ad_spaces/new.json
  def new
    @ad_space = AdSpace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad_space }
    end
  end

  # GET /ad_spaces/1/edit
  def edit
    @ad_space = AdSpace.find(params[:id])
  end

  # POST /ad_spaces
  # POST /ad_spaces.json
  def create
    @ad_space = AdSpace.new(params[:ad_space])

    respond_to do |format|
      if @ad_space.save
        format.html { redirect_to @ad_space, notice: 'Ad space was successfully created.' }
        format.json { render json: @ad_space, status: :created, location: @ad_space }
      else
        format.html { render action: "new" }
        format.json { render json: @ad_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ad_spaces/1
  # PUT /ad_spaces/1.json
  def update
    @ad_space = AdSpace.find(params[:id])

    respond_to do |format|
      if @ad_space.update_attributes(params[:ad_space])
        format.html { redirect_to @ad_space, notice: 'Ad space was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_spaces/1
  # DELETE /ad_spaces/1.json
  def destroy
    @ad_space = AdSpace.find(params[:id])
    @ad_space.destroy

    respond_to do |format|
      format.html { redirect_to ad_spaces_url }
      format.json { head :no_content }
    end
  end
end
