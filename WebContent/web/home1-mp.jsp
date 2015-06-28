<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 地图加载容器 -->
 <div id="googleMap" style="width: 100%; min-height: 800px;"></div> 
<script>

$(document).ready(function(){
	//初始化地图
	init();
	
	//延迟1秒加载marker
	timeInitInfoMarker(0);
	
});

/**
 * 延迟加载媒体Marker
 */
function timeInitInfoMarker(time){
	
	setTimeout(function(){
		art.tips("地图加载完成，媒体加载中...<i id=\"map_info_count_show\"></i>",5,"loading.gif");
		var count = getMarkerCount();			//获取总数
		setIndexInfoCount(count);				//处理数量
		var size = 1000;									//每个线程处理的数量
		var index = parseInt(count/size)+1;  //获得要创建的线程数
		for(var i = 1 ; i <= index ;i++){
			loadMarker(i,size);							//创建线程
		}
	},time);
}

/**
 * 从后台加载媒体
 */
function loadMarker(index,size){
	var param = {};
	param["index"] = index;
	param["size"] = size;
	$.ajax({url:"getAllInfos_info", type:"post",async: true,data: param, dataType:"json",
		success: function(data){
			for(var i = 0 ; i < data.length; i++){
				infoMarkers[data[i].id] = new google.maps.Marker({
				    position: new google.maps.LatLng(data[i].indexX,data[i].indexY),
				    map: map,
				    icon: "img/mapsType/"+data[i].typeId+".png"
				});
				boundMarkerClickEvent(infoMarkers[data[i].id],data[i].id);
			}
			setTipsCountText(size);
		}
	});
}

/**
 *设置提示统计数量
 */
function setTipsCountText(size){
	markerLoadCount +=  size;
	$("#map_info_count_show").text(markerLoadCount);
	
}


function getMarkerCount(){
	var count = 0;
	$.ajax({url:"getAllInfosCount_info", type:"post",async: false,data: null, dataType:"json",
		success: function(data){
			count = data;
		}
	});
	return count;
}



/**
 * 给marker绑定点击事件
 * @param marker	标记
 * @param infoId	媒体id
 */
function boundMarkerClickEvent(marker,infoId){
	google.maps.event.addListener(marker, 'click', function(event){
		
		$.ajax({url:"find_info?path=info-mp-content.jsp", type:"post", data: {"data.id":infoId}, 
			success: function(data){
				art.param({
					left:"70%",
					title:"媒体详细信息",
					content:data,
					lock:false,
					button:[{
						name:"街景",
						callback:function(){
							showInfoJiejing(infoId);
							return false;
						}
					},{
						name:"加入方案",
						callback:function(){
							addInfosToUserScheme("&infoId="+infoId)
							return false;
						}
					},{
						name:"下载PPT",
						callback:function(){
							window.location.href="/web/toExportScheme_infoScheme?dataVO.id="+infoId;
							return false;
						}
					}],
					ok:true,
					okVal:"关闭",
					init:function(){
						showInfoWindow(infoId);
					}
				});
			}
		});
	});
}

/**
 * 显示媒体街景信息
 */
function showInfoJiejing(infoId){
	$.ajax({url:"/web/findInfo_info", type:"post", data: {"data.id":infoId}, dataType:"json",
		success: function(infoData){
			if(infoData.url != null && "" != infoData.url){
				art.param({
					width:700,
					height:500,
					title:"街景信息",
				    content: "url:"+infoData.url,
				    ok: true,
				    okVal:"关闭"
				}).max();
			}else{
				art.tips("该媒体没有街景信息",2,"tips.gif");
			}
		}
	});
}


/**
 * 在地图上某媒体的信息（地图外部调用）
 */
function showInfoWindow(infoId){
	showTab(1);
	var marker = infoMarkers[infoId];
	$.ajax({url:"findInfo_info", type:"post", data: {"data.id":infoId}, dataType:"json",
		success: function(data){
			var infoWindow= new google.maps.InfoWindow({});
			infoWindow.setContent("<div style=\"width:100%;\">"+data.easy+"</div>");
			infoWindow.open(map,marker);
			//保存至临时弹窗集合。
			infoContents[data.id] = infoWindow;
			map.setCenter(marker.getPosition());
		}
	});
}


 
 

//隐藏全部标注
function visibleMarkers(){
	for(marker in infoMarkers){
		infoMarkers[marker].setVisible(false);
	}
	setIndexInfoCount(0);
}

//显示全部标注
function ShowMarkers(){
	for(marker in infoMarkers){
		infoMarkers[marker].setVisible(true);
	}
	setIndexInfoCount(Object.keys(infoMarkers).length);
}

/**
 * 测距
 */
function Ranging(){
	getDistance();
}



//批量添加info到客户自己的方案
function addInfosToUserScheme(infoIds){
	if(infoIds == ""){
		art.tips("请选择至少一个媒体");
		return ;
	}
	$.ajax({url:"listJson_userScheme", type:"post", data: null, dataType:"json",
		success: function(data){
			art.param({
					title:"我的方案",
					content:createUserSchemeListDiv(infoIds,data),
					ok:function(){
						addInfosToNewUserScheme(infoIds);
						return false;
					},
					okVal:"添加至新方案",
					cancel:true
			});
		}
	});
}


/**
 * 创建用户方案列表div
 */
