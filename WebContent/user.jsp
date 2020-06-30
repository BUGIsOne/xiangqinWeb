<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/head.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>分类信息</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript">
	$(function(){
		set_select_checked("rid","${user_u.rid}");
	});
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">用户信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="<%=basePath%>user/save" method="post" enctype="multipart/form-data">
    <input type="hidden" name="uid" value="${user_u.uid}"/>
    <ul class="forminfo">
    <li><label>用户名</label><input name="uname" type="text" class="dfinput" value="${user_u.uname}"/></li>
    <li><label>邮箱</label><input name="email" type="text" class="dfinput" value="${user_u.email}"/></li>
    <li><label>角色</label>
    <select name="rid" class="dfinput" id="rid">
    	<option value="会员">会员</option>
    	<option value="管理员">管理员</option>
    </select>
    </li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    </form>
    
    </div>



</body>
</html>
