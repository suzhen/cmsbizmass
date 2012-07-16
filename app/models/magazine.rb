class Magazine < ActiveRecord::Base
  mount_uploader :elecpdf, MagazineUploader
  mount_uploader :cover, MagazineUploader

end
