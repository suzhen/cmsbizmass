require 'markdownable.rb'
class Job < ActiveRecord::Base
 include Markdownable
 belongs_to :employing_unit
end
