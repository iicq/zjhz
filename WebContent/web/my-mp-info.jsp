<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div style="width: 350px; max-height: 500px;overflow: scroll;" >
	<table>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">图片：</label>
			</td>
			<td>
				<div class="fileupload fileupload-new" data-provides="fileupload" style="min-width: 210px;">
					<input type="hidden" value="" name="">
					<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
						<img src="/image/information/bg_select_img.png" alt="">
					</div>
					<div class="fileupload-preview fileupload-exists thumbnail" 
												style="max-width: 200px; max-height: 150px; line-height: 20px;">
					</div>
					<div>
					<span class="btn btn-file">
						<span class="fileupload-new">选择</span>
						<span class="fileupload-exists">更改</span>
						<input type="file" class="default" id="web_info_file" name="file" >
					</span>
					<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">移除</a>
					<a href="#" class="btn" onclick="web_exifImgmp();">定位</a>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<table >
		<tr>
			<td>
				<label style="color: blue;font-size: 10px;float: right;" onclick="$(this).parent().parent().next().slideToggle(100);"> 展开&nbsp&nbsp收起</label>
			</td>
		</tr>
		<tr><td>
			<table id = "param_web_info" style="width: 100%;">
				
		
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">参考位置：</label>
			</td>
			<td width="100">
				<label  id="my-info-add-address" style="width: 200px;">请点击地图放置定位标签<img alt="" src="/image/marker.png" style="width: 15px;height: 15px;"></label>
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">位置及桩号：</label>
			</td>
			<td width="100">
				<textarea style="width: 200px;" name="data.intro" ></textarea>
				<input type="hidden" name="data.indexX" value="" id="index_x">
				<input type="hidden" name="data.indexY" value="" id="index_y">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">媒体类型：</label>
			</td>
			<td width="100">
				<select  id="select_type_web_info" name="data.typeId" style="width: 214px;">
					<option value="SF">三翻</option>
					<option value="WD">围挡</option>
					<option value="DX">灯箱</option>
					<option value="KQ">跨桥</option>
					<option value="LD">楼顶</option>
					<option value="ZSP">指示牌</option>
					<option value="LED">电子屏</option>
					<option value="SFZ">收费站</option>
					<option value="SM">三面立柱</option>
					<option value="LM" selected="selected">两面立柱</option>
					<option value="LMD">两面立柱+可对牌</option>
					<option value="SMD">三面立柱+可对牌</option>
					<option value="QT">其他</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">信息提供人：</label>
			</td>
			<td width="100">
				<input type="text" name="data.serverName" style="width: 200px;" value="">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">公司：</label>
			</td>
			<td width="100">
				<input type="text" name="data.serverCompany" style="width: 200px;" value="">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">电话：</label>
			</td>
			<td width="100">
				<input type="text" name="data.serverPhone" style="width: 200px;" value="">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">QQ：</label>
			</td>
			<td width="100">
				<input type="text" name="data.qq" style="width: 200px;" value="">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">媒体规格：</label>
			</td>
			<td width="100">
				宽：<input type="text" style="width: 30px;" onchange="getSum_infoEdit(this);" name="data.width" value="18.0" placeholder="0.0米">
				高：<input type="text" style="width: 30px;" onchange="getSum_infoEdit(this);" name="data.height" value="6.0" placeholder="0.0米">
				面：<input type="text" style="width: 30px;"  onchange="getSum_infoEdit(this);" name="data.face" value="2" placeholder="0.0米">
				<br>
				面积：<input type="text" style="width: 162px;" class="span2" onfocus="getSum_infoEdit(this);" name="data.area" value="216.0" placeholder="根据规格自动计算">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">同行代理价：</label>
			</td>
			<td width="100">
				<input type="hidden" name="data.proxy6" value="0.0">
				<input type="hidden" name="data.actual" value="0.0">
				<input type="hidden" name="data.pactProxy" value="0.0">
				<input type="text" name="data.proxy12" style="width: 150px;margin-bottom: 5px;" value="0.0">(万/年)
				<br>
				<label style="float: left;margin-left: 10px;margin-bottom: 5px;"><input checked style="vertical-align: -2px;" name="data.proxyInclude" type="radio" value="全含">全含</label>
				<label style="float: left;margin-left: 10px;margin-bottom: 5px;"><input style="vertical-align: -2px;" name="data.proxyInclude" type="radio" value="裸价">裸价</label>
				<label style="float: left;margin-left: 10px;margin-bottom: 5px;"><input style="vertical-align: -2px;" name="data.proxyInclude" type="radio" value="其他">其他</label>
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">客户发布价：</label>
			</td>
			<td width="100">
				<input type="hidden" name="data.pricePhone" value="0.0">
				<input type="hidden" name="data.rete" value="0.0">
				<input type="hidden" name="data.factPublish" value="0.0">
				<input type="hidden" name="data.publish6" value="0.0">
				<input type="text" name="data.publish12" style="width: 150px;margin-bottom: 5px;" value="0.0">(万/年)
				<br>
				<label style="float: left;margin-left: 10px;margin-bottom: 5px;"><input checked style="vertical-align: -2px;" name="data.publicInclude" type="radio" value="全含">全含</label>
				<label style="float: left;margin-left: 10px;margin-bottom: 5px;"><input style="vertical-align: -2px;" name="data.publicInclude" type="radio" value="裸价">裸价</label>
				<label style="float: left;margin-left: 10px;margin-bottom: 5px;"><input style="vertical-align: -2px;" name="data.publicInclude" type="radio" value="其他">其他</label>
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">档期：</label>
			</td>
			<td width="100">
				<div class="input-append">
					<input type="text"  class="info_dangqi_add" name="data.dangqi" value="" style="width: 145px;" >
					<span class="add-on" style="padding-bottom: 2px;padding-top: 2px;" onclick="$(this).parent().find('input[type=text]').val('')"><i class="icon-remove"></i></span>
					<span class="add-on" style="padding-bottom: 2px;padding-top: 2px;" onclick="$(this).parent().find('input[type=text]').focus()"><i class="icon-calendar"></i></span>
				</div>
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">腾讯街景连接：</label>
			</td>
			<td width="100">
				<input type="text" name="data.url" value="" style="width: 200px;">
			</td>
		</tr>
			</table>
			</td>
		</tr>
	</table>
