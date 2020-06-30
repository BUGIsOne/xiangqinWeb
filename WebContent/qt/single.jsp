<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>资料</title>
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
	show_user();//显示详细资料
	loveTop();//喜欢排行
	myLove();//我喜欢的
	if("${sessionScope.qtuser.uname}"==""){
		$("#user_msg").html('<li class="user_desc"><span class="m_1">已有账号 ? </span>登录</li><i class="user"> </i> <div class="clearfix"> </div> ');
		$("#show_sms").hide();
	}else{
		$("#user_msg").html('<li class="user_desc"><span class="m_1">欢迎:<i class="user"></i> <a href="register.jsp">${sessionScope.qtuser.uname}</a><i><a href="<%=basePath%>user/qtlogout">退出</a></i><div class="clearfix">  </div> ');
		$("#show_sms").show();
		sendSMS();
		smsList();
	}
	
	<%-- $("#logout").click(function(){
		window.location.href=="<%=basePath%>user/qtlogout";
	}); --%>
});

function sendSMS(){
	$("#sendSMS").click(function(){
		$.ajax({
			url : "<%=basePath%>"+"sms/save",
			type : "post",
			dataType : "json",
			data:{"sconte":$("#sms_val").val(),"uid_a":$("#ta_uid").val(),"uid_b":"${sessionScope.qtuser.uid}"},
			async:false,
			success : function(data) {
				alert(data.result);
				smsList();
			}
		});
	});
}

function smsList(){
	$.ajax({
		url : "<%=basePath%>"+"sms/findList",
		type : "post",
		dataType : "json",
		data:{"id":$("#ta_uid").val()},
		async:false,
		success : function(data) {
			console.log(data);
			//$("#smsList")
			//alert(data.length);
			$("#smsList").empty();
			for(var i=0;i<data.length;i++){
				$("#smsList").append("<p>"+th_str(data[i].uid_b)+":"+data[i].sconte+"</p>");
			}
		}
	});
}

function th_str(a){
	var num = a.length;
    var str=a[0];
    for(var i=0;i<num-2;i++){
        str+='*';
    }
    str+=a[num-1];
    return str;
}

function show_user(){
	$.ajax({
		url : "<%=basePath%>"+"user/findById_qt",
		type : "post",
		dataType : "json",
		data:{"id":"${param.id}"},
		async:false,
		success : function(data) {
			console.log(data);
			$("#lovenum").html(data[0].lovenum);
			$("#img").html('<img src="'+data[0].img+'" class="img-responsive" alt="" style="width:222px;height:160px;" onclick="love_click(\''+data[0].uid+'\');" />');
			$("#uname").html('<a href="#" >'+data[0].fullname+' ,</a>'+data[0].address+'');
			$("#phone").html(data[0].phone);
			$("#age").html(data[0].age);
			$("#email").html(data[0].email);
			$("#sex").html(data[0].sex);
			$("#taste").html(data[0].taste);
			$("#ta_uid").val(data[0].uid);
		}
	});
}
//点击图片喜欢他
function love_click(uid){
	var uid_a ='${sessionScope.qtuser.uid}';
	if(uid_a==""){
		alert("请先登录再喜欢！");
	}else{
		$.ajax({
			url : "<%=basePath%>"+"love/save",
			type : "post",
			dataType : "json",
			data:{"uid_a":uid_a,"uid_b":uid},
			async:false,
			success : function(data) {
				console.log(data);
				alert(data.result);
			}
		});
	}
}
//喜欢排行
function loveTop(){
	$.ajax({
		url : "<%=basePath%>"+"user/findListTop",
		type : "post",
		dataType : "json",
		data:{},
		async:false,
		success : function(data) {
			console.log(data);
			$("#flexiselDemo3").empty();
			for(var i=0;i<data.length;i++){
				var str1='<li><img src="'+data[i].img+'" style="width:100px;height:72.21px;"/><div class="grid-flex"><a href="#">'+data[i].fullname+'</a><p>喜欢数:'+data[i].lovenum+'</p></div></li>';
				$("#flexiselDemo3").append(str1);
			}
		}
	});
}

