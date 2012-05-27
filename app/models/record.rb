require "markdownable"
class Record < ActiveRecord::Base
  include Markdownable

end