</div>

<script>
$(document).ready(function(){

	clickHandler = google.maps.event.addListener(map, "click", function(event) {
		google.maps.event.removeListener(clickHandler);
		addMyInfoMarker(event.latLng);			//添加新标记
		myInfoDragend(event.latLng);				//获取新标记位置
		myInfoPosition(myInfoMarker);			//初始化位置信息
	});
	 $(".info_dangqi_add").datepicker();
});


function addMyInfoMarker(location) { 		// 添加新标记
	if(myInfoMarker != undefined){
		return;
	}
	
	var myOptions = { // 标记选项
		position : location,
		draggable : true,
		map : map,
		icon : "/image/marker.png"
	};
	
	myInfoMarker = new google.maps.Marker(myOptions);
	
	dragendHandler = google.maps.event.addListener(myInfoMarker, 'dragend', // 拖动结束事件
		function(event) {
		myInfoDragend(event.latLng);
	});
	
	dragHandler = google.maps.event.addListener(myInfoMarker, 'drag', function() {//拖动坐标
		myInfoPosition(myInfoMarker);
	});
}

//拖动的时候获取坐标
function myInfoPosition(marker){
	  $("#index_x").val(marker.getPosition().lat());
	  $("#index_y").val(marker.getPosition().lng());
}

//我的媒体位置拖动事件
function myInfoDragend(latLng){
	new google.maps.Geocoder().geocode({location:latLng}, function geoResults(results, status){
		if (status == google.maps.GeocoderStatus.OK) {
			  $("#my-info-add-address").text(results[0].formatted_address);
		  }else{
			  $("#my-info-add-address").text("未知位置");
		  }
	});
}


/**
 * 上传info
 */
