#coding: utf-8
require 'chinese_pinyin'
class House < ActiveRecord::Base
  validates :name,:presence=>true
  validates :local,:presence=>true 
  validates :logo,:presence=>true 
  paginates_per 20 

  scope :order_created,order("created_at desc")

  mount_uploader :logo,HousepicUploader

  def to_pinyin_param
    Pinyin.t(name,'').strip
  end
end
