#coding: utf-8 
class ApplicationController < ActionController::Base
  layout :layout_by_resource

 protected                    
  
  def layout_by_resource       
     return "welcome" if controller_name=="sessions"
     return "application" if ["maps","contact","homepages","magazinepages","infopages","actionpages","landpages","memberpages","hrpages"].include?(controller_name)
     return "clean" if controller_name=="articles" and action_name=="query"


     "admin"
  end

  def after_sign_out_path_for(resource_or_scope)
   "/users/sign_in"           
  end
  
  def after_sign_in_path_for(resource)
    "/manage/enterprises"                   
  end



  protect_from_forgery
end
