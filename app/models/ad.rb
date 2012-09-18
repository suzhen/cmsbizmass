#coding: utf-8
class Ad < ActiveRecord::Base
  validates :name,:presence=>true 
  validates :ad_space,:presence=>true 
  validates :poster,:presence=>true
  validates :listorder,:presence=>true

  validates_numericality_of :listorder, :only_integer => true


  belongs_to :ad_space
  before_save :set_ad_size
  after_find :set_ad_size

  protected

  def set_ad_size
    width = self.ad_space.width
    height = self.ad_space.height
    self.class.mount_uploader :poster, AdUploader do
      AdUploader.class_eval do
        define_method :scale do
           resize_to_fill(width,height)
        end
      end
    end
  end
end
