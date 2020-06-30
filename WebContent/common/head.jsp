<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	   if(session.getAttribute("user") == null && (request.getRequestURL().toString()).equals(basePath+"main.jsp")){
		   System.out.println("值为空");
		   response.sendRedirect("login.jsp");   
	   }
%>
<script>
	/* if("${sessionScope.user}" != null){
		alert(window.location.href);
	} */
</script>