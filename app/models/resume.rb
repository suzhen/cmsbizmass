require 'markdownable.rb'
class Resume < ActiveRecord::Base
  include Markdownable
  scope :order_created,order("created_at desc")
  scope :show_in_primary,where("showprimary is true") 

end
