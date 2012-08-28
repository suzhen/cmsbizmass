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

