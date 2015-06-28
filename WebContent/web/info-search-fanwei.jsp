<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
		
		<div style="width: 320px;">
			
			<span>搜索范围：</span>
			<br><br>
			<label for="fanwei_range_1" style="display: inline;" class=" " >
				<input type="radio" name="range" id="fanwei_range_1" style="vertical-align: -2px;" onclick="changeViewSearchradius(10)" checked="checked">
						10公里
			</label>
			<label for="fanwei_range_2" style="display: inline;margin-left: 15px;" class=" " >
				<input type="radio" name="range" id="fanwei_range_2" style="vertical-align: -2px;" onclick="changeViewSearchradius(20)">
						20公里
			</label>
			<label for="fanwei_range_3" style="display: inline;margin-left: 15px;" class=" " >
				<input type="radio" name="range" id="fanwei_range_3" style="vertical-align: -2px;" onclick="changeViewSearchradius(30)">
						30公里
			</label>
			<br><br>
			<label for="fanwei_range_4" style="display: inline;" class=" " >
				<input type="radio" name="range" id="fanwei_range_4" style="vertical-align: -2px;" onclick="changeViewSearchradius(40)">
						40公里
			</label>
			<label for="fanwei_range_5" style="display: inline;margin-left: 15px;" class=" " >
				<input type="radio" name="range" id="fanwei_range_5" style="vertical-align: -2px;" onclick="changeViewSearchradius(50)">
						50公里
			</label>
			<label for="fanwei_range_6" style="display: inline;margin-left: 15px;" class=" " >
				<input type="radio" name="range" id="fanwei_range_6" style="vertical-align: -2px;" onclick="changeViewSearchradius(60)">
						60公里
			</label>
			
			<br><br>
			<div  id="info_search_fanwei_param">
				<span>搜索类型：</span>
				<br><br>
				<table style="width: 100%">
					<tr height="30">
						<td>
							<label for="fanwei_type_2" style="display: inline;" >
									<input id="fanwei_type_2" type="checkbox" style="vertical-align: -3px;" value="LM" name="query.type">
									两面
							</label>
						</td>
						<td>
							<label for="fanwei_type_22" style="display: inline;" >
									<input id="fanwei_type_22" type="checkbox" style="vertical-align: -3px;" value="SMD" name="query.type">
									三面对
							</label>
						</td>
						<td>
							<label for="fanwei_type_4" style="display: inline;" >
									<input id="fanwei_type_4" type="checkbox" style="vertical-align: -3px;" value="DX" name="query.type">
									灯箱
							</label>
						</td>
						<td>
							<label for="fanwei_type_5" style="display: inline;" >
									<input id="fanwei_type_5" type="checkbox" style="vertical-align: -3px;" value="KQ" name="query.type">
									跨桥
							</label>
						</td>
						</tr>
						<tr>
						<td>
							<label for="fanwei_type_6" style="display: inline;" >
									<input id="fanwei_type_6" type="checkbox" style="vertical-align: -3px;" value="LD" name="query.type">
									楼顶
							</label>
						</td>
						<td>
							<label for="fanwei_type_7" style="display: inline;" >
									<input id="fanwei_type_7" type="checkbox" style="vertical-align: -3px;" value="LED" name="query.type">
									LED屏
							</label>
						</td>
						<td>
							<label for="fanwei_type_10" style="display: inline;" >
									<input id="fanwei_type_10" type="checkbox" style="vertical-align: -3px;" value="LMD" name="query.type">
									两面对
							</label>
						</td>
						<td>
							<label for="fanwei_type_24" style="display: inline;" >
									<input id="fanwei_type_24" type="checkbox" style="vertical-align: -3px;" value="WD" name="query.type">
									围挡
							</label>
						</td>
						
					</tr>

					<tr height="30">
						
						<td>
							<label for="fanwei_type_18" style="display: inline;" >
									<input id="fanwei_type_18" type="checkbox" style="vertical-align: -3px;" value="SF" name="query.type">
									三翻
							</label>
						</td>
						<td>
							<label for="fanwei_type_19" style="display: inline;" >
									<input id="fanwei_type_19" type="checkbox" style="vertical-align: -3px;" value="SFZ" name="query.type">
									收费站
							</label>
						</td>
						<td>
							<label for="fanwei_type_23" style="display: inline;" >
									<input id="fanwei_type_23" type="checkbox" style="vertical-align: -3px;" value="ZSP" name="query.type">
									指示牌
							</label>
						</td>
						<td>
							<label for="fanwei_type_21" style="display: inline;" >
									<input id="fanwei_type_21" type="checkbox" style="vertical-align: -3px;" value="SM" name="query.type">
									三面
							</label>
						</td>
					</tr>
					<tr height="30">
						<td>
							<label for="fanwei_type_17" style="display: inline;" >
									<input id="fanwei_type_17" type="checkbox" style="vertical-align: -3px;" value="QT" name="query.type">
									其他
							</label>
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
			<br>
			<span>搜索结果：</span><span id="fanweiInfosCount">0</span>个符合条件的媒体。
		</div>
<script>


