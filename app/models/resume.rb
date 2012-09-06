require 'markdownable.rb'
class Resume < ActiveRecord::Base
  include Markdownable
end
