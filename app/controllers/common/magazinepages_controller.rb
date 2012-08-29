#coding: utf-8
require "yaml"
class Common::MagazinepagesController < ApplicationController
  $pageconfig = File.open('webconfig/page.yml') { |is|  YAML::load(is) }
  def primary


  end

end
