class Ad < ActiveRecord::Base
  mount_uploader :poster, AdUploader
  belongs_to :ad_space
  before_save :set_ad_size

  protected

  def set_ad_size
    p  self.ad_space.width
    p  self.ad_space.height
  end

end
