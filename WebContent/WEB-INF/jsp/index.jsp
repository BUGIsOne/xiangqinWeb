<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/head.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
        .lightbox{
            position: fixed;
            top: 0px;
            left: 0px;
            height: 100%;
            width: 100%;
            z-index: 7;
            opacity: 0.3;
            display: block;
            background-color: rgb(0, 0, 0);
            display: none;
        }
        .pop,iframe{
            position: absolute;
            left: 50%;
            top:0;
            width: 893px;
            height: 100%;
            margin-left: -446.5px;
            z-index: 9;
        }
    </style>
<script src="js/pdf.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url : "<%=basePath%>"+"file/fileList",
				type : "post",
				dataType : "json",
				success : function(data) {
					console.log(data);
					for(var i=0;i<data.length;i++){		 
						 var html1="<tr><td>"+data[i].filename+"</td>"
						 var html2="<td>"+data[i].uplodetime+"</td><td><a href='"+data[i].fileurl+"' target='pdfContainer' onclick='showPdf(true)'>浏览<a></td></tr>";
						 var html=html1+html2;
						 $('#fileList').append(html);
					}
				}
		});
	})
	
  	function showPdf(isShow) {
	    var state = "";
	    if (isShow) {
	        state = "block";
	    } else {
	        state = "none";
	    }
	    var pop = document.getElementById("pop");
	    pop.style.display = state;
	    var lightbox = document.getElementById("lightbox");
	    lightbox.style.display = state;
    }
    function close() {
        showPdf(false);
    }
</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>文件名</th>
			<th>上传时间</th>
			<th>下载</th>
		</tr>
		<tbody id="fileList">
		
		</tbody>
		
		<div class="lightbox" id="lightbox"></div>
    	<div id="pop" class="pop" style="display: none;">
        <a href="javascript:close()" style="position: absolute;right: -90px;display: inline-block;width: 80px;height: 30px;" id="close">关闭</a>
        <iframe src="" frameborder="0" id="pdfContainer" name="pdfContainer"></iframe>
    	</div>
	</table>
</body>
</html>