function createUserSchemeListDiv(infoIds,data){
	var div = "<div><table>";
	
	var spanTemp = "<tr><td><span>方案名：临时方案</span></td>"
					+"<td><button class=\"btn blue\" onclick=\"addInfosToOldUserScheme('"+infoIds+"','临时方案');\">加入此方案</button></td>"
					+"</tr>";
	div = div + spanTemp;

	for(var i=0; i<data.length;i++){
		var span = "<tr height='50'><td><span>方案名："+data[i].schemeName+"</span></td>"
						+"<td><button class=\"btn green\" onclick=\"addInfosToOldUserScheme('"+infoIds+"','"+data[i].schemeName+"');\">加入此方案</button></td>"
						+"</tr>";
		div = div + span;
	}
	
	div = div + "<table></div>";
	return div;
}


//将媒体添加至已经建立的方案
function addInfosToOldUserScheme(infoIds,name){
	$.ajax({
		url : "newScheme_userScheme?checkDefult=0"+infoIds,
		type : "post",
		data : {
			"userScheme.schemeName":name
		},
		success : function(data) {
			if (JSON.parse(data).success) {
				art.tips("添加成功",1,"success.gif");
			} else {
				art.tips("添加失败");
			}
		}
	});
}

//将媒体添加到新建方案
function addInfosToNewUserScheme(infoIds){
	art.param({
		title:"新建方案",
		content:"<h4>方案名字：</h4><input type=\"text\" id=\"new_user_scheme_name\">",
		ok:function(){
			var schemeName = $("#new_user_scheme_name").val();
			if(schemeName == ""){
				art.tips("请输入方案名称");
				return false;
			}
			
			$.ajax({
				url : "newScheme_userScheme?checkDefult=0"+infoIds,
				type : "post",
				data : {
					"userScheme.schemeName":schemeName
				},
				success : function(data) {
					if (JSON.parse(data).success) {
						art.tips("添加成功",1,"success.gif");
					} else {
						art.tips("添加失败");
					}
				}
			});
			
		},
		okVal:"确定",
		cancel:true
	});
}



/**
 * 关闭所有已经打开的window;
 */
function closeInfoWindow(){
	 for(infoWindow in infoContents){
	 		infoContents[infoWindow].close();
	}
}
 
/**
 * 打开所有已经打开过的window;
 */
function openInfoWindow(obj){
	 if(obj.checked){
		 for(infoWindow in infoContents){
		 		infoContents[infoWindow].open(map,infoMarkers[infoWindow]);
		}
	 }else{
		 for(infoWindow in infoContents){
		 		infoContents[infoWindow].close();
		}
	 }
}
 
/**
 * 显示上一个地图（目前仅支持方案和详细列表 不支持搜索。）
 */
function showOldIndexMap(obj){

	if(obj.checked){
		ShowMarkers();
	}else{
		visibleMarkers();
		for(marker in infoMarkersTemp){
			infoMarkersTemp[marker].setVisible(true);
		}
		setIndexInfoCount(Object.keys(infoMarkersTemp).length);
	}

}
 
/**
 * 范围内刷新
 */
function reloadInFanWei(){
	visibleMarkers();
	var bs = map.getBounds(); // 获取可视区域
	var bssw = bs.getSouthWest(); // 可视区域左下角
	var bsne = bs.getNorthEast(); // 可视区域右上角

	var action = "webIndexMapJson_info";
	var param = {
		index : 1,
		size : 0,
		"query.westX" : bssw.k,
		"query.westY" : bssw.D,
		"query.eastX" : bsne.k,
		"query.eastY" : bsne.D
	};
	
	$.ajax({url:action, type:"post",async: false,data: param, dataType:"json",
		success: function(data){
			for(var i = 0 ; i < data.length; i++){
				infoMarkers[data[i].id] = new google.maps.Marker({
				    position: new google.maps.LatLng(data[i].indexX,data[i].indexY),
				    map: map,
				    icon: "img/mapsType/"+data[i].typeId+".png",
				    title:data[i].address
				});
				
				boundMarkerClickEvent(infoMarkers[data[i].id],data[i].id);
			}
		}
	});
	
}


//上传自定义媒体
function MyUpload(){
	showTab(1);
	console.log(clickHandler);
	if(clickHandler != undefined){
		return;
	}
	$.ajax({url:"my-info.jsp", type:"post", data: null, 
		success: function(data){
			art.param({
				title:"添加媒体（关闭此窗口退出添加。）",
				content:data,
				lock:false,
				left:"10%",
				esc:false,
				ok:function(){
					return myInfoUpload();
				},
				cancel:function(){
					return cancelInfoUpload();
				}
			});
		}
	});
}//mp上传自定义媒体
function MyUploadmp(){
	showTab(1);
	console.log(clickHandler);
	if(clickHandler != undefined){
		return;
	}
	$.ajax({url:"my-mp-info.jsp", type:"post", data: null, 
		success: function(data){
			art.param({
				title:"添加媒体（关闭此窗口退出添加。）",
				content:data,
				lock:false,
				left:"10%",
				esc:false,
				ok:function(){
					return myInfoUploadmp();
				},
				cancel:function(){
					return cancelInfoUploadmp();
				}
			});
		}
	});
}

function showChangeDialog(id){
	$.ajax({url:"find_info?path=info-change.jsp", type:"post", data: {"data.id":id}, 
		success: function(data){
			art.param({
				title:"媒体更改",
				content:data,
				esc:false,
				ok:function(){
					return infoChanged();
				},
				cancel:true
			});
		}
	});
}
</script>