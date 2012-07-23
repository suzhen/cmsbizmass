class Ad < ActiveRecord::Base
  mount_uploader :poster, PosterUploader
end
