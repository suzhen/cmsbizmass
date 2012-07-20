class Link < ActiveRecord::Base
  mount_uploader :logo, LinkUploader
end
