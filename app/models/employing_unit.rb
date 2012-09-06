require 'markdownable.rb'
class EmployingUnit < ActiveRecord::Base
  include Markdownable
  has_many :jobs
end
