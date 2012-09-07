require 'markdownable.rb'
class EmployingUnit < ActiveRecord::Base
  paginates_per 20 
  include Markdownable
  has_many :jobs
  scope :show_in_primary,where("showprimary is true") 

  mount_uploader :logo,CompanyLogoUploader
end
