class Picture < ActiveRecord::Base
  belongs_to :category
  belongs_to :pic_space
  belongs_to :article
end
