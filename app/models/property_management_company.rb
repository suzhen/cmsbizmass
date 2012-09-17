#coding: utf-8
class PropertyManagementCompany < ActiveRecord::Base
  validates :name,:presence=>true
  validates :local,:presence=>true 
  paginates_per 20 
  scope :order_created,order("created_at desc")

end
