#coding: utf-8
class AdSpace < ActiveRecord::Base
  validates :name,:presence=>true 
  validates :width,:presence=>true 
  validates :height,:presence=>true 
  validates :items,:presence=>true 
  validates :symbol,:presence=>true 
  validates_numericality_of :width, :only_integer => true
  validates_numericality_of :height, :only_integer => true
  validates_numericality_of :items, :only_integer => true
  validates_uniqueness_of :symbol

  has_many :ads
end
