<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/head.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广告信息</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>

<script type="text/javascript">
$(function(){
	if("${advert.aid}"!=""){
		//var str_src =encodeURIComponent();
		$("#img_upload_show").attr("src", "${advert.aimg}");//将转换后的编码存入src完成预览  
	} 
	$("#img_upload_show").click(function(){
		$("#img_upload_file").click();
	});
});

function selectFileImage(fileObj) {
	var file = fileObj.files[0];  
    var reader = new FileReader();  
    reader.readAsDataURL(file);//调用自带方法进行转换  
    reader.onload = function(e) {
        $("#img_upload_show").attr("src", this.result);//将转换后的编码存入src完成预览  encodeURIComponent
        $("#aimg").val(this.result);//将转换后的编码保存到input供后台使用  
    };   
}
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">广告</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="<%=basePath%>advert/save" method="post">
    <input type="hidden" name="aid" value="${advert.aid}" />
    <input type="hidden" name="aimg" id="aimg"></input>
    <input type="file" accept="image/*" id="img_upload_file" capture="camera" onchange="selectFileImage(this);"  style="display: none;"/>
    <ul class="forminfo">
    <li><label>广告名</label><input name="aname" type="text" class="dfinput" value="${advert.aname}"/></li>
    <li><label>广告地址</label><input name="aurl" type="text" class="dfinput" value="${advert.aurl}"/></li>
    <li><label>广告图片</label><img src="<%=basePath%>images/addimg.jpg" height="200" width="200" id="img_upload_show" /></li>
    <li><label>&nbsp;</label><input name="" type="submit"  class="btn" value="确认保存"/></li>
    </ul>
    </form>
    
    </div>



</body>
</html>
