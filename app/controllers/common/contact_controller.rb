#coding: utf-8
class Common::ContactController < CommonController
  def show
    @record = Record.find_by_category("contact")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end

  end
end
