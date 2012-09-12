#coding: utf-8
class PropertyManagementCompany < ActiveRecord::Base
  validates :name,:presence=>true
  validates :local,:presence=>true 
  paginates_per 20 

end
