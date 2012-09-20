#coding: utf-8
class Common::InfopagesController < CommonController
  def primary


  end
  
  def detail
    respond_to do |format|
      format.html 
    end
  end

end
