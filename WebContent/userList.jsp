<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/head.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户列表</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$(".click").click(function(){
		$(".tip").fadeIn(200);
	});
	  
	$(".tiptop a").click(function(){
		$(".tip").fadeOut(200);
	});
	
	$(".sure").click(function(){
		$(".tip").fadeOut(100);
	});
	
	$(".cancel").click(function(){
		$(".tip").fadeOut(100);
	});

});

$(function(){
	$.ajax({
		url : "<%=basePath%>"+"user/findList",
			type : "post",
			dataType : "json",
			success : function(data) {
				console.log(data);
				for(var i=0;i<data.length;i++){
					 var str1 ="<tr><td><input name='' type='checkbox' value='' /></td>";
					 var str2 ="<td>"+data[i].uid+"</td>"
					 var str3="<td>"+data[i].uname+"</td>";
					 var str4="<td>"+data[i].email+"</td>";
					 var str5="<td>"+data[i].rid+"</td>";
					 var str6 ="<td><a href='<%=basePath%>user/findById?id="+data[i].uid+"' class='tablelink'>查看</a>     <a href='<%=basePath%>user/deletById?id="+data[i].uid+"' class='tablelink'> 删除</a></td></tr>";
					 var html=str1+str2+str3+str4+str5+str6;
					 $('#userList').append(html);
				}
			}
	});
});


</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">分类列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="images/t01.png" /></span><a href="user.jsp">添加</a></li>
        <li class="click"><span><img src="images/t02.png" /></span>修改</li>
        <li><span><img src="images/t03.png" /></span>删除</li>
        <li><span><img src="images/t04.png" /></span>统计</li>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>用户名</th>
        <th>邮箱</th>
        <th>角色</th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody id="userList">
        
        </tbody>
    </table>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>


</body>
</html>
