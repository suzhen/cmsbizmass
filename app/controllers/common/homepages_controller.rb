#coding: utf-8
require "yaml"
class Common::HomepagesController < ApplicationController
  $pageconfig = File.open('webconfig/page.yml') { |is|  YAML::load(is) }

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
