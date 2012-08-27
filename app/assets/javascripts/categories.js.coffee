$ ->
  #创建新闻分类
  $('#categoryUL0 select').change ->
     t=$("#category_tree")
     zData=eval '('+t.val()+')'
     addNewNode this,zData,"category_parent_id"

  #查询选择新闻分类
  $('#newsCategoryUL0 select').change ->
     t=$("#category_tree")
     zData=eval '('+t.val()+')'
     addNewNode this,zData,"news_category_id"


addNewNode=(obj,zNodeData,hiddenId)->
  hiddenObj=$("#"+hiddenId+"")
  hiddenObj.val obj.value 
  $(obj).parent().nextAll().remove()
  if obj.value=='0'            
    return false               
  if obj.value==''             
    hiddenObj.val $(obj).parent().prev().children().first().val()
    return false
  strLI="<li><select><option value=''>请选择</option>"
  flag=false
  sel_val=obj.value
  $.each zNodeData,(index, value)->
     if value["pId"]==parseInt sel_val
      strLI+="<option value='#{value["id"]}'>#{value["name"]}</option>"
      flag = true
  strLI+="</select></li>"
  if flag
   $(obj).parents("UL").append(strLI)
   $(obj).parents("UL").find("select").change ->
      addNewNode this,zNodeData,hiddenId
  false

