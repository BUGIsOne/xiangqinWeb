<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>首页</title>
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
<script src="js/jquery.easydropdown.js"></script>
<!-- FlexSlider -->
<link href="css/flexslider.css" rel='stylesheet' type='text/css' />
							  <script defer src="js/jquery.flexslider.js"></script>
							  <script type="text/javascript">
								$(function(){
									showList("","");
									 if("${sessionScope.qtuser.uname}"==""){
											$("#user_msg").html('<li class="user_desc"><span class="m_1">已有账号 ? </span>登录</li><i class="user"> </i> <div class="clearfix"> </div> ');
										}else{
											$("#user_msg").html('<li class="user_desc"><span class="m_1">欢迎:<i class="user"></i> <a href="register.jsp">${sessionScope.qtuser.uname}<i></a><a href="<%=basePath%>user/qtlogout">退出</a></i><div class="clearfix"> </div> ');
										}
									 
									 $("#submit").click(function(){
										 //
										 var sex_val = $("#sex_val").val();
										 var xq_val =$("#xq_val").val();
										 //alert(sex_val +"=="+xq_val);
										 showList(sex_val,xq_val);
									 });
									 
									 
									 show_advert();
									 SyntaxHighlighter.all();
									 
									 
									
									 // 
								  
								});
								$(window).load(function(){
								  $('.flexslider').flexslider({
									animation: "slide",
									start: function(slider){
									  $('body').removeClass('loading');
									}
								  });
								});
								
								function showList(sex,xq){
									$.ajax({
										url : "<%=basePath%>"+"user/findList",
											type : "post",
											dataType : "json",
											data:{"type":"qt","sex":sex,"xq":xq},
											async:false,
											success : function(data) {
												console.log(data);
												$('#userList').empty();
												for(var i=0;i<data.length;i++){
													 var str1 ='<div class="col-md-4 wow fadeInLeft" data-wow-delay="0.4s"><div class="grid_4"><a href="single.jsp?id='+data[i].uid+'"><h4><span class="m_3">'+data[i].uname+', </span>'+data[i].address+'</h4>';
													 var str2 ='<img src="'+data[i].img+'" style="width:360px;height:260px;"  class="img-responsive" alt=""/><ul class="category_desc"><li class="cate_head">喜欢人数:'+data[i].lovenum+'</li><li class="cate_right"><ul class="list1"><li><i class="heart"> </i></li><li><i class="heart"> </i></li><li><i class="heart"> </i></li><li><i class="heart"> </i></li></ul></li>';
													 var str3='<div class="clearfix"> </div></ul><h5>Full Profile</h5></a> </div></div>';
													 var html=str1+str2+str3;
													 $('#userList').append(html);
												}
												
											}
									});
								}
								
								function show_advert(){
									$.ajax({
										url : "<%=basePath%>"+"advert/findList",
											type : "post",
											dataType : "json",
											async:false,
											success : function(data) {
												console.log(data);
												$("#flt").append("<a href='"+data[0].aurl+"' target='_blank'><img src='"+data[0].aimg+"' alt='"+data[0].aname+"'></a>");
											}
									});
								}
							  </script>
<!-- FlexSlider -->
<!--Animation-->
<script src="js/wow.min.js"></script>
<link href="css/animate.css" rel='stylesheet' type='text/css' />
<script>
	new WOW().init();
</script>
</head>
<body>
<!-- 显示广告 -->
<div id="flt" name="flt" style="right:1px; POSITION:absolute; top:145px; z-index:99;"></div>

<!-- 显示广告 -->

<div class="header wow fadeInUp" data-wow-delay="0.4s">
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
<div class="banner wow bounceInRight" data-wow-delay="0.4s">
	<div class="container"> 
	   <div class="banner_right">
		   <h2>寻找你的另一半</h2>
		   <h1>灵魂伴侣 </h1>
		   <ul class="button">
			 <li><a href="#" class="btn1 btn2 btn-1 btn1-1b">开始</a></li>
			 <li><a href="#" class="btn1 btn2 btn-1 btn1-1b">了解更多</a></li>
		   </ul>
	   </div>
	</div>
</div>
<!-- <div class="content_middle wow fadeInUp" data-wow-delay="0.4s">
	<div class="container">
	   <div class="col-md-9 grid_2">
	   	  <h3>Start Dating Now !</h3>
	   	  <h4>Download our mobile apps and start dating right now.</h4>
	   	  <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.</p>
	      <ul class="apps wow fadeInLeft" data-wow-delay="0.4s">
		    <li><a href="#"><i class="app"></i></a></li>
			<li><a href="#"><i class="google"></i></a></li>
		  </ul>
		   <h5>OR</h5>
		   <a href="#" class="btn3 btn-3 btn3-1b">Sign Up</a>
	   </div>
	   <div class="col-md-3 grid_3 wow fadeInRight" data-wow-delay="0.4s">
	   	   <span> </span>
	   </div>
	</div>
