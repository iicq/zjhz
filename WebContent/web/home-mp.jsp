<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="tabbable tabbable-custom boxless">

		<ul class="nav nav-tabs" id="tabTitle" style="background-color: #E9E9E9;border-bottom: 1px solid #B8B8B8;">
		
			<li class="dropdown user tab-title-class active" id="nav-tab-1">
				<a href="#portlet_tab1" data-toggle="tab"  onclick="ShowMarkers();">地图</a>
			</li>
					<li class="dropdown user">

						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							功能
						</a>

						<ul class="dropdown-menu">
							<li class="dropdown user tab-title-class" id="nav-tab-2">
								<a href="#portlet_tab2" data-toggle="tab"  onclick="setTimeout(function(){initMap_home2();},1);">列表</a>
							</li>
			
							<li class="dropdown user tab-title-class"  id="nav-tab-9" >
								<a href="javascript:void(0);" onclick ="search_info_fanwei_page();">定位</a>
							</li>
			
							<li class="dropdown user tab-title-class "  id="nav-tab-22">
								<a href="javascript:void(0)" onclick="MyUploadmp();">自定义上传</a>
							</li> 
					<li>
						<a href="#portlet_tab4" data-toggle="tab" onclick ="setTimeout(function(){initMap_home4();},1);">我的方案</a>
					</li>
					 <li>
						<a href="javascript:void(0);" onclick ="tuijianFangan();">推荐方案</a>
					</li>
						</ul>

					</li>
			
			<li class="dropdown user tab-title-class pull-right"  id="nav-tab-17" style="width: 135px;">
				<a href="javascript:void(0)"> 媒体总计：<span id="index_map_info_count">0</span>条</a>
			</li>
			
		</ul>
	 
		<div class="tab-content" id="tabContent"  style="padding-top: 0px;">
			<div class="tab-content-class tab-pane active" id="portlet_tab1">
				<s:include value="home1-mp.jsp"></s:include>
			</div>
			<div class="tab-content-class tab-pane" id="portlet_tab2"></div>
			<div class="tab-content-class tab-pane" id="portlet_tab3"></div>
			<div class="tab-content-class tab-pane" id="portlet_tab4"></div>
		</div>
		
	</div>
<script>

$(document).ready(function(){
	  initHome2();
	  initHome4('临时方案');
	 district = new District("information_region");
     district.initSelectProvince();

});

//初始化地图
function initHome1(){
	$("#portlet_tab1").load("home1-mp.jsp");
}

//初始化媒体列表
function initHome2(){
	var action = "webIndexMap_info";
	var param = {
			path:"home2.jsp",
			index:"1",
			size:"10"
	};
	
	web.loadHome2(action,param);
	
}

//初始化方案
function initHome4(schemeName){
	var action = "list_userScheme";
	var param = {
			path:"home4.jsp",
			index:"1",
			size:"0"
	};
	if(schemeName != undefined && schemeName != ""){
		param["userScheme.schemeName"] = schemeName;
	}
	web.loadHome4(action,param);
}


//查找推荐方案
function tuijianFangan(){
	showTab(1);
	$.ajax({url:"info-search-scheme.jsp", type:"post", data: null, 
		success: function(data){
			art.dialog("推荐方案",
					data,
					function(){
						search_fangan();
					}
			);
		}
	});
}

//视野内搜索
function search_info_fanwei_page(){
	showTab(1);
	$.ajax({url:"info-search-fanwei.jsp", type:"post", data: null, 
		success: function(data){
			art.param({
				title:"视野内搜索（关闭此窗口退出搜索。）",
				content:data,
				lock:false,
				left:"10%",
				esc:false,
				init:function(){
					try {
						ViewSearchStart();
					} catch (e) {	}
				},
				button:[{
					name:"显示列表",
					callback:function(){
						showInfoByIds(fanweiInfoIdArray);
						return false;
					}
				}],
				ok:function(){
					ViewSearchradiusMarkers();
					return false;
				},
				okVal:"搜索",
				cancel:function(){
					try {
						removeViewSearchMarker();
					} catch (e) {	}
				}
			});
		}
	});
}

/**
 * 设置总条数显示数量
 */
function setIndexInfoCount(count){
	$("#index_map_info_count").html(count);
}



</script>
	
	