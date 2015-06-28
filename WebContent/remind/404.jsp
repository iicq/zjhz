<%@ page contentType="text/html;charset=UTF-8" language="java"  isErrorPage="true" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<% String path = request.getContextPath(); %>
<html>
<head><title>404</title>

<link href="<%=path %>/tools/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/tools/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.min.css" rel="stylesheet">
<link href="<%=path %>/remind/css/error.css" rel="stylesheet"/>
<style type="text/css">
.navbar{
	background-color: #438EB9;
}
</style>
<script src="<%=path %>/tools/js/jquery-1.9.1.js"></script>
<script src="<%=path %>/tools/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/tools/bootbox/bootbox.min.js"></script>
<script src="<%=path %>/tools/js/tools.js"></script>
<script  type="text/javascript">
var start = 5;
var step = 1;

$("#container").ready(function (){
	count();
});

function count()
{
	$("#time").text(start);
	if(start == 5){
		step *= -1;
	}
	
	start += step;
	if(start < 0){
		history.go(-1);
	}else{
		setTimeout("count()",1000);
	}
	
}

</script>
</head>
<body style="background-color: white;">
	
	<div id="container" class="full-width" style="height:700px;">
		<img class="png" src="<%=path %>/remind/images/404.png" /> 
		<img class="png msg" src="<%=path %>/remind/images/404_msg.png" />
	  	<p style="color:white;">
	  	
	  		 <span id="time"></span>
		 	 <span>秒后，返回上一页。或者你可以 </span>
		 	 <a style="color:blue;" href="javascript:history.go(-1);">
		 	 	&nbsp;&nbsp;点此返回
		 	 </a> 
	  	</p>
	</div>
	<div id="cloud" class="png"></div>
	<pre style="DISPLAY: none"></pre>
</body>
</html>