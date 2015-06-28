<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 预约媒体 -->
<div class="portlet box" >
	<div class="portlet-body flip-scroll">
		<div class="btn-group" data-toggle="buttons-radio" >
			<button type="button" class="btn blue " onclick="$('#check-all-home3').click()">
				<i class="icon-ok"></i> 全选 
			</button>
			<button type="button" class="btn blue " onclick="check_home3_fanxuan();">
				<i class="icon-ok"></i> 反选
			</button>
			<button type="button" class="btn blue" onclick="exportInfoListHome3();"><i class="icon-download"></i> 批量下载PPT</button> 
		</div>

		<div class="row-fluid">
			<div class="span6">
			<table class="table table-bordered table-hover">
				<thead class="flip-content">
					<tr>
						<th>
								<input type="checkbox" class="group-checkable1" id="check-all-home3" onclick="selectAll_home3_list1(this);">
						</th>
						<th width="86%">媒体信息</th>
						<th>媒体操作</th> 
					</tr>
				</thead>
				<tbody>
						<s:iterator value="list" status="index" >
							<tr>
								<td>
									<input type="checkbox" value="${id}" onchange="showMarker_home3(this);"   class="infos-home3 group-checkable1" name="infoId">
									<input type="hidden" id="indexX_home3_${id}" value="${indexX}"> 
									<input type="hidden" id="indexY_home3_${id}" value="${indexY}"> 
									<input type="hidden" id="typeId_home3_${id}" value="${typeId}"> 
									<input type="hidden" id="number_home3_${id}" value="${number}"> 
								</td>

								<td>
									<div class="row-fluid">
										<div class="span8">
											编号：<s:property value='number' />
											<br>
											地址：<s:property value='address' />
											<br>
											类型：<s:property value='typeName' />
											<br>
											规格：<s:property value='width' />米 *
							
											<s:property value='height' />米 *
											
											<s:property value='face' />面 =
											
											<s:property value='area' />面积
											<br>
											发布价格：<s:property value='publish12' />万/年
											<br>
										</div>
										<div class="span4">
											<div id="show-infoImgs-home3-${id}"  class="carousel slide">
												 <ol class="carousel-indicators">
												 	 <s:iterator value="imgs" status="stu" >
												 		<s:if test="#stu.index==0">
												 			 <li data-target="#show-infoImgs-home3-${id}" data-slide-to="<s:property value='#stu.index'/>" class="active"></li>
												 		</s:if>
												 		<s:else>
												 		 	<li data-target="#show-infoImgs-home3-${id}" data-slide-to="<s:property value='#stu.index'/>" ></li>
												 		</s:else>
												 	</s:iterator>
												 </ol>
												 <!-- Carousel items -->
												 <div class="carousel-inner"  onclick="showImg_home3('${id}');">
												  <s:iterator value="imgs" status="stu" >
												    <s:if test="#stu.index==0">
												 			 <div class="active item">
												    		<img src="${url}" alt="媒体图片" style="width: 238px;height: 110px;"/>
												   	 	</div>
												 		</s:if>
												 		<s:else>
												 		 	<div class="item">
												    		<img src="${url}" alt="媒体图片" style="width: 238px;height: 110px;" />
												   	 	</div>
												 		</s:else>
												  </s:iterator>
												 </div>
												 <!-- Carousel nav -->
												  <a class="carousel-control left" href="#show-infoImgs-home3-${id}" data-slide="prev">&lsaquo;</a>
												  <a class="carousel-control right" href="#show-infoImgs-home3-${id}" data-slide="next">&rsaquo;</a>
												</div>
										</div>
									</div>
								</td>

								<td>
									<%-- 
									<a class="btn" href="${url}" target="view_window">
										<img alt="街景地图" src="img/ico/streetviewico.png" />
									</a>   
									--%>
									<a class="btn" href="/web/toExportScheme_infoScheme?dataVO.id=${id}">下载PPT</a>
								</td>
							</tr>
						</s:iterator>
	
					</tbody>
					</tbody>
				</table>		
			</div>
			<div class="span6">
				 <div id="googleMap_home3" style="width: 100%; min-height: 800px;"></div> 
			</div>
		</div>
		
		
	  </div>
</div>
 <div id="paginator_home3"></div>
 




<script>
$(document).ready(function(){
/* 	initMap_home3();
 	$('#paginator_home3').bootstrapPaginator(
 			getPaginatorOptionsHome3(
					"list_userInfo",
					"${index}","${total}","${size}"
					)); */
});
 

function initMap_home3(){
	var mapOptions = {
		center : new google.maps.LatLng(40.0507451947963, 116.40426635742188),
		zoom : 6,
		scaleControl : true
	};
	map_home3 = new google.maps.Map(document.getElementById("googleMap_home3"), mapOptions);
	
	load_marker_home3();
}
 

//加载marker到地图上
function load_marker_home3(){
	//重新初始化
	markers_home3 = {};
	$(".infos-home3").each(function(){
		var infoId = this.value;
		var indexX = $("#indexX_home3_"+infoId).val();
		var indexY = $("#indexY_home3_"+infoId).val();
		var typeId = $("#typeId_home3_"+infoId).val();
		var number = $("#number_home3_"+infoId).val();
		if(markers_home3[infoId]  == undefined){
			
			markers_home3[infoId] = new google.maps.Marker({
			    position: new google.maps.LatLng(indexX,indexY),
			   /*  map: map_home3, */
			    icon: "img/mapsType/"+typeId+".png",
			    title:number
			});
			map_home3.setCenter(markers_home3[infoId].getPosition());
			
		}else{
			markers_home3[infoId].setMap(map_home3);
		}
	});
	$('#check-all-home3').click();
}
 
/**
 * 显示标签
 */
function showMarker_home3(obj){
	var checked = $(obj).is(":checked");
	var infoId = $(obj).val();
	if(checked){
		markers_home3[infoId].setMap(map_home3);
		map_home3.setCenter(markers_home3[infoId].getPosition());
	}else{
		markers_home3[infoId].setMap(null);
	}
}



//全选、全不选
function selectAll_home3_list1(obj){
	var isSelectInfo = $(obj).is(":checked");
	$(".infos-home3").prop("checked",isSelectInfo);
	if(isSelectInfo){
		for(marker in markers_home3){
			markers_home3[marker].setMap(map_home3);
		}
	}else{
		for(marker in markers_home3){
			markers_home3[marker].setMap(null);
		}
	}
}

//反选
function check_home3_fanxuan(){
	$(".infos-home3").each(function(){
		   $(this).attr("checked",!this.checked);              
	});
}

//批量下载PPT
function exportInfoListHome3() {
	
	var tempCount = 0;
	var str='/web/toExportSchemeList_infoScheme?checkDefult=0';
	$(".infos-home3").each(function(){
		   if(this.checked){
			   tempCount++
				str += "&infoid="+this.value;
			}
	});
	tempCount > 0 ? window.location.href=str : web.tip("请至少选择一个媒体！");

}

/**
 * 弹窗显示图片
 */
function showImg_home3(id){
	var data = $("<div>").load("find_info?path=/oa/show-infoImgs.jsp&data.id="+id);
	art.tip(data,null,"图片查看");
}
</script>