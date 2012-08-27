class Picture < ActiveRecord::Base
  belongs_to :category
  belongs_to :pic_space
  belongs_to :article
  validates :pic_space,:presence=>true
  validates :title,:presence=>true
  validates :description,:presence=>true
  validates :category,:presence=>true
  mount_uploader :picture,PictureUploader
end
