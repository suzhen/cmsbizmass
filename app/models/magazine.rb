class Magazine < ActiveRecord::Base
  mount_uploader :elecpdf, MagazineUploader
  mount_uploader :cover, CoverUploader
  scope :order_created,order("created_at desc")

end
