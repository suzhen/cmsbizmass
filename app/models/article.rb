#coding: utf-8
require 'chinese_pinyin'
class Article < ActiveRecord::Base
  belongs_to :category
  has_one :article_body
  validates :title,:presence=>true
  validates :category_id,:presence=>true
  scope :published, where(:published => true)

  accepts_nested_attributes_for :article_body, :allow_destroy => true
  delegate :body, :formatted_html, :to => :article_body
 
  def to_param
    "#{created_at.year}/#{created_at.month.to_s.rjust(2, '0')}/#{created_at.day.to_s.rjust(2, '0')}/#{id}-#{Pinyin.t(title, '')}"

  end

end
