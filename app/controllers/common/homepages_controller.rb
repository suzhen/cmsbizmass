#coding: utf-8
class Common::HomepagesController < ApplicationController
  def home

    respond_to do |format|
      format.html # show.html.erb
    #  format.json { render json: @record }
    end
  end

end
