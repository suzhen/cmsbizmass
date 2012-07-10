#coding: utf-8
require 'import_excel'

class Enterprise < ActiveRecord::Base
  paginates_per 20 
  extend Import_excel
  scope :enterprises_by_city, lambda { |city| where("city = ?", city) }
  scope :has_coordinates,where('longitude!=0 and latitude!=0')
  scope :has_kind,where("kind IS NOT NULL")
  @@p=/[^\u4e00-\u9fa5]/ 
 
  class << self
    #获取省份城市列表
    def get_city_by_province
       cities=Hash.new
       Enterprise.where("city IS NOT NULL and province IS NOT NULL").select("province,city").uniq.collect do |ent|
        cityname=ent.city.gsub(@@p,'').strip
        provincename=ent.province.gsub(@@p,'').strip
        unless cities.key? provincename
          cities[provincename]=Array.new
        end
        cities[provincename]<<cityname
       end
       cities
    end

    #获取拼音城市列表
    def get_city_by_pinyin
       cities=Hash.new
       Enterprise.where("city IS NOT NULL").select("city").uniq.collect do |ent|
        cityname=ent.city.gsub(@@p,'').strip
        firstchar= Pinyin.t(cityname,'').first.upcase
        unless cities.key? firstchar 
        self.where("kind IS NOT NULL").select("kind").uniq.collect { |ent| ent.kind.delete(" ").strip}
          cities[firstchar]=Array.new
        end
        cities[firstchar]<<cityname
       end
       cities
    end
    
    #获取企业分类
    def get_kind
        self.where("kind IS NOT NULL").select("kind").uniq.collect { |ent| ent.kind.gsub(@@p,'').strip}
    end

    #导入excel到db中
    def import_excel_to_db(file_name)
       Enterprise.import(file_name,{:name=>"A",:province=>"B",:city=>"C",:store_name=>"D",:address=>"E",:longitude=>"F",:latitude=>"G",:tel=>"H",:kind=>"I"},{:Sheet1=>2})
    end


    #获取城市里的企业列表
    def get_enterprise_by_city(city_name)
     ents = Enterprise.enterprises_by_city(city_name).has_coordinates 
     all_ents=[]
     ents.each do |ent|
       ent_hash=Hash.new
       ent_hash[:name]=ent.name+ent.store_name
       ent_hash[:address]=ent.address
       ent_hash[:tel]=ent.tel
       ent_hash[:coordinate]=[ent.longitude,ent.latitude]
       ent_hash[:kind]=ent.kind
       ent_hash[:id]=ent.id
       all_ents<<ent_hash
     end
     all_ents
    end 
  
    #获取城市里企业名称和企业类别
    def get_enterprise_name_by_city(city_name)
     ents = Enterprise.enterprises_by_city(city_name).has_coordinates 
     ent_names= ents.select("name").uniq.collect{|ent|{:name=>ent.name,:count=>ents.where(["name=?",ent.name]).count}}
     ent_kinds= ents.has_kind.select("kind").uniq.collect{|ent| {:kind=>ent.kind,:count=>ents.where(["kind=?",ent.kind]).count}}
     {:names=>ent_names,:kinds=>ent_kinds}
    end

    #获取城市里的某企业的店面
    def get_store_by_ent(city,ent)
        ents = Enterprise.enterprises_by_city(city).has_coordinates.where(["name=?",ent])  
        all_ents=[]
     ents.each do |ent|
       ent_hash=Hash.new
       ent_hash[:name]=ent.name+ent.store_name
       ent_hash[:address]=ent.address
       ent_hash[:tel]=ent.tel
       ent_hash[:coordinate]=[ent.longitude,ent.latitude]
       ent_hash[:kind]=ent.kind
       ent_hash[:id]=ent.id
       all_ents<<ent_hash
     end
     all_ents
    end

    #获取城市里的某类型的企业店面
    def get_store_by_kind(city,kind)
     ents = Enterprise.enterprises_by_city(city).has_coordinates.has_kind.where(["kind=?",kind]) 
     all_ents=[]
     ents.each do |ent|
       ent_hash=Hash.new
       ent_hash[:name]=ent.name+ent.store_name
       ent_hash[:address]=ent.address
       ent_hash[:tel]=ent.tel
       ent_hash[:coordinate]=[ent.longitude,ent.latitude]
       ent_hash[:kind]=ent.kind
       ent_hash[:id]=ent.id
       all_ents<<ent_hash
     end
     all_ents
    end

  end

end
