var map; 												// 地图对象
var infoMarkers = {};							//存放markers infoId和marker对象（所有）
var tempInfoMarkers = {}; 				//存放markers infoId和marker对象(临时)
var ViewSearchMarker; 						// 视野搜索中心点marker
var fanweiInfoIdArray; 					//范围内infoIdArray;
var range = 10; 									// 距离半径
var infoContents = {};							//主页打开过的媒体详细信息；
var infoMarkersTemp = {}; 					//上一次打开的历史地图
var myInfoMarker;								//创建自定义可拖动marker 上传媒体
var markerLoadCount = 0;					//媒体加载数量 用于显示加载进度


var directionsService = new google.maps.DirectionsService();
var directionDisplay;
var path = null, timer = 0, index = 0, marker = null;

var clickHandler;
var dblclickHandler;
var dragendHandler;
var dragHandler;


var polylinesArray = [];
var lenArray = []; 			// 距离标记数组


//home2 相关信息
var map_home2;					//
var markers_home2 = {};		//

//home4 相关信息
var map_home4;					//
var markers_home4 = {};		//




function init() { // 初始化
	//directionsDisplay = new google.maps.DirectionsRenderer();
	var mapOptions = {
		center : new google.maps.LatLng(40.0507451947963, 116.40426635742188),
		zoom : 6,
		scaleControl : true
	};
	
	map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);

	google.maps.event.addListener(map, 'dragend', conditionShowInfo);
	google.maps.event.addListener(map, 'zoom_changed', conditionShowInfo);

}

function conditionShowInfo() { // 计算当前显示区域坐标

	var bs = map.getBounds(); // 获取可视区域
	var bssw = bs.getSouthWest(); // 可视区域左下角
	var bsne = bs.getNorthEast(); // 可视区域右上角

	var action = "webIndexMap_info";
	var param = {
		path : "pro1.jsp",
		index : "1",
		size : "5",
		"query.westX" : bssw.k,
		"query.westY" : bssw.D,
		"query.eastX" : bsne.k,
		"query.eastY" : bsne.D
	};
	
	web.loadPro1(action, param);
}

function CreateMarker(lat, lng, MyGoToCommunityZoom) { // 创建标记
	var singapoerCenter = new google.maps.LatLng(lat, lng);
	var myOptions = {
		zoom : MyGoToCommunityZoom,
		center : singapoerCenter,
		navigationControl : true,
		scaleControl : true,
		streetViewControl : true,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	map.setOptions(myOptions);
}

function getDistance() { // 距离
	$('#Span1').show();
	clickHandler = google.maps.event.addListener(map, "click", function(event) {
		addMarker(event.latLng);
	});
}

function addMarker(location) { // 添加新标记
	if (lenArray.length == 0) {
		var icon = "img/map/dd-start.png";
	} else {
		if (lenArray.length >= 2) {
			marker.setMap(null);
		}
		var icon = "img/map/mm_red.png";
	}

	var myOptions = { // 标记选项
		position : location,
		draggable : true,
		map : map,
		icon : icon
	};
	marker = new google.maps.Marker(myOptions);

	dblclickHandler = google.maps.event.addListener(marker, 'dblclick', // 双击
	function() { // 放入marker
		lenArray.push(marker);
		drawOverlay();
	});

	dragendHandler = google.maps.event.addListener(marker, 'dragend', // 拖动结束事件
	function() {
		lenArray.push(marker);
		drawOverlay();
	});
	lenArray.push(marker);
	drawOverlay();
}

function drawOverlay() { // 画出路径覆盖层

	var flightPlanCoordinates = []; // 路线数组

	if (lenArray) { // 将坐标压入路线数组
		for (i in lenArray) {
			flightPlanCoordinates.push(lenArray[i].getPosition());
		}
	}

	var myOptions = { // 路径选项
		path : flightPlanCoordinates,
		map : map,
		strokeColor : "#FF0000",
		strokeOpacity : 1.0,
		strokeWeight : 2
	};
	polyline = new google.maps.Polyline(myOptions);

	if (polylinesArray) { // 清除原有折线路径
		for (i in polylinesArray) {
			polylinesArray[i].setMap(null);
		}
		polylinesArray = [];
	}
	polyline.setMap(map);

	document.getElementById("sRes").innerHTML = (polyline.getLength() / 1000)
			.toFixed(3);
	polylinesArray.push(polyline);
}

google.maps.LatLng.prototype.distanceFrom = function(latlng) { //距离算法
	var lat = [ this.lat(), latlng.lat() ]
	var lng = [ this.lng(), latlng.lng() ] // var R = 6371; // km (change this constant to get miles)
	var R = 6378137; // In meters
	var dLat = (lat[1] - lat[0]) * Math.PI / 180;
	var dLng = (lng[1] - lng[0]) * Math.PI / 180;
	var a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
			+ Math.cos(lat[0] * Math.PI / 180)
			* Math.cos(lat[1] * Math.PI / 180) * Math.sin(dLng / 2)
			* Math.sin(dLng / 2);
	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	var d = R * c;
	return Math.round(d);
}

google.maps.Marker.prototype.distanceFrom = function(marker) {
	return this.getPosition().distanceFrom(marker.getPosition());
}

google.maps.Polyline.prototype.getLength = function() {
	var d = 0;
	var path = this.getPath();
	var latlng;
	for ( var i = 0; i < path.getLength() - 1; i++) {
		latlng = [ path.getAt(i), path.getAt(i + 1) ];
		d += latlng[0].distanceFrom(latlng[1]);
	}
	return d;
}

function deleteOverlays() { // 删除所有叠加物
	if (lenArray) {
		for (i in lenArray) {
			lenArray[i].setMap(null);
		}
		lenArray.length = 0;
	}

	if (polylinesArray) { // 清除原有折线路径
		for (i in polylinesArray) {
			polylinesArray[i].setMap(null);
		}
		polylinesArray = [];
	}
	document.getElementById("sRes").innerHTML = "0.000";
}

function removeOverlays() { 
	try {
		google.maps.event.removeListener(clickHandler);
		google.maps.event.removeListener(dblclickHandler);
		google.maps.event.removeListener(dragendHandler);
		clickHandler = undefined;
		dblclickHandler = undefined;
		dragendHandler = undefined;
		
	} catch (e) {
		// TODO: handle exception
	}

	try {
		deleteOverlays();
	} catch (e) {
		// TODO: handle exception
	}
	

	$('#Span1').hide();
}


