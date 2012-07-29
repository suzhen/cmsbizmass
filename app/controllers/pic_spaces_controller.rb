class PicSpacesController < ApplicationController
  # GET /pic_spaces
  # GET /pic_spaces.json
  def index
    @pic_spaces = PicSpace.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pic_spaces }
    end
  end

  # GET /pic_spaces/1
  # GET /pic_spaces/1.json
  def show
    @pic_space = PicSpace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pic_space }
    end
  end

  # GET /pic_spaces/new
  # GET /pic_spaces/new.json
  def new
    @pic_space = PicSpace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pic_space }
    end
  end

  # GET /pic_spaces/1/edit
  def edit
    @pic_space = PicSpace.find(params[:id])
  end

  # POST /pic_spaces
  # POST /pic_spaces.json
  def create
    @pic_space = PicSpace.new(params[:pic_space])

    respond_to do |format|
      if @pic_space.save
        format.html { redirect_to @pic_space, notice: 'Pic space was successfully created.' }
        format.json { render json: @pic_space, status: :created, location: @pic_space }
      else
        format.html { render action: "new" }
        format.json { render json: @pic_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pic_spaces/1
  # PUT /pic_spaces/1.json
  def update
    @pic_space = PicSpace.find(params[:id])

    respond_to do |format|
      if @pic_space.update_attributes(params[:pic_space])
        format.html { redirect_to @pic_space, notice: 'Pic space was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pic_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pic_spaces/1
  # DELETE /pic_spaces/1.json
  def destroy
    @pic_space = PicSpace.find(params[:id])
    @pic_space.destroy

    respond_to do |format|
      format.html { redirect_to pic_spaces_url }
      format.json { head :no_content }
    end
  end
end
