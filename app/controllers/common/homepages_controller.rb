#coding: utf-8
class Common::HomepagesController < ApplicationController
  def home
    @ad=Ad.last
    respond_to do |format|
      format.html 
    #  format.json { render json: @record }
    end
  end

end
