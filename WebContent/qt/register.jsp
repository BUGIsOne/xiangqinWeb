<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>注册</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!--dropdown-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/cheakReg.js"></script>
<script type="text/javascript">
var flag = false;
$(function(){
	if("${sessionScope.qtuser.uname}"==""){
		$("#user_msg").html('<li class="user_desc"><span class="m_1">已有账号 ? </span>登录</li><i class="user"> </i> <div class="clearfix"> </div> ');
	}else{
		$("#user_msg").html('<li class="user_desc"><span class="m_1">欢迎:<i class="user"></i> <a href="register.jsp">${sessionScope.qtuser.uname}</a><i><a href="<%=basePath%>user/qtlogout">退出</a></i><div class="clearfix"> </div> ');
		findmyxinxi();
	}
	
	$("#img_upload_show").click(function(){
		$("#img_upload_file").click();
	});
	
	$("#register_btn").click(function(){
		
		$(".check_").each(function(i){
			if(this.value.trim()==""){
				$ (this).next().html("<font color='red'>此项不能为空！</font>");
				flag = false;
			}else{
				$ (this).next().html("");
				flag = true;
			}
		});
		
		if(flag ==true){
			//alert($('#user_from').serialize());
			$.ajax({    
	 	        type:'post',        
	 	        url:"<%=basePath%>user/qtLogin",    
	 	       data: $('#user_from').serialize(),
	 	        cache:false,    
	 	        dataType:'json',    
	 	        success:function(data){  
	 	        	console.log(data.result);
	 	        	alert(data.result);
	 	        	/* if(data.result =="false"){
	 	        		alert("注册失败！");
	 	        	}else{
	 	        		window.location.href="login.jsp"; 
	 	        	} */
	 	        }    
		    });
		}
	});
	
});

function selectFileImage(fileObj) {
	var file = fileObj.files[0];  
    var reader = new FileReader();  
    reader.readAsDataURL(file);//调用自带方法进行转换  
    reader.onload = function(e) {
        $("#img_upload_show").attr("src", this.result);//将转换后的编码存入src完成预览  encodeURIComponent
        $("#img").val(this.result);//将转换后的编码保存到input供后台使用  
    };   
}

//查找我的资料
function findmyxinxi(){
	$.ajax({    
	        type:'post',        
	        url:"<%=basePath%>user/findById_qt",    
	        data: {"id":"${sessionScope.qtuser.uid}"},
	        cache:false,    
	        dataType:'json',    
	        success:function(data){  
	        	console.log(data);
	        	$("#uid").val(data[0].uid);
	        	$("#address").val(data[0].address);
	        	$("#age").val(data[0].age);
	        	$("#email").val(data[0].email);
	        	$("#fullname").val(data[0].fullname);
	        	$("#img").val(data[0].img);
	        	$("#taste").val(data[0].taste);
	        	$("#password").val(data[0].password);
	        	$("#phone").val(data[0].phone);
	        	$("#sex").val(data[0].sex);
	        	$("#taste").val(data[0].taste);
	        	$("#uname").val(data[0].uname);
	        	$("#uname").attr('readonly', true);
	        	$("#img_upload_show").attr("src",data[0].img);
	        }    
    });
}
</script>
</head>
<body>
<div class="header">
	<div class='container'>
		<div class="header_left">
			<img src="images/rate.png" alt=""/>
		</div>
		<div class="logo">
			<a href="index.jsp"><img src="images/logo.png" alt=""/>
				<span>Rose在线情缘</span>
			</a>
		</div>
		<div class="header_right">
			<ul class="header_user_info">
			  <a class="login" href="login.jsp" id="user_msg">
				<!-- <li class="user_desc"><span class="m_1">已有账号 ? </span>登录</li>
				<i class="user"> </i> 
				<div class="clearfix"> </div> -->
			  </a>
			  <div class="clearfix"> </div>
	    	</ul>
			<a href="register.jsp" class="btn1 btn-1 btn1-1b">注册</a>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<div class="profile_banner">
	<div class="container"> 
	   <h3>注册</h3>
	</div>
