$ ->
  #创建新闻分类
  $('#categoryUL0 select').change ->
     t=$("#category_tree")
     zData=eval '('+t.val()+')'
     addNewNode this,zData


addNewNode=(obj,zNodeData)->
  $("#category_parent_id").val obj.value 
  $(obj).parent().nextAll().remove()
  if obj.value=='0'            
    return false               
  if obj.value==''             
    $("#category_parent_id").val $(obj).parent().prev().children().first().val()
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
      addNewNode this,zNodeData
  false

