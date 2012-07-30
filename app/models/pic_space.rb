class PicSpace < ActiveRecord::Base
  has_many :pictures

  validates :symbol,:presence=>true
  validates_uniqueness_of :name
  validates_uniqueness_of :symbol

end