</div>
<div class='profiles'>
  <div class="container">
	   <div class="register">
		  	  <form id="user_from" method="post"> 
		  	  	<input type="hidden" name="img" id="img"></input>
		  	  	<input type="hidden" name="uid" id="uid"></input>
		  	  	<input type="hidden" name="type" value="1"></input>
		  	  	<input type="file" accept="image/*" id="img_upload_file" capture="camera" onchange="selectFileImage(this);"  style="display: none;"/>
				 <div class="register-top-grid">
					<h3>个人信息</h3>
					<div>
						<span>头像<label>*</label></span>
						<img alt="点击上传头像" src="images/timg.jpg" id="img_upload_show" height="200" width="200"/>
					 </div>
					 
					 <div>
						<span>姓名<label>*</label></span>
						<input type="text" name="fullname" id="fullname" class="check_" check="required" > 
						<span class="info"></span>
					 </div>
					 <div>
						<span>年龄<label>*</label></span>
						<input type="text" name="age" id="age" class="check_" check="required"> 
						<span class="info"></span>
					 </div>
					 
					 <div>
						 <span>邮箱<label>*</label></span>
						 <input type="text" name="email" id="email" class="check_" check="required"> 
						 <span class="info"></span>
					 </div>
					 
					  <div>
						 <span>兴趣<label>*</label></span>
						 <input type="text" name="taste" id="taste" class="check_" check="required"> 
						 <span class="info"></span>
					 </div>
					 
					 <div>
						 <span>电话号码<label>*</label></span>
						 <input type="text" name="phone" id="phone" class="check_" check="required"> 
						 <span class="info"></span>
					 </div>
					 <div>
						 <span>地址<label>*</label></span>
						 <input type="text" name="address" id="address" class="check_" check="required"> 
						 <span class="info"></span>
					 </div>
					 
					 <div>
						<span>性别<label>*</label></span>
						<select name="sex" id="sex">
							<option value='男'>男</option>
							<option value='女'>女</option>
						</select>
					 </div> 
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>遵守注册协议</label>
					   </a>
					 </div>
				     <div class="register-bottom-grid">
						    <h3>登录信息</h3>
							 <div>
								<span>账号<label>*</label></span>
								<input type="text" name="uname" id="uname" class="check_" check="required"> 
						 		<span class="info"></span>
							 </div>
							 <div>
								<span>密码<label>*</label></span>
								<input type="text" name="password" id="password" class="check_" check="required"> 
						 		<span class="info"></span>
							 </div>
							 <div class="clearfix"> </div>
					 </div>
					 <!-- <input type="submit" value="注册"> -->
					   <div class="clearfix"> </div>
				</form>
				<div class="clearfix"> </div>
				<div class="register-but">
				   <!-- <form> -->
					   <input type="submit" value="保存" id="register_btn">
					   <div class="clearfix"> </div>
				   <!-- </form> -->
				</div>
		   </div>
  </div>
</div>
<div class="footer">
	<div class="container">
		<!-- <div class="cssmenu">
		  <ul>
			<li class="active"><a href="#">Home</a></li> 
			<li><a href="about.html">About</a></li>
			<li><a href="profiles.html">Add Profile</a></li>
			<li><a href="contact.html">Contact</a></li>
		  </ul>
	    </div> -->
	    <div class="copy">
			<p>Copyright &copy; 2018.Company name All rights reserved.Rose在线情缘 <a href="index.jsp" target="_blank" title="Rose在线情缘">Rose在线情缘</a> - Collect from <a href="index.jsp" title="Rose在线情缘" target="_blank">Rose在线情缘</a></p>
		</div>
		<div class="social"> 
			<ul class="footer_social">
			  <li><a href="#"> <i class="fb"> </i> </a></li>
			  <li><a href="#"> <i class="tw"> </i> </a></li>
		   </ul>
		</div>
	    <div class='clearfix'> </div>
	</div>
</div>
</body>
</html>		