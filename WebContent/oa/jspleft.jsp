<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<!-- BEGIN SIDEBAR MENU -->        

	<ul class="page-sidebar-menu">
	
		<li style=" padding-bottom: 10px;">
			<div class="sidebar-toggler hidden-phone"></div>
		</li>
		
		<li class="start  " style="background-color: #11A49C;color: white;">

			<a url="#module=home" title="首页"  onclick="showTab(this);">

			<i class="icon-home"></i> 

			<span class="title" >首页</span>

			</a>

		</li>
		
		<s:iterator value="#session.power">
		
		<li>
			<a href="javascript:void(0);" ${list.size() > 0 ? "":'onclick="showTab(this);"'} title="${name}" url="${url}"> 
					<i class="${icon}"></i> 
					<span class="title"><s:property value="name"/></span>
					<s:if test="list.size > 0">
						<span class="arrow "></span>
					</s:if>
			</a>
			<s:if test="list.size > 0">
				<ul class="sub-menu">
					<s:iterator value="list">
						<li>
							<a href="javascript:void(0);" ${list.size() > 0 ? "":'onclick="showTab(this);"'} title="${name}" url="${url}" > 
								<i class="${icon}"></i> 
								<span class="title"><s:property value="name"/></span>
								<s:if test="list.size() > 0">
									<span class="arrow "></span>
								</s:if>
							</a>
							<s:if test="list.size() > 0">
								<ul class="sub-menu">
									<s:iterator value="list">
										<li>
											<a href="javascript:void(0);" ${list.size() > 0 ? "":'onclick="showTab(this);"'} title="${name}" url="${url}"> 
												<i class="${icon}"></i> 
												<span class="title"><s:property value="name"/></span> 
											</a>
										</li>
									</s:iterator>
								</ul>
							</s:if>
						</li>
					</s:iterator>
				</ul>
			</s:if>
		</li>
	</s:iterator>
	</ul>

	<!-- END SIDEBAR MENU -->
	