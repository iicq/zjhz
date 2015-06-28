<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<!-- BEGIN SIDEBAR MENU -->        

	<ul class="page-sidebar-menu">
	
		<li style=" padding-bottom: 10px;">
			
		 	<div class="sidebar-toggler hidden-phone"></div>
		</li>
		
		<li class="open">
			<a  href="javascript:void(0);"> 
				<i class="icon-map-marker"></i> 
				<span class="title">广告公司列表</span>
				<span class="arrow "></span>
			</a>
			<ul class="sub-menu" style="display: block;">
				<li id="web_index_left_pro1"  style="max-height: 650px;overflow: auto;"></li>
				<li>
					<p style="text-align: center;">符合条件的广告公司有<span style="color: red;" id="web_index_left_pro1_count">0</span></p>
				</li>
				<li id="web_index_left_pro1_page" >
					<div id="paginator_pro1"></div> 
				</li>
			</ul>
		</li>

	</ul>
	
<script>
$(document).ready(function(){
	initPro1();
});

function initPro1(){
	var action = "webIndexMap_info";
	var param = {
			path:"pro1.jsp",
			index:"1",
			size:"10"
	};
    web.loadPro1(action, param);
}



</script>

	