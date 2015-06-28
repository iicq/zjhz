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
			
				<div  style="display: inline; "  >
						
					<div class="input-prepend visible-desktop" style="margin-left: 70px;margin-top: 7px;" id="medium_type">

						<div class="btn-group" style="margin-top: 7px;">

							<button class="btn search-type-button" onclick="showMoreParam_search();" >
								<span class="icon-list-ul"></span>
								分类
								<%-- <span class="caret"></span> --%>
								
							</button>
							
						</div>

						<input class="m-wrap" autoComplete="on" id="index_search_info" type="text" style="width: 400px;margin-top: 7px;" >
						
						<button class="btn green" onclick="search_info();" style="margin-top: 7px;margin-left: 20px;background-color: #11A49C;">赛谷一下</button>
						
						<button class="btn green" onclick="reloadInFanWei();" style="margin-top: 7px;margin-left: 20px;background-color: #00B3D3;">范围内刷新</button>
						
					</div>
					
				</div> 
				
				<button style="display: inline;margin-top: 7px;margin-left: 20px;background-color: #00B3D3;" class="btn green" onclick="search_info_param();">高级搜索</button> 
				
			</div>
			
		</div>
		<div id="moreSearchParam" style="width: 600px;height: 300px;margin-left: 300px;display: none;background-color: white;">
			<div style="padding: 10px; padding-bottom:20px; width: 600px;" >
					<fieldset>
						<legend>请选择搜索类型</legend>
					</fieldset>
					 <table style="width: 100%">
					<tr height="30">
						<td>
							<label for="search_type_2" style="display: inline;" >
									<input id="search_type_2" type="checkbox" style="vertical-align: -3px;" value="LM" name="query.type">
									两面
							</label>
						</td>
						<td>
							<label for="search_type_22" style="display: inline;" >
									<input id="search_type_22" type="checkbox" style="vertical-align: -3px;" value="SMD" name="query.type">
									三面对
							</label>
						</td>
						<td>
							<label for="search_type_4" style="display: inline;" >
									<input id="search_type_4" type="checkbox" style="vertical-align: -3px;" value="DX" name="query.type">
									灯箱
							</label>
						</td>
						<td>
							<label for="search_type_5" style="display: inline;" >
									<input id="search_type_5" type="checkbox" style="vertical-align: -3px;" value="KQ" name="query.type">
									跨桥
							</label>
						</td>
						<td>
							<label for="search_type_6" style="display: inline;" >
									<input id="search_type_6" type="checkbox" style="vertical-align: -3px;" value="LD" name="query.type">
									楼顶
							</label>
						</td>
						<td>
							<label for="search_type_7" style="display: inline;" >
									<input id="search_type_7" type="checkbox" style="vertical-align: -3px;" value="LED" name="query.type">
									电子屏
							</label>
						</td>
					</tr>

					<tr height="30">
						<td>
							<label for="search_type_10" style="display: inline;" >
									<input id="search_type_10" type="checkbox" style="vertical-align: -3px;" value="LMD" name="query.type">
									两面对
							</label>
						</td>
						<td>
							<label for="search_type_24" style="display: inline;" >
									<input id="search_type_24" type="checkbox" style="vertical-align: -3px;" value="WD" name="query.type">
									围挡
							</label>
						</td>
						<td>
							<label for="search_type_18" style="display: inline;" >
									<input id="search_type_18" type="checkbox" style="vertical-align: -3px;" value="SF" name="query.type">
									三翻
							</label>
						</td>
						<td>
							<label for="search_type_19" style="display: inline;" >
									<input id="search_type_19" type="checkbox" style="vertical-align: -3px;" value="SFZ" name="query.type">
									收费站
							</label>
						</td>
						<td>
							<label for="search_type_23" style="display: inline;" >
									<input id="search_type_23" type="checkbox" style="vertical-align: -3px;" value="ZSP" name="query.type">
									指示牌
							</label>
						</td>
						<td>
							<label for="search_type_21" style="display: inline;" >
									<input id="search_type_21" type="checkbox" style="vertical-align: -3px;" value="SM" name="query.type">
									三面
							</label>
						</td>
					</tr>
					<tr height="30">
						<td>
							<label for="search_type_17" style="display: inline;" >
									<input id="search_type_17" type="checkbox" style="vertical-align: -3px;" value="QT" name="query.type">
									其他
							</label>
						</td>
						<td>
							
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
				</table>
				
				
				</div>
				<div style="padding: 10px; padding-bottom:20px; width: 300px;" >
					<label for="infoQueryZS1" style="display: inline;margin-left: 15px;" class=" ">
						<input type="radio" name="query.zhaoshang" id="infoQueryZS1" value="1" style="vertical-align: -3px;">
						招商
					</label>
					
					
					<label for="infoQueryZS2" style="display: inline;margin-left: 15px;" class=" " >
						<input type="radio" name="query.zhaoshang" id="infoQueryZS2" checked value="" style="vertical-align: -3px;">
						全部
					</label>
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
	/* 
	$("#moreSearchParam").hide();
	var param = web.formParams("moreSearchParam");
	param["query.word"] = $("#index_search_info").val();

	param["index"] = "1";
	param["size"] = "0";
	 
	$.ajax({url:"searchWordJson_info", type:"post",async: false,data: param, dataType:"json",
		beforeSend:function(XMLHttpRequest){
			art.tips("正在搜索...",10,"loading.gif");
		},
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
	}); */
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
//高级搜索
function search_info_param(){

	$.ajax({url:"listQuery_type?path=info-search.jsp", type:"post", data: null, 
    	success: function(data){
    		art.dialog("高级搜索",
    				data,
					function(){
						search_21();
					}
			);
    	}
    });
}
</script>
