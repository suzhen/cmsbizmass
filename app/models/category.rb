#coding: utf-8
require 'tree'
class Category < ActiveRecord::Base
  has_many :articles
  include Tree
  validates :name,:presence=>true 
  validates :ctype,:presence=>true
  validates :symbol,:presence=>true
  validates_uniqueness_of :name
  validates_uniqueness_of :symbol

  scope :family, lambda { |ctype| where("ctype = ?", ctype) }
  scope :roots,where('parent_id=0')
end
