<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Login</title>
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
<script type="text/javascript">
	$(function(){
		if("${sessionScope.qtuser.uname}"==""){
			$("#user_msg").html('<li class="user_desc"><span class="m_1">已有账号 ? </span>登录</li><i class="user"> </i> <div class="clearfix"> </div> ');
		}else{
			$("#user_msg").html('<li class="user_desc"><span class="m_1">欢迎:<i class="user"></i> <a href="register.jsp">${sessionScope.qtuser.uname}<i></a><a href="<%=basePath%>user/qtlogout">退出</a></i><div class="clearfix"> </div> ');
		}
		$("#login_btn").click(function(){
			$.ajax({    
	 	        type:'post',        
	 	        url:"<%=basePath%>user/qtLogin",    
	 	       	data: $('#user_from').serialize(),
	 	        cache:false,    
	 	        dataType:'json',    
	 	        success:function(data){  
	 	        	console.log(data.result);
	 	        	if(data.result =="false"){
	 	        		alert("登录失败！");
	 	        	}else{
	 	        		window.location.href="index.jsp"; 
	 	        	}
	 	        }    
		    });
		});
	});
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
	   <h3>Login</h3>
	</div>
</div>
<div class='profiles'>
  <div class="container">
	  <div class="account_grid">
			 <div class="col-md-6 login-left">
			  	 <h3>新客户</h3>
				 <p>通过在我们的商店中创建一个帐户，您将能够更快地通过结帐过程，存储多个送货地址，查看和跟踪您的帐户和更多的订单。</p>
				 <a class="acount-btn" href="register.jsp">创建一个账号</a>
			 </div>
			 <div class="col-md-6 login-right">
			  	<h3>注册客户</h3>
				<p>如果您有我们的帐户，请登录。</p>
				<form id="user_from">
				<input type="hidden" name="type" value="0"></input>
				  <div>
					<span>账号<label>*</label></span>
					<input type="text" name="uname"> 
				  </div>
				  <div>
					<span>密码<label>*</label></span>
					<input type="password" name="password"> 
				  </div>
				  <a class="forgot" href="#">忘记密码?</a>
				  
			    </form>
			    <input type="submit" value="登录" id="login_btn">
			 </div>	
			 <div class="clearfix"> </div>
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