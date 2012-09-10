#coding: utf-8
class Member < ActiveRecord::Base
  paginates_per 20 
  mount_uploader :logo,CompanyLogoUploader
  validates :name,:presence=>true 
  validates :tel,:presence=>true
  validates :tel,:presence=>true
  validates :address,:presence=>true
  validates_uniqueness_of :name
  scope :show_in_primary,where("showprimary is true") 


  def level
   case self.position
     when "0"
       '理事长'
     when "1"
       '常务理事'
     when "2"
       '理事'
     else ''
    end
  end

end
