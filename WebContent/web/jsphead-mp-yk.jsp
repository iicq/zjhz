<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<meta name="baidu-site-verification" content="vZfMCAT4fC" />
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?ce4c8aa97135c850fd2ad4905a153f06";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container-fluid" style="background: linear-gradient(45deg,#F9F9F9 0%,#F4F4F4 100%);">
				 
				<a class="brand" href="javascript:location.reload();">

					<img src="/image/logo.png" alt="logo" style="width: 100px;height: 30px;"/> 
					
				</a>
				 
				<div id="mapBanner"></div>
				
				<a href="javascript:void(0);" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse"
					 style="padding: 0px;margin-top: 5px;">
					<img src="img/sidebar-toggler-light.jpg" alt="">
				</a>
					<a href="/login-mp.jsp" style="margin-left: 200px" >登录</a>
			
				<div  style="display: inline; "  >
					
				</div> 
				
				<!-- <button style="display: inline;margin-top: 7px;margin-left: 20px;background-color: #00B3D3;" class="btn green" onclick="search_info_param();">高级搜索</button> -->
				
								
				
			</div>
			
		</div>
	</div>
<script>
//绑定回车事件
$("#index_search_info").keydown(function(event){
	if(event.keyCode==13){
		search_info();
	}
});

function showMoreParam_search(){
	$("#moreSearchParam").slideToggle();
}


//搜索条搜索
function search_info(){
	search_info1();
	search_info2(0);
}
function search_info1(){
		art.tips("媒体正在搜索中请稍后...<i id=\"map_info_count_show\"></i>",5,"loading.gif");
}
function search_info2(time){
	setTimeout(function(){
	$("#moreSearchParam").hide();
	var param = web.formParams("moreSearchParam");
	param["query.word"] = $("#index_search_info").val();

	param["index"] = "1";
	param["size"] = "0";
	 
	$.ajax({url:"searchWordJson_info", type:"post",async: false,data: param, dataType:"json",
		success: function(data){
			//隐藏全部标记
			 visibleMarkers(); 
			//设置首页显示总行数
			setIndexInfoCount(data.length);
			//清空历史地图数据 重新赋值；
			infoMarkersTemp = {};
			for(var i = 0 ; i < data.length; i++){
				infoMarkers[data[i].id].setVisible(true);
				//保存到临时地图数据
				infoMarkersTemp[data[i].id] = infoMarkers[data[i].id];
			}
			param["path"] = "home2.jsp";
			param["index"] = "1";
			param["size"] = "10";
			
			web.loadHome2("searchWord_info",param);
		 	
			showTab(1);
			art.tips("搜索成功，结果已经显示在地图上。",1,"success.gif"); 
		}
	});
	},time);
}
</script>
