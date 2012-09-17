require 'markdownable.rb'
class EmployingUnit < ActiveRecord::Base
  paginates_per 20 
  include Markdownable
  has_many :jobs
  scope :show_in_primary,where("showprimary is true") 
  scope :order_created,order("created_at desc")

  mount_uploader :logo,CompanyLogoUploader
end
