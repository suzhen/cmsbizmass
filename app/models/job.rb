require 'markdownable.rb'
class Job < ActiveRecord::Base
 include Markdownable
 belongs_to :employing_unit

  scope :order_created,order("created_at desc")

end
