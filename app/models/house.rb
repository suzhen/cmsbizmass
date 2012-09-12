#coding: utf-8
class House < ActiveRecord::Base
  validates :name,:presence=>true
  validates :local,:presence=>true 
  validates :logo,:presence=>true 
  paginates_per 20 

  mount_uploader :logo,HousepicUploader
end
