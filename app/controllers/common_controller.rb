#coding: utf-8
require "yaml"
class CommonController < ApplicationController
  pageconfig = File.open(File.dirname(__FILE__)+'/../../webconfig/page.yml') { |is|  YAML::load(is) } #if $configroot.nil?
  $configroot = pageconfig["ccsm_com_cn"]
end
