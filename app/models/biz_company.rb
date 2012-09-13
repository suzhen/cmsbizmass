#coding: utf-8
class BizCompany < ActiveRecord::Base
  validates :name,:presence=>true
  validates :logo,:presence=>true 

  mount_uploader :logo, CompanyLogoUploader
  paginates_per 20 

end
