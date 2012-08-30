#coding: utf-8
require "yaml"
class CommonController < ApplicationController
  pageconfig = File.open('../../webconfig/page.yml') { |is|  YAML::load(is) }
  $configroot=pageconfig["ccsm_com_cn"]
end