function ViewSearchStart() { // 添加监听动作视野搜索

	visibleMarkers();
	
	if (typeof (ViewSearchMarker) == 'undefined' || ViewSearchMarker == null) {
		
		var bs = map.getBounds(); // 获取可视区域
		
		var latlng = bs.getCenter();	//获取可视区域中心点
		
		var myOptions = {
			position : latlng,
			draggable : true,
			map : map,
			icon : "img/map/dd-start.png"
		};
		
		ViewSearchMarker = new google.maps.Marker(myOptions);
		
		var populationOptions = {
			strokeColor : '#FF0000',
			strokeOpacity : 0.8,
			strokeWeight : 2,
			fillColor : '#FF0000',
			fillOpacity : 0.35,
			map : map,
			center : ViewSearchMarker.getPosition(),
			radius : 10 * 1000
		};
		map.setCenter(ViewSearchMarker.getPosition());
		
		circle = new google.maps.Circle(populationOptions);
		
		
		// 移动事件绑定
		google.maps.event.addListener(ViewSearchMarker, "dragend", function() {
			circle.setCenter(ViewSearchMarker.getPosition());
			visibleMarkers();
			ViewSearchradiusMarkers();
		});

		// 右击取消
		google.maps.event.addListener(circle, "rightclick", function() {
			removeViewSearchMarker();
		});
	}
}


//获取范围内标注
function ViewSearchradiusMarkers(){
	ViewSearchradiusMarkers1();
	ViewSearchradiusMarkers2(0);
/*  	var param = web.formParams("info_search_fanwei_param");
 	param["query.word"] = "";
	param["index"] = "1";
	param["size"] = "0";
	
	$.ajax({url:"searchWordJson_info", type:"post",async: false,data: param, dataType:"json",
		beforeSend:function(XMLHttpRequest){
			art.tips("正在搜索...",100,"loading.gif");
		},
		success: function(data){
			visibleMarkers();
			//清空历史地图数据 重新赋值；
			infoMarkersTemp = {};
			var resoultCount = 0;
			var markerArray='';
			//显示标记内媒体
			for(var i = 0 ; i < data.length; i++){
				if(infoMarkers[data[i].id] != undefined){
					var flag=circle.getBounds().contains(infoMarkers[data[i].id].getPosition());	 
					if(flag == true){
						infoMarkers[data[i].id].setVisible(true);
						//保存到临时地图数据
						infoMarkersTemp[data[i].id] = infoMarkers[data[i].id];
						//传递给弹窗
						markerArray = markerArray+','+data[i].id;
						resoultCount++;
					}
				}
			}
			fanweiInfoIdArray = markerArray;
			$("#fanweiInfosCount").html(resoultCount);
			setIndexInfoCount(resoultCount);
			art.tips("查找成功。",0.5,"success.gif");
			//showInfoByIds(markerArray);	//显示弹窗
		}
	}); */
}
function ViewSearchradiusMarkers1(){
	art.tips("媒体正在搜索中请稍后...");
}
function ViewSearchradiusMarkers2(time){
	setTimeout(function(){
 	var param = web.formParams("info_search_fanwei_param");
 	param["query.word"] = "";
	param["index"] = "1";
	param["size"] = "0";
	
	$.ajax({url:"searchWordJson_info", type:"post",async: false,data: param, dataType:"json",
		success: function(data){
			visibleMarkers();
			//清空历史地图数据 重新赋值；
			infoMarkersTemp = {};
			var resoultCount = 0;
			var markerArray='';
			//显示标记内媒体
			for(var i = 0 ; i < data.length; i++){
				if(infoMarkers[data[i].id] != undefined){
					var flag=circle.getBounds().contains(infoMarkers[data[i].id].getPosition());	 
					if(flag == true){
						infoMarkers[data[i].id].setVisible(true);
						//保存到临时地图数据
						infoMarkersTemp[data[i].id] = infoMarkers[data[i].id];
						//传递给弹窗
						markerArray = markerArray+','+data[i].id;
						resoultCount++;
					}
				}
			}
			fanweiInfoIdArray = markerArray;
			$("#fanweiInfosCount").html(resoultCount);
			setIndexInfoCount(resoultCount);
			art.tips("查找成功。",0.5,"success.gif");
			//showInfoByIds(markerArray);	//显示弹窗
		}
	});
	},time);
}

//根据用逗号拼起来的id字符串搜索媒体，并显示列表弹窗；
function showInfoByIds(ids){
	if(ids == undefined || ids == ""){
		art.tips("范围内没有媒体信息。");
		return ;
	}
	//加载页面
	$.ajax({url:"findInfoByIds_info?path=info-search-fanwei-infos.jsp", type:"post", data: {"ids":ids}, 
		success: function(data){
			art.param({
				lock:true,
				title:"范围内的列表",
				content:data,
				left:"90%",
				button:[{
					name:"下载PPT",
					callback:function(){
						exportInfoListFanwei();
						return false;
					}
				},{
					name:"加入方案",
					callback:function(){
						addToScheme_fanwei_infos();
						return false;
					}
				}],
				ok:true,
				okVal:"关闭"
			});
			
		}
	});  
}


//移除视野内搜索标注
function removeViewSearchMarker() {
	ShowMarkers();
	circle.setMap(null);
	ViewSearchMarker.setMap(null);
	ViewSearchMarker = null;
}


//修改视野搜索直径
function changeViewSearchradius(radius) { 
	if (typeof (ViewSearchMarker) == 'undefined' || ViewSearchMarker == null) {
		ViewSearchStart();
	}
	circle.setRadius(radius * 1000);
	ViewSearchradiusMarkers();
}



</script>