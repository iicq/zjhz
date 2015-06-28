<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- 资源加载 -->
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><html lang="en" class="no-js"> <!--<![endif]-->
<html>
<head>
	<meta charset="utf-8" />
	<title>Wellcome To Saagood</title>
	<meta content="width=device-width, initial-scale=1.0" 				name="viewport" 	/>
	<meta content="Saagood" 																name="description" />
	<meta content="GaoXiang" 																name="author" 		/>
	
	<link href="/oa/media/css/bootstrap.min.css" 										rel="stylesheet" />
	<link href="/oa/media/css/bootstrap-responsive.min.css" 					rel="stylesheet" />
	<link href="/oa/media/css/font-awesome.min.css" 								rel="stylesheet" />
	<link href="/oa/media/css/style-metro.css" 										rel="stylesheet" />
	<link href="/oa/media/css/bootstrap-fileupload.css" 				rel="stylesheet" />
	<link href="/oa/media/css/datepicker.css" 							rel="stylesheet" />
	<link href="/oa/media/css/chosen.css" 							rel="stylesheet" />
	
	
	
	<link href="css/style.css"						 								rel="stylesheet" />
	<link href="css/style-responsive.css" 									rel="stylesheet" />
	<link href="css/polaris.css" 													rel="stylesheet" />
	<link href="css/light.css" 														id="style_color"	rel="stylesheet" />
	<link href="css/index.css" 														rel="stylesheet" />


	<link href="/image/favicon.ico"  											rel="shortcut icon"/>
	
	
	<script src="/tools/js/jquery-1.11.1.js" >																		</script>
	<script src="/tools/js/district.js">																				</script>
	<script src="/oa/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript">		</script>
	<script src="/oa/media/js/bootstrap.min.js" type="text/javascript">							</script>
	<script src="/oa/media/js/app.js" >																				</script>
	<script src="/oa/media/js/chosen.jquery.min.js">													</script>
	<script src="/oa/media/js/bootstrap-fileupload.js">													</script>
	<script src="/oa/js/jquery.imgareaselect.pack.js">														</script>
	
	<!--[if lt IE 9]>
	<script src="/oa/media/js/excanvas.min.js">																		</script>
	<script src="/oa/media/js/respond.min.js">																		</script>  
	<![endif]-->   
	<script src="/tools/bootbox/bootbox.js">																		</script>
	<script src="/web/js/ajaxfileupload.js" >																		</script>
	<script src="/tools/lhgdialog/lhgdialog.min.js?skin=discuz">											</script>
	<script src="/web/js/bootstrap-paginator.js">																</script>
	<script src="/oa/media/js/bootstrap-datepicker.js">													</script>
	<script src="/web/js/icheck.min.js">																				</script>
	<script src="/web/js/web.js">																						</script>
	<script src="/web/js/myDialog.js">																				</script>
	<script src="/web/js/nav.js">																							</script>
	<script src="/web/js/indexInit.js">																				</script>
	<script type="text/javascript" src="http://ditu.google.cn/maps/api/js?language=zh-CN&sensor=false"> 			</script>
	<script type="text/javascript" src="/web/js/googleMap.js">										</script>

</head>
<body  class="page-header-fixed page-sidebar-closed" >

	<s:include value="jsphead-mp.jsp"></s:include>
	
	<div class="page-container" style="background-color: #F6F7F5;">
	
		<div class="page-sidebar nav-collapse collapse" style="background-color: #F6F7F5;">
			<s:include value="jspleft.jsp"></s:include>
		</div>
		
		<div class="page-content index">
			<s:include value="home-mp.jsp"></s:include>
		</div>

	</div>
</body>


      
</html>