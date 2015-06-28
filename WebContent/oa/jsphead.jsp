<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	
	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

				<a class="brand" href="/oa/index.jsp" style="color:blue;padding-left: 20px;">

					<!-- <img src="/image/logo.png" alt="logo" style="width: 100px;height: 30px;"/>  -->
					
				</a>

				<!-- END LOGO -->         
				<a href="javascript:void(0);" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
					<img src="img/sidebar-toggler-light.jpg" alt="">
				</a>
				<!-- BEGIN TOP NAVIGATION MENU -->              

				<ul class="nav pull-right">

					<!-- BEGIN USER LOGIN DROPDOWN -->
					<!-- <li>
						<a href="/web/index.jsp" style="color: green;font-weight:bold;">进入前台页面</a>
					</li> -->
					
<%-- 					<li class="dropdown user">

						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img alt="" src="${session.user.head}" style="width:30px;height:30px;" />
	
							<span class="username" style="color: green;font-weight:bold;">工具</span>
	
							<i class="icon-angle-down"></i>

						</a>

						<ul class="dropdown-menu">
							<li>
								<a href="javascript:checkWebIds();">
									检测重复Id
								</a>
								<a href="javascript:showInWindow();">
									log打印window变量
								</a>
								<a href="javascript:showNowTabId();">
									log打印nowTabId变量
								</a>
								<a href="javascript:showDomById();">
									log打印指定Id的DOM
								</a>
							</li>
						</ul>
					</li> --%>
					
					
					
					
					<li class="dropdown user">

						<a href="#" class="dropdown-toggle" data-toggle="dropdown">

							<img alt="" id="nvrHeadImg" src="${session.user.head}" style="width:30px;height:30px;" />
	
							&nbsp;&nbsp;
							
							<span class="username" style="color: green;font-weight:bold;">${session.user.name}</span>
	
							<i class="icon-angle-down"></i>

						</a>

						<ul class="dropdown-menu">
							<s:if test="#session.user != null">
								<li>
									<a url="#module=admin-show&action=find_admin&data.id=${session.user.id}" title="个人资料" onclick="showTab(this)">
										<i class="icon-user"></i> &nbsp; 个人资料
									</a>
								</li>
								
								<li>
									<a href="javascript:reloadPower();">
										<i class="icon-bolt"></i> &nbsp; 刷新权限
									</a>
								</li>
								
								<li>
									<a url="#module=change-password" title="更改密码" onclick="showTab(this)">
										<i class="icon-key"></i> &nbsp; 更改密码
									</a>
								</li>
								
								<li>
									<a url="#module=change-headimg" title="更改头像" onclick="showTab(this)">
										<i class="icon-camera"></i> &nbsp; 更改头像
									</a>
								</li>
							<!-- 	<li>
									<a href="javascript:tools.tip('没做呢还');">
										<i class="icon-cog"></i> &nbsp; 设置
									</a>
								</li> -->
							</s:if>
							
							<li><a href="/oa/logout_login"><i class="icon-off"></i> &nbsp; 注销</a></li>

						</ul>

					</li>

					<!-- END USER LOGIN DROPDOWN -->

				</ul>
				<%-- <ul class="nav nav-tabs"  style="margin-left: 10px;" id="tabTitle">
			
					<li  class="active" onclick="tabClick(this)" name="首页">
						<a href="#tab_1" data-toggle="tab">
							<span id="1">首页</span> 
						</a>
					</li>
					
				</ul> --%>
				<!-- END TOP NAVIGATION MENU --> 

			</div>
			
		</div>

		<!-- END TOP NAVIGATION BAR -->
				
	</div>
		<!-- END HEADER -->
