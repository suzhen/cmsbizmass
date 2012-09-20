#coding: utf-8
require 'tree'
class Category < ActiveRecord::Base
  has_many :articles
  has_many :pictures
  include Tree
  validates :name,:presence=>true 
  validates :ctype,:presence=>true
  validates :symbol,:presence=>true
#  validates_uniqueness_of :name
  validates_uniqueness_of :symbol

  scope :family, lambda { |ctype| where("ctype = ?", ctype) }
  scope :roots,where('parent_id=0')
 
  def chain
    categories=""
    arr_cat = self.arrparentid.split(",")
    arr_cat<<id.to_s
    arr_cat.each do |id|
       categories+="<a href='/article_list/#{id}'>#{Category.find(id).name}</a>&nbsp;"+"—>" unless id=="0" 
    end 
    categories[0..-4]

  end
end
