#coding: utf-8
module CategoriesHelper

def parent_category_selects(category_id=nil,ul_id='categoryUL0',ctype='news')
    category_id = nil if category_id==""
    @category=nil            
    selects_str="<ul id='#{ul_id}' class='treeUL'>"
    top_categories=Category.family(ctype).roots.collect{|category|[category.id,category.name] }
    @category=Category.find category_id  unless category_id.nil?
    top_categories.reject!{|category| category[0]==@category.id} if !@category.nil?&&@category.parent_id==0 #防止把自己作为自己的父类
    if @category.nil?||@category.parent_id==0
      selects_str+="<li>"+ make_select(top_categories,"",0)+"</li>"
    else
       p_category=Category.find(@category.parent_id)
       pids=p_category.arrparentid   
       pids.split(',').each do |pid|   
            selects_str+="<li>"+ make_select(Category.family(ctype).where(["parent_id=?",pid]).collect{|category|[category.id,category.name]},pids+","+p_category.id.to_s,'')+"</li>"
       end
    end
    selects_str+="</ul>"       
end

def category_selects(category_id=nil,ul_id='categoryUL0',ctype='news')
    category_id = nil if category_id==""
    @category=nil            
    selects_str="<ul id='#{ul_id}' class='treeUL'>"
    top_categories=Category.family(ctype).roots.collect{|category|[category.id,category.name] }
    @category=Category.find category_id  unless category_id.nil?
    if @category.nil?||@category.parent_id==0
      selects_str+="<li>"+ make_select(top_categories,(@category.nil? ? "" : @category.id.to_s),0)+"</li>"
    else
       p_category=Category.find(@category.parent_id)
       pids=p_category.arrparentid   
       pids.split(',').each do |pid|   
            selects_str+="<li>"+ make_select(Category.family(ctype).where(["parent_id=?",pid]).collect{|category|[category.id,category.name]},pids+","+p_category.id.to_s,'')+"</li>"
       end
       selects_str+="<li>"+ make_select([[@category.id,@category.name]],@category.id.to_s,"")+"</li>"
    end
    selects_str+="</ul>"       
end


  #参数option_arr的格式为[value,option]
  #参数value为selected中的值   
  #参数js_function为onchange的JS脚本函数
  def make_select(option_arr,value,default_value)
    str="<select><option value='#{default_value}'>请选择</option>"
    option_arr.each do |option|
      if value.split(',').include?(option[0].to_s)
        str+="<option value='#{option[0]}' selected>#{option[1]}</option>"
      else                     
        str+="<option value='#{option[0]}'>#{option[1]}</option>"
      end                      
    end
    str+="</select>"           
  end

end
