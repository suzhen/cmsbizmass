#coding: utf-8
require 'chinese_pinyin'
class PropertyManagementCompany < ActiveRecord::Base
  validates :name,:presence=>true
  validates :local,:presence=>true 
  paginates_per 20 
  scope :order_created,order("created_at desc")
 
  def to_pinyin_param
    Pinyin.t(name,'').strip
  end
end