//我喜欢的
function myLove(){
	
	var uid_a ='${sessionScope.qtuser.uid}';
	//flexiselDemo1
	if(uid_a==""){
		$("#flexiselDemo1").empty();
		$("#flexiselDemo1").append("请先登录");
	}else{
		$.ajax({
			url : "<%=basePath%>"+"love/findListBy_Uid",
			type : "post",
			dataType : "json",
			data:{"uid":uid_a},
			async:false,
			success : function(data) {
				$("#flexiselDemo1").empty();
				for(var i=0;i<data.length;i++){
					var str1='<li><img src="'+data[i].img+'" style="width:100px;height:72.21px;"/><div class="grid-flex"><a href="#">'+data[i].fullname+'</a><p>喜欢数:'+data[i].lovenum+'</p></div></li>';
					$("#flexiselDemo1").append(str1);
				} 
			}
		});
	}
	
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
			  <input type="hidden" name="ta_uid" id="ta_uid"/>
			  <a class="login" href="login.jsp" id="user_msg">
				<!-- <li class="user_desc"><span class="m_1">Already user ? </span>Login</li>
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
	   <h3>资料</h3>
	</div>
</div>
<div class="profile">
	<div class="container">
		<div class="col-md-8 profile_left">
			<div class="lsidebar span_1_of_profile">
			  <div class="grid_4">
			    <p id="img" ></p>
				<ul class="category_desc1">
				   <li class="cate_head" id="lovenum">1.100 votes</li>
				   <li class="cate_right">
				   	 <ul class="list1" id="love_is">
				   	    <!-- <li><a href="#"><i class="heart"> </i></a></li> -->
				   	    <!-- <li><a href="#"><i class="heart"> </i></a></li> -->
				   	   
				   	 </ul>
				   </li>
				   <div class="clearfix"> </div>
				</ul>
			   </div>
			</div>
			<div class="cont span_2_of_profile">
				<h4 id="uname"></h4>	
				<table class="profile-fields">
					<tbody>
						<tr>
							<th>性别</th>
							<td id="sex"></td>
						</tr>
												<tr>
							<th>年龄</th>
							<td id="age"></td>
						</tr>			
						<tr>
							<th>邮箱</th>
							<td id="email"></td>
						</tr>
						<tr>
							<th>联系方式</th>
							<td id="phone"></td>
						</tr>
					</tbody>
				</table>
	        <p id="taste"></p>
		    </div>
			<div class="clearfix"></div>	
		</div>
	    <div class="col-md-4">
		  <h4 class="m_4">喜欢排行榜</h4>
			<ul id="flexiselDemo3">
			 <!--  <li><img src="images/pic2.jpg" class="img-responsive" alt=""/></li>
			  <li><img src="images/pic1.jpg" class="img-responsive" alt=""/></li>
			  <li><img src="images/pic1.jpg" class="img-responsive" alt=""/></li>	 -->			   
		   </ul>
				    <script type="text/javascript">
					 $(window).load(function() {
						$("#flexiselDemo3").flexisel({
							visibleItems: 3,
							animationSpeed: 1000,
							autoPlay: true,
							autoPlaySpeed: 3000,    		
							pauseOnHover: true,
							enableResponsiveBreakpoints: true,
					    	responsiveBreakpoints: { 
					    		portrait: { 
					    			changePoint:480,
					    			visibleItems: 2
					    		}, 
					    		landscape: { 
					    			changePoint:640,
					    			visibleItems: 3
					    		},
					    		tablet: { 
					    			changePoint:768,
					    			visibleItems: 4
					    		}
					    	}
					    });
					    
					});
				   </script>
				   <script type="text/javascript" src="js/jquery.flexisel.js"></script>
				   <h4 class="recent">我喜欢的</h4>
				   <ul id="flexiselDemo1">
						<!-- <li><img src="images/pic1.jpg" /><div class="grid-flex"><a href="#">Syenergy 2mm</a><p>0 friend</p></div></li>
						<li><img src="images/pic2.jpg" /><div class="grid-flex"><a href="#">Surf Yoke</a><p>10 friends</p></div></li>
						<li><img src="images/pic3.jpg" /><div class="grid-flex"><a href="#">Salty Daiz</a><p>1 friend</p></div></li>
						<li><img src="images/pic1.jpg" /><div class="grid-flex"><a href="#">Cheeky Zane</a><p>0 friend</p></div></li>
						<li><img src="images/pic2.jpg" /><div class="grid-flex"><a href="#">Synergy</a><p>0 friend</p></div></li> -->
				     </ul>
				    <script type="text/javascript">
					 $(window).load(function() {
						$("#flexiselDemo1").flexisel({
							visibleItems: 3,
							animationSpeed: 1000,
							autoPlay: true,
							autoPlaySpeed: 3000,    		
							pauseOnHover: true,
							enableResponsiveBreakpoints: true,
					    	responsiveBreakpoints: { 
					    		portrait: { 
					    			changePoint:480,
					    			visibleItems: 2
					    		}, 
					    		landscape: { 
					    			changePoint:640,
					    			visibleItems: 3
					    		},
					    		tablet: { 
					    			changePoint:768,
					    			visibleItems: 4
					    		}
					    	}
					    });
					    
					});
				   </script>
		  </div>
		  <div id="show_sms" style="dispaly:none;">
		  	<div id="smsList">
		  		<!-- <p>1221:111</p> -->
		  	</div>
		  	<textarea rows="5" cols="50" id="sms_val"></textarea>
		  	<input type="button" id="sendSMS" value="留言"/>
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
	   <div class="copy wow fadeInUp" data-wow-delay="0.4s">
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