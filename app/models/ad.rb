class Ad < ActiveRecord::Base
  mount_uploader :poster, PosterUploader
  belongs_to :ad_space
end
