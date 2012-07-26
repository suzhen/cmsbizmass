#coding: utf-8
class Common::HomepagesController < ApplicationController
  def home
    @ad=Ad.last
    respond_to do |format|
      format.html 
    end
  end
  
  def detail
    @ad=Ad.last
    respond_to do |format|
      format.html 
    end
  end

end
