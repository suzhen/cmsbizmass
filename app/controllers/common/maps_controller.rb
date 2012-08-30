#coding: utf-8
class Common::MapsController < CommonController
  def show
    @cities1=Enterprise.get_city_by_pinyin
    @cities_char=@cities1.keys.sort 
    @cities2=Enterprise.get_city_by_province
  end

 #通过城市名称获取城市里的企业
  def get_ents_by_city_ajax
    @allents=Enterprise.get_enterprise_by_city(params[:city])
    render :json=>{:city=>params[:city],:count=>@allents.length,:ents=>@allents}
  end

  #通过城市名称获取城市里的企业分类
  def get_ent_groups_by_city_ajax
   @entgroups=Enterprise.get_enterprise_name_by_city(params[:city])
   respond_to do |format|
     format.js
   end
  end

  #通过城市名称获取城市里的企业店面
  def get_stores_by_ent_ajax
    @stores=Enterprise.get_store_by_ent(params[:city],params[:ent]) 
    render :json=>{:city=>params[:city],:count=>@stores.length,:ents=>@stores}
  end
 
  def get_ents_by_kind_ajax
   @ents=Enterprise.get_store_by_kind(params[:city],params[:kind])
   render :json=>{:city=>params[:city],:count=>@ents.length,:ents=>@ents}
  end

end
