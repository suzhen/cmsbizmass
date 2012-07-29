#coding: utf-8
require 'chinese_pinyin'
class Article < ActiveRecord::Base
  belongs_to :category
  has_one :article_body
  has_many :pictures

  validates :title,:presence=>true
  validates :category_id,:presence=>true
  scope :published, where(:published => true)

  accepts_nested_attributes_for :article_body, :allow_destroy => true
  delegate :body, :formatted_html, :to => :article_body
 
  def to_page_param
    "#{created_at.year}/#{created_at.month.to_s.rjust(2, '0')}/#{created_at.day.to_s.rjust(2, '0')}/#{id}-#{Pinyin.t(title, '')}"
  end

  def category_chain
    categories=""
    arr_cat=category.arrparentid.split(",")
    arr_cat<<category.id.to_s
    arr_cat.each do |id|
       categories+="<a href='/news?category_id=#{id}'>#{Category.find(id).name}</a>"+" — >" unless id=="0" 
    end 
    categories[0..-4]
  end

end
