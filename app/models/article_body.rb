#coding: utf-8
class ArticleBody < ActiveRecord::Base
  belongs_to :article
  validates :body, :presence => true
end