function myInfoUploadmp(){
	var param = web.formParams("param_web_info");
	
	param["data.number"] = createFileNameByFileId();
	param["data.address"] = $("#my-info-add-address").text() + param["data.intro"];
	param["data.easy"] = "";
	param["data.status"] = "0";
	param["data.webStatus"] = "0";
	param["data.light"] = "0";
	param["data.showStatus"] = "0";
	param["data.business"] = "0";
	param["data.wayId"] = "SAAgood";
	param["data.region"] = "";
	param["data.directionId"] = "M";
	param["data.powerType"] = "A1";

	if(param["data.dangqi"] != ""){
		try{
			param["data.dangqi"] = new Date(param["data.dangqi"]).getTime();
		}catch (e) {
			art.tips("档期格式不正确！",2,"error.gif");
			return false;
		}
	}
	
	if(param["data.indexX"]=="" || param["data.indexY"]=="" ){
		art.tips("请点击地图放置媒体位置标记。",2,"tips.gif");
		return false;
	}
	
	if(param["data.serverName"]=="" || param["data.serverPhone"]=="" || param["data.serverCompany"]==""){
		art.tips("请输入提供人、电话、公司！",2,"tips.gif");
		return false;
	}

	
	param["simg.date"] = "";
	param["simg.clientTypeId"] = "";
	param["simg.content"] = "";
	param["simg.status"] = "1";
	param["simg.defaultImage"] = "1";
	
	art.tips("上传中。。。",30,"loading.gif");

	 $.ajaxFileUpload({
         url:'webSave_info',            			 		 	//需要链接到服务器地址
         data:param,											 	//参数
         fileElementId:"web_info_file",        		 	//文件选择框的id属性
         dataType: 'json',                                    	//服务器返回的格式，可以是json
         success: function (data, status){
        	 art.tips("上传成功",1,"success.gif");
        	 cancelInfoUploadmp();
         },
         error: function (data, status, e){
        	 cancelInfoUploadmp();
         	console.log("ajax_error : "+fileId);
         }
     });
}

/**
 * 创建fileName
 */
function createFileNameByFileId(){
	var fileName;
	try{
		var file = $("#web_info_file");
		var array = file.val().split("\\");
		fileName = array[array.length - 1].split(".")[0].replaceAll("-","_");
		var nowDate = new Date();
		fileName = fileName + nowDate.getFullYear()+(nowDate.getMonth() +1)+nowDate.getDate()+nowDate.getHours()+nowDate.getMinutes()+nowDate.getSeconds();
		fileName = fileName + "${session.account.username}";
	}catch (e) {
		console.log("文件路径解析失败");
		fileName = new Date().getTime();
	}
	return fileName;
}

/**
 * 获取文件坐标信息
 */
function web_exifImgmp(){
	art.tips("获取中。。。",2,"loading.gif");
	$.ajaxFileUpload({
		url : '/oa/exifImg_info',
        secureuri:false,										 //是否启用安全提交，默认为false
        fileElementId: "web_info_file",        					 	 //文件选择框的id属性
        dataType: 'json',                                    	//服务器返回的格式，可以是json
		success : function(data, status) {
			console.log(1);
			if(data.success){
				var coordinate = data.data.replace(" ", "");
				var arr = coordinate.split(",");
				cancelInfoUploadmp();
				var markerLatLng = new google.maps.LatLng(arr[0],arr[1]*1+0.0044831958009);
				addMyInfoMarker(markerLatLng)
				map.setCenter(markerLatLng);
				myInfoDragend(markerLatLng);
				myInfoPosition(myInfoMarker);
				
				art.tips("解析成功！",1,"success.gif");
			}else{
				var _case = {1:"请选择图片",2:"读取GPS数据失败，或者图片没有GPS信息！"};
				web.errorTip(_case,data.code);
			}
		} ,
		error : function(data, status, e) {
			art.tips("请刷新页面重试！",1,"error.gif");
		}
	});
}

//自动计算面积
function getSum_infoEdit(obj){
	var width = $(obj).parent().find("input[name='data.width']").eq(0).val();
	var height = $(obj).parent().find("input[name='data.height']").eq(0).val();
	var face = $(obj).parent().find("input[name='data.face']").eq(0).val();
	var area = $(obj).parent().find("input[name='data.area']").eq(0);
	try {
		var a = parseFloat(width).toFixed(2);
		var b = parseFloat(height).toFixed(2);
		var c = parseFloat(face).toFixed(2);
		var d = parseFloat(a*b*c).toFixed(2);
		area.val(d);
	} catch (e) {}
}

function cancelInfoUploadmp(){
	try {
		google.maps.event.removeListener(clickHandler);
		google.maps.event.removeListener(dragendHandler);
		google.maps.event.removeListener(dragHandler);
		clickHandler = undefined;
		dragendHandler = undefined;
		dragHandler = undefined;
		myInfoMarker.setMap(null);
		myInfoMarker = undefined;
	} catch (e) {
		
	}

}
</script>