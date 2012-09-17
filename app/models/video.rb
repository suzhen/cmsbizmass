#coding: utf-8
class Video < ActiveRecord::Base
  validates :name,:presence=>true
  validates :thumb,:presence=>true 
  paginates_per 10 
  mount_uploader :thumb,VideoThumbUploader
  scope :show_in_primary,where("showprimary is true") 
  scope :order_created,order("created_at desc")
end
