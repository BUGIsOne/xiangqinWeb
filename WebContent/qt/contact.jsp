<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Contact</title>
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
</head>
<body>
<div class="header">
	<div class='container'>
		<div class="header_left">
			<img src="images/rate.png" alt=""/>
		</div>
		<div class="logo">
			<a href="index.html"><img src="images/logo.png" alt=""/>
				<span>Soulmate</span>
			</a>
		</div>
		<div class="header_right">
			<ul class="header_user_info">
			  <a class="login" href="login.html">
				<li class="user_desc"><span class="m_1">Already user ? </span>Login</li>
				<i class="user"> </i> 
				<div class="clearfix"> </div>
			  </a>
			  <div class="clearfix"> </div>
	    	</ul>
			<a href="register.html" class="btn1 btn-1 btn1-1b">Sign Up</a>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<div class="profile_banner">
	<div class="container"> 
	   <h3>Contact</h3>
	</div>
</div>
<div class='profiles'>
  <div class="container">
	 <div class="about_box1">
	  	<h1 class="m_4">
          Contact Info
        </h1>
        <p class="m_5">
           In pede maliquet sit amet euismod in auctor ut ligula
        </p>
        <div class="map">
		     <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
	     </div>
	</div>
  </div>
</div>
<div class="facts">
   <div class="container">
      <div class="col-md-8 contact-top">
		<h2 class="m_10">
          Contact Form
        </h2>
        <p class="m_5">
           In pede maliquet sit amet euismod in auctor ut ligula
        </p>
           <div class="contact_grid">
			  <form>
					<div class="to">
                     	<input type="text" class="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
					 	<input type="text" class="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" style="margin-left:20px">
					 	<input type="text" class="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}" style="margin-left:20px">
					</div>
					<div class="text">
	                   <textarea value="Message:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message:</textarea>
	                </div>
	                <div class="form-submit">
			          
			           <label class="btn2 btn-2 btn2-1b"><input type="submit" value="Submit"></label>
					</div>
					<div class="clearfix"></div>
               </form>
           </div>
       </div>
       <div class="col-md-4 contact-top_right">
		<h2 class="m_10">
          Address
        </h2>
        <p class="m_5">
           In pede maliquet sit
        </p>
        <ul class="list">
			<li>Phone:+257-587-1458</li>
			<li>Fax:+257-587-1458</li>
			<li>Email:<a href="mailto:info@example.com"> info(at)soulmate.com</a></li>
			<li>Address:1254, lobortis nisl</li>
		</ul>
	   </div>
     </div>
</div>
<div class="footer">
	<div class="container">
		<div class="cssmenu">
		  <ul>
			<li><a href="index.html">Home</a></li> 
			<li><a href="about.html">About</a></li>
			<li><a href="profiles.html">Add Profile</a></li>
			<li class="active"><a href="contact.html">Contact</a></li>
		  </ul>
	    </div>
	    <div class="copy">
			<p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
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