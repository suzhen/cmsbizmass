class Ad < ActiveRecord::Base
  @@width=nil
  belongs_to :ad_space
  #before_save :set_ad_size
  after_initialize :set_ad_size
  mount_uploader :poster, AdUploader do
    p @@width
    p "#####################"
    AdUploader.class_eval do
       #@width = 100 
       #@height = 100
       def scale
          #resize_to_fill(100,100)
       end
    end

  end

  protected

  def set_ad_size
    @@width = self.ad_space.width
    @height = self.ad_space.height
  end

end
