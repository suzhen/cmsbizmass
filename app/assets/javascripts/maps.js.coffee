# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
 $('#chooseTab  a').click ->
   $('#chooseTab a:first').tab('show')
   $('#chooseTab a:last').tab('show') 
 $("#tab1 a").click ->
   setCity($(this).text())
 $("#tab2 a").click ->
   setCity($(this).text())

THIS=this
@MAPOBJ=null

$ ->
  mapoption = new MMapOptions()
  mapoption.zoom=13 #设置地图zoom级别
  mapoption.toolbar=DEFAULT #设置工具条
  mapoption.toolbarPos=new MPoint(0,0) #
  mapoption.overviewMap =DEFAULT #设置鹰眼
  THIS.MAPOBJ = new MMap("mapObj", mapoption) #地图初始化
  setGroup("北京")


setCity=(city)->
  @MAPOBJ.removeAllOverlays() 
  maptools=new MMapTools(@MAPOBJ) 
  maptools.setCenterByCity(city)
  setGroup(city)
  false


setGroup=(city)->
    city=encodeURI(city)
    $.ajax '/enter_groups_by_city?city='+city,
    type: 'GET'
    dataType: 'html'
    error: (jqXHR, textStatus, errorThrown) ->
      alert "数据读取有误，请稍后再试。"
    success: (data, textStatus, jqXHR) ->
      $("#mapContainer .well").html(data)
      $("#enterpriseNames a").click ->
        addMarkerByEnt(city,$(this).text(),this)
        false
      $("#enterpriseKinds a").click ->
        addMarkerByKind(city,$(this).text(),this)


addMarkerByEnt=(city,ent,obj)->
    ent=encodeURI(ent)
    clearEntGroupActive()
    $(obj).addClass("active")
    @MAPOBJ.removeAllOverlays()
    $.ajax '/stores_by_ent_in_city?city='+city+"&ent="+ent,
    type: 'GET'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      alert "数据读取有误，请稍后再试。"
    success: (data, textStatus, jqXHR) ->
      $.each data["ents"],(index, value)-> 
        addMarker(makePoint(value["id"],value["name"],value["address"],value["tel"],value["coordinate"],value["kind"]))	
    false 


addMarkerByKind=(city,kind,obj)->
    kind=encodeURI(kind)
    clearEntGroupActive()
    $(obj).addClass("active")
    @MAPOBJ.removeAllOverlays()
    $.ajax '/ents_by_kind_in_city?city='+city+"&kind="+kind,
    type: 'GET'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      alert "数据读取有误，请稍后再试。"
    success: (data, textStatus, jqXHR) ->
      $.each data["ents"],(index, value)-> 
        addMarker(makePoint(value["id"],value["name"],value["address"],value["tel"],value["coordinate"],value["kind"]))	
    false





makePoint=(id,store_name,address,tel,coordinate,kind)->
  tipOption=new MTipOptions() #添加信息窗口 
  tipOption.title=store_name #信息窗口标题 
  tipOption.content="地址："+(if address==null then "" else address)+"<br />"+"电话："+(if tel==null then "" else tel)+"<br />"+"分类："+(if kind==null then "" else kind) #信息窗口内容 
  labelOption=new MLabelOptions() #添加标注 
  labelOption.content=store_name #标注的内容 
  labelOption.hasBorder=true #设置标注背景是否有边框，默认为false，即没有边框 
  labelOption.hasBackground=true #设置标注是否有背景，默认为false，即没有背景 
  #标注左上角相对于图片中下部的锚点。Label左上角与图片中下部重合时，记为像素坐标原点(0,0)。 
  labelOption.labelPosition=new MPoint(5,5)
  #构建一个名为markerOption的点选项对象。 
  markerOption = new MMarkerOptions()
  #标注图片或SWF的url，默认为蓝色气球图片 
  markerOption.imageUrl="http://code.mapabc.com/images/lan_1.png"
  #图片锚点BOTTOM_CENTER相对于标注位置的位置 
  markerOption.anchor=new MPoint(0,0)
  #设置图片相对于加点经纬度坐标的位置。九宫格位置。默认BOTTOM_CENTER代表正下方 
  markerOption.imageAlign=BOTTOM_CENTER 
  #设置点的标注参数选项 
  markerOption.labelOption=labelOption 
  #设置点是否为可编辑状态,rue，可以编辑；   false，不可编辑（默认） 
  markerOption.isEditable=false 
  #设置点的信息窗口参数选项 
  markerOption.tipOption = tipOption 
  #是否在地图中显示信息窗口，true，可以显示（默认）；false，不显示 
  markerOption.canShowTip= true 
  #设置图标旋转的角度 
  markerOption.rotation="0" 
  #通过经纬度坐标及参数选项确定标注信息 
  Mmarker = new MMarker(new MLngLat(coordinate[0],coordinate[1]),markerOption) 
  #对象编号，也是对象的唯一标识 
  Mmarker.id="mark"+id
  Mmarker



addMarker=(markObj)->
  #向地图添加覆盖物 
  @MAPOBJ.addOverlay(markObj,true)

clearEntGroupActive=()->
  $("#mapContainer a").removeClass("active")

