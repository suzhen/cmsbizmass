class Ad < ActiveRecord::Base
  belongs_to :ad_space
  before_save :set_ad_size
  mount_uploader :poster, AdUploader

  protected

  def set_ad_size
    width = self.ad_space.width
    height = self.ad_space.height
   
    AdUploader.class_eval do
       @width = width 
       @height = height
       p "||||"
    end
    
  end

end
