<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><html lang="en" class="no-js"> <![endif]-->
<html>
<head>
	<meta charset="utf-8" />
	<title>资金互助</title>
	<meta content="width=device-width, initial-scale=1.0" 		name="viewport" />
	<meta content="Saagood" 														name="description" />
	<meta content="GaoXiang" 														name="author" />
	
	<!-- BEGIN core STYLES -->
	<link href="/oa/media/css/bootstrap.min.css" 						rel="stylesheet" />
	<link href="/oa/media/css/bootstrap-responsive.min.css" 		rel="stylesheet" />
	<link href="/oa/media/css/font-awesome.min.css" 					rel="stylesheet" />
	<link href="/oa/media/css/style-metro.css" 							rel="stylesheet" />
	<link href="/oa/media/css/style.css"						 				rel="stylesheet" />
	<link href="/oa/media/css/style-responsive.css" 					rel="stylesheet" />
	<link href="/oa/media/css/light.css" 										rel="stylesheet"  id="style_color"/>
	<link href="/oa/media/css/uniform.default.css" 					rel="stylesheet" />
	<!-- END core STYLES -->

	<!-- BEGIN needs STYLES -->
	<link href="/oa/media/css/chosen.css"									rel="stylesheet" />
	<link href="/oa/media/css/bootstrap-tree.css" 						rel="stylesheet" />
	<link href="/oa/media/css/datepicker.css" 							rel="stylesheet" />
	<link href="/oa/media/css/bootstrap-fileupload.css" 				rel="stylesheet" />
	<link href="/oa/css/imgareaselect-default.css" 				rel="stylesheet" />

	<link href="/oa/css/index.css" 												rel="stylesheet" />
	
	<link href="/image/favicon.ico"  										rel="shortcut icon"/>
	<!-- END needs STYLES -->
	
	<!-- BEGIN CORE PLUGINS -->
	<script src="/tools/js/jquery-1.11.1.js" >																</script>
	<script src="/oa/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript">			</script>
	<script src="/oa/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript">		</script>      
	<script src="/oa/media/js/bootstrap.min.js" type="text/javascript">							</script>
	<!--[if lt IE 9]>
	<script src="media/js/excanvas.min.js"></script>
	<script src="media/js/respond.min.js"></script>  
	<![endif]-->   
	<script src="/oa/media/js/jquery.slimscroll.min.js" type="text/javascript">					</script>
	<script src="/oa/media/js/jquery.blockui.min.js" type="text/javascript">					</script>  
	<script src="/oa/media/js/jquery.cookie.min.js" type="text/javascript">						</script>
	<script src="/oa/media/js/jquery.uniform.min.js" type="text/javascript" >					</script>
	<script src="http://ditu.google.cn/maps/api/js?language=zh-CN&sensor=false"> 	</script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN needs PLUGINS -->
	<script src="/oa/media/js/chosen.jquery.min.js">					</script>
	<script src="/oa/media/js/jquery.inputmask.bundle.min.js">	</script>
	<script src="/tools/js/district-oa.js">								</script>
	<script src="/oa/js/bootstrap-paginator.js">							</script>
	<script src="/oa/media/js/bootstrap-datepicker.js">				</script>
	<script src="/oa/media/js/bootstrap-fileupload.js">				</script>
	<script src="/oa/js/jquery.imgareaselect.pack.js">			</script>
	<script src="/tools/bootbox/bootbox.js">							</script>
	<script src="/tools/js/md5.js">											</script>
	<script src="/oa/media/js/ajaxfileupload.js" >							</script>
	<script src="/tools/js/jquery.pin.js" >								</script>
	
	<script src="/tools/xheditor-1.2.1/xheditor-1.2.1.min.js" >								</script>
	<script src="/tools/xheditor-1.2.1/xheditor_lang/zh-cn.js">							</script>
	<!-- END needs PLUGINS -->

	<!-- 自定义js 文件 页面加载完成以后执行 -->
	<script src="media/js/app.js" >										</script>
	<script src="/tools/js/tools.js">										</script>
	<script src="/oa/js/navtabs.js">										</script>
	<script src="/oa/js/indexInit.js">									</script>
	<script src="/oa/js/googleMap.js">								</script>
	<script src="/oa/js/action.js">										</script>
	<script src="/oa/js/dwz.print.js" type="text/javascript"></script>
	
		
	<script src="/tools/lhgdialog/lhgdialog.min.js?skin=discuz">											</script>
<%-- <script type="text/javascript" src="js/jquery.min.js"></script> --%>
<script type="text/javascript" src="js/highcharts.js"></script>
</head>
<body  class="page-header-fixed ">

	<s:include value="jsphead.jsp"></s:include>
	
	<div class="page-container">
	
		<div class="page-sidebar nav-collapse collapse">
				<s:include value="jspleft.jsp"></s:include>
		</div>
		
		<div class="page-content">
			
			<div class="tabbable tabbable-custom boxless">
			
				<ul class="nav nav-tabs"  style="z-index: 9999;background-color: white;" id="tabTitle">
			
					<li  class="active" onclick="tabClick(this)" name="首页">
						<a href="#tab_1" data-toggle="tab">
							<span id="1">首页</span> 
						</a>
					</li>
					
				</ul> 
			
				<div class="tab-content index" id="tabContent">
			
					<div class="tab-pane active" id="tab_1">
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">

		<div class="footer-inner" >
			2014 © 资金互助管理系统
		</div>
		
		<div class="footer-tools">
			<span class="go-top">
			<i class="icon-angle-up"></i>
			</span>
		</div>
	</div>
</body>
</html>