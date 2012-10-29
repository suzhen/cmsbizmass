$ ->
  if $("#record_body").length > 0
    $("#record_body").before "<div id='wmd-button-bar'></div>"
    $("#record_body").after "<div id='wmd-preview' class='wikistyle'></div>"
    new WMDEditor
      input: "record_body"
      button_bar: "wmd-button-bar"    
      preview: "wmd-preview"
      helpLink: "http://daringfireball.net/projects/markdown/syntax"
 
  if $("#rstIfm").length > 0
    $('#rstIfm').iframeAutoHeight()
 
  #打开选择关联文章窗口
  $("#chsArtBtn").click ->
    $('#QueryArticle').modal {
      keyboard: false
    }
    $('#QueryArticle').modal('show')
    false

  #查询文章
  $("#queryABtn").click ->
    key=cat=""
    key=$("#lcpsd").val()
    cat=$("#news_category_id").val()
    $("#rstIfm").attr("src","/queryarticles?key=#{key}&cat=#{cat}")
    false
   
  #简历
  if $("#resume_body").length > 0
    $("#resume_body").before "<div id='wmd-button-bar'></div>"
    $("#resume_body").after "<div id='wmd-preview' class='wikistyle'></div>"
    new WMDEditor
      input: "resume_body"
      button_bar: "wmd-button-bar"    
      preview: "wmd-preview"
      helpLink: "http://daringfireball.net/projects/markdown/syntax"

  #招聘单位
  if $("#employing_unit_body").length > 0
    $("#employing_unit_body").before "<div id='wmd-button-bar'></div>"
    $("#employing_unit_body").after "<div id='wmd-preview' class='wikistyle'></div>"
    new WMDEditor
      input: "employing_unit_body"
      button_bar: "wmd-button-bar"    
      preview: "wmd-preview"

  #工作职位
  if $("#job_body").length > 0
    $("#job_body").before "<div id='wmd-button-bar'></div>"
    $("#job_body").after "<div id='wmd-preview' class='wikistyle'></div>"
    new WMDEditor
      input: "job_body"
      button_bar: "wmd-button-bar"    
      preview: "wmd-preview"
      helpLink: "http://daringfireball.net/projects/markdown/syntax"



  #打开选择关联文章窗口
  $("#editJobBtn").click ->
    $('#editJob').modal {
      keyboard: false
    }
    $('#editJob').modal('show')
    false


#图片转换
$ ->
  if $('div.imgbox').length > 0
    $('div.imgbox').imgbox()


#关联新闻和图片
@link_article=(article_param,article_title) ->
  $('#picture_url').val("/detail/#{article_param}")
  $("#picture_url ~ strong").remove()
  $("<strong>&nbsp;&nbsp;#{article_title}</strong>").insertAfter("#picture_url") 
  $('#QueryArticle').modal('hide')
  false


#图片滚动
$ ->
 _speed=30;
 _slide = $("#slide_pic")
 _slideli1 = $(".slideli1")
 _slideli2 = $(".slideli2")
 _slideli2.html(_slideli1.html())
 
 Marquee=()->
    #alert _slide.scrollLeft()
    if _slide.scrollLeft() >= _slideli1.width()
     _slide.scrollLeft(0)
    else
     _slide.scrollLeft(_slide.scrollLeft()+1)

 sliding=setInterval(Marquee,_speed)


 _slide.hover(
   ->
	#鼠标移动DIV上停止
      clearInterval(sliding)
   ->
	#离开继续调用
      sliding=setInterval(Marquee,_speed)
 )


#加入QQ群
@joinqq=()->
  document.getElementById("joinqqgroup_btn").click()
  false




	