</div> -->
<div class="copyrights">Collect from <a href="index.jsp"  title="Rose在线情缘">Rose在线情缘</a></div>
<div class="content_bottom">
	<div class="container">
	  <div class="box1" >
	  
		<div id="userList"></div>
		<!-- <div class="col-md-4 wow fadeInUp" data-wow-delay="0.4s">
		   <div class="grid_4"><a href="single.html">
			<h4><span class="m_3">luke ,</span>engineer-usa</h4>
			<img src="images/pic2.jpg" class="img-responsive" alt=""/>
			<ul class="category_desc">
			   <li class="cate_head">Based in 956 votes</li>
			   <li class="cate_right">
			   	 <ul class="list1">
			   	   <li><i class="heart"> </i></li>
			   	   <li><i class="heart"> </i></li>
			   	   <li><i class="heart"> </i></li>
			   	 </ul>
			   </li>
			   <div class="clearfix"> </div>
			</ul>
			<h5>Full Profile</h5>
		  </a></div>
	    </div>
		<div class="col-md-4 wow fadeInRight" data-wow-delay="0.4s">
		  <div class="grid_4"><a href="single.html">
			<h4><span class="m_3">max ,</span>security-usa</h4>
			<img src="images/pic3.jpg" class="img-responsive" alt=""/>
			<ul class="category_desc">
			   <li class="cate_head">Based in 900 votes</li>
			   <li class="cate_right">
			   	 <ul class="list1">
			   	    <li><i class="heart"> </i></li>
			   	    <li><i class="heart"> </i></li>
			   	    <li><i class="heart"> </i></li>
			   	 </ul>
			   </li>
			   <div class="clearfix"> </div>
			</ul>
			<h5>Full Profile</h5>
		  </a></div>
	    </div>
		<div class="clearfix"> </div>
	  </div> -->
	  <div class='span1'>
		  <select class="dropdown" tabindex="10" data-settings='{"wrapperClass":"metro1"}' id="sex_val">
		    <option value="">性别</option>	
			<option value="男">男</option>
			<option value="女">女</option>
		  </select>
	  </div>
	  <div class='clearfix'> </div>
	  <div class="search wow bounceInUp" data-wow-delay="0.4s">
   	    <h3>寻找的人? </h3>
   	    <!-- <form> -->
		 <span>
		   <div class="search-box">
		   	<i class="search-icon"> </i>
		    <input type="text" id="xq_val" onfocus="this.value = '';" >
		   </div>
		   <input name="submit" type="submit" id="submit" value="查找">
		 </span>	
		<div class="clearfix"> </div>
	    <!-- </form> -->
	   <h4>声明</h4>
	   <p class="m_2">这是一种很有意义的方法，它可以使你的生活变得更美好。但是，如果我们的研究结果很好，那么我们就可以得出结论。在这一过程中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，我们会发现，在我们的研究中，这是一种很好的方法，它可以使你的身体变得更健康。</p>
       <p>型无型单簧管;这是我们的法律。调查人员在我的面前证明了我的观点。这是我最喜欢的东西，它是我的动力。这是一种很好的方法，它可以使你的身体变得更健康，也可以使你的身体变得更健康。这是我的第一个字，这是我的第一个字。</p>
      </div>
   </div>
</div>
<div class="footer">
	<div class="container">
		<!-- <div class="cssmenu wow fadeInLeft" data-wow-delay="0.4s">
		  <ul>
			<li class="active"><a href="#">Home</a></li> 
			<li><a href="about.html">About</a></li>
			<li><a href="profiles.html">Add Profile</a></li>
			<li><a href="contact.html">Contact</a></li>
		  </ul>
	    </div> -->
	    <div class="copy wow fadeInUp" data-wow-delay="0.4s">
			<p>Copyright &copy; 2018.Company name All rights reserved.Rose在线情缘 <a href="index.jsp" target="_blank" title="Rose在线情缘">Rose在线情缘</a> - Collect from <a href="index.jsp" title="Rose在线情缘" target="_blank">Rose在线情缘</a></p>
		</div>
		<div class="social wow fadeInRight" data-wow-delay="0.4s"> 
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