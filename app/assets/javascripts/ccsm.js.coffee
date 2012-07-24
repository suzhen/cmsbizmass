$ ->
  if $("#record_body").length > 0
    $("#record_body").before "<div id='wmd-button-bar'></div>"
    $("#record_body").after "<div id='wmd-preview' class='wikistyle'></div>"
    new WMDEditor
      input: "record_body"
      button_bar: "wmd-button-bar"    
      preview: "wmd-preview"
      helpLink: "http://daringfireball.net/projects/markdown/syntax"

#图片转换
$ ->
  if $('div.imgbox').length > 0
    $('div.imgbox').imgbox()




