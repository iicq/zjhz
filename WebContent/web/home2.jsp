<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 媒体列表 -->
<div class="portlet box">
	<div class="portlet-body flip-scroll">
		<div class="btn-group" data-toggle="buttons-radio">
			<button type="button" class="btn blue " style="background-color: #11A49C;color: white;"   onclick="$('#check-all-home2').click();">
				<i class="icon-ok"></i> 全选 
			</button>
			<button type="button" class="btn blue " style="background-color: #11A49C;color: white;" onclick="check_home2_fanxuan();">
				<i class="icon-ok"></i> 反选
			</button>
			<!-- <button type="button" class="btn blue" style="background-color: #11A49C;color: white;" onclick="exportInfoListHome2();">
				<i class="icon-download"></i> 批量下载PPT
			</button> -->
		</div>
		<div class="btn-group">
			<!-- <button type="button" class="btn " style="background-color: #00B3D3;color: white;" onclick="initMap_home2();"> 重置地图</button>
			 --><button type="button" class="btn green" style="background-color: #00B3D3" onclick="returnIndexMap_home2();">
				在首页地图显示
			</button>
		</div>
		<div class="btn-group">
			<a class="btn green dropdown-toggle" style="background-color: #00B3D3" data-toggle="dropdown" href="#" >
				保存到方案 <i class="icon-angle-down"></i>
			</a>
			<ul class="dropdown-menu">
				<s:iterator value="UserSchemeList" id="Scheme">
					<li><a href="#" class="btn" onclick="saveSchemeHome2('${Scheme.schemeName}');">${Scheme.schemeName}</a></li>
				</s:iterator>
				<li><a href="#newscheme" role="button" class="btn" data-toggle="modal">新建...</a></li>
			</ul>
		</div>
		总计媒体数量：${total}
		<div class="row-fluid">
			<div class="span6" style="max-height: 700px;overflow: auto;">
				<table class="table table-bordered  table-condensed flip-content table-hover">
					<thead class="flip-content" style="display: none;">
						<tr >
							<th>
									<input type="checkbox" class="group-checkable1" id="check-all-home2" onclick="selectAll_home2_list1(this);">
							</th>
							<th width="86%"></th>
							<th></th>
						</tr>
					</thead>

					<tbody>
						<s:iterator value="list" status="index" >
							<tr>
								<td>
									<div id="hidden_home2_${id}"  > </div>
									<input type="checkbox" value="${id}" onchange="showMarker_home2(this);"  class="infos-home2 group-checkable1" name="infoId">
									<input type="hidden" id="indexX_home2_${id}" value="${indexX}"> 
									<input type="hidden" id="indexY_home2_${id}" value="${indexY}"> 
									<input type="hidden" id="typeId_home2_${id}" value="${typeId}"> 
									<input type="hidden" id="number_home2_${id}" value="${number}"> 
									
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
											<div id="show-infoImgs-home2-${id}" class="carousel slide">
												 <ol class="carousel-indicators">
												 	 <s:iterator value="imgs" status="stu" >
												 		<s:if test="#stu.index==0">
												 			 <li data-target="#show-infoImgs-home2-${id}" data-slide-to="<s:property value='#stu.index'/>" class="active"></li>
												 		</s:if>
												 		<s:else>
												 		 	<li data-target="#show-infoImgs-home2-${id}" data-slide-to="<s:property value='#stu.index'/>" ></li>
												 		</s:else>
												 	</s:iterator>
												 </ol>
												 <!-- Carousel items -->
												 <div class="carousel-inner" onclick="showImg_home2('${id}');">
												  <s:iterator value="imgs" status="stu" >
												    <s:if test="#stu.index==0">
												 		<div class="active item">
												    		<img class="info-img-home2" src="${url}" alt="媒体图片" style="width: 238px;height: 110px;"/>
												   	 	</div>
												 	</s:if>
												 	<s:else>
												 		<div class="item">
												    		<img class="info-img-home2"  src="${url}" alt="媒体图片" style="width: 238px;height: 110px;" />
												   	 	</div>
												 	</s:else>
												  </s:iterator>
												 </div>
												 <!-- Carousel nav -->
												  <a class="carousel-control left" href="#show-infoImgs-home2-${id}" data-slide="prev">&lsaquo;</a>
												  <a class="carousel-control right" href="#show-infoImgs-home2-${id}" data-slide="next">&rsaquo;</a>
												</div>
										</div>
									</div>
								</td>
								<td>
									<%-- <a class="btn" href="${url}" target="view_window">
										<img alt="街景地图" src="img/ico/streetviewico.png" />
									</a>   --%>
									<a class="btn green"  style="background-color: #11A49C;" href="/web/toExportScheme_infoScheme?dataVO.id=${id}">下载</a>
									<br><br>
									<a class="btn red"  style="background-color: #00B3D3;" href="javascript:void();" onclick="$(this).parent().parent().remove();">移除</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			
			<div class="span6" >
				 <div id="googleMap_home2" style="width: 100%; min-height: 700px;"></div> 
			</div>
		</div>
		
	</div>
</div>
<div id="paginator_home2"></div>

<div id="newscheme" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="schemeLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="schemeLabel">新添加方案</h3>
  </div>
  <div class="modal-body">
    <p><h4 >方案名：</h4><input type="text" data-provide="typeahead" id="newschemename"></p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true" id="newschemeclose">关闭</button>
    <button class="btn btn-primary" onclick="newSchemeHome2();">保存</button>
  </div>
</div>

<script>
$(document).ready(function(){
	//分页导入搜索条件	
	if(pageParamHome2["action"] != undefined){
		var actionUrl = "";
		if(pageParamHome2["action"].indexOf("checkDefult") < 0){
			actionUrl = pageParamHome2["action"] + "?checkDefult=0";
		}else{
			actionUrl = pageParamHome2["action"];
		}
		pageParamHome2["action"] = undefined;
		pageParamHome2["path"] = undefined;
		pageParamHome2["size"] = undefined;
		pageParamHome2["index"] = undefined;
		
		for(name in pageParamHome2){
			if(pageParamHome2[name] != undefined){
				actionUrl = actionUrl + "&" + name+"=" + pageParamHome2[name];
				pageParamHome2[name] = undefined;
			}
		}
	 	$('#paginator_home2').bootstrapPaginator(
	 			getPaginatorOptionsHome2(
	 					actionUrl,
						"${index}","${total}","${size}"
				)
		); 
	}

 	initMap_home2();
 	
});


function initMap_home2(){
	var mapOptions = {
		center : new google.maps.LatLng(40.0507451947963, 116.40426635742188),
		zoom : 6,
		scaleControl : true
	};
	map_home2 = new google.maps.Map(document.getElementById("googleMap_home2"), mapOptions);
	
	load_marker_home2();
}

//加载marker到地图上
function load_marker_home2(){
	//重新初始化
	markers_home2 = {};
	$(".infos-home2").each(function(){
		var infoId = this.value;
		var indexX = $("#indexX_home2_"+infoId).val();
		var indexY = $("#indexY_home2_"+infoId).val();
		var typeId = $("#typeId_home2_"+infoId).val();
		var number = $("#number_home2_"+infoId).val();
		if(markers_home2[infoId]  == undefined){
			
			markers_home2[infoId] = new google.maps.Marker({
			    position: new google.maps.LatLng(indexX,indexY),
			   /*  map: map_home2, */
			    icon: "img/mapsType/"+typeId+".png",
			    title:number
			});
			
			boundListMarkerClickEvent(infoId);
		}else{
			markers_home2[infoId].setMap(map_home2);
		}
	});
	$('#check-all-home2').click();
}

/**
 * 绑定方案列表媒体标记点击事件
 */
function boundListMarkerClickEvent(infoId){
	google.maps.event.addListener(markers_home2[infoId], 'click', function(event){
		$("#hidden_home2_"+infoId).parent().parent().toggleClass("bgcolor_gray");
		window.location.hash="#hidden_home2_"+infoId;
	});

}

/**
 * 显示/隐藏标签
 */
function showMarker_home2(obj){
	var checked = $(obj).is(":checked");
	var infoId = $(obj).val();
	if(checked){
		markers_home2[infoId].setMap(map_home2);
		map_home2.setCenter(markers_home2[infoId].getPosition());
	}else{
		markers_home2[infoId].setMap(null);
	}
}


//全选、全不选
function selectAll_home2_list1(obj){
	var isSelectInfo = $(obj).is(":checked");
	$(".infos-home2").prop("checked",isSelectInfo);
	if(isSelectInfo){
		for(marker in markers_home2){
			markers_home2[marker].setMap(map_home2);
		}
	}else{
		for(marker in markers_home2){
			markers_home2[marker].setMap(null);
		}
	}
}

//反选
function check_home2_fanxuan(){
	$(".infos-home2").each(function(){
		   $(this).attr("checked",!this.checked);              
	});
	//$('#check-all-home2').click();
}

//批量下载PPT
function exportInfoListHome2() {
	
	var temoCount = 0;
	var str='/web/toExportSchemeList_infoScheme?checkDefult=0';
	$(".infos-home2").each(function(){
		   if(this.checked){
			   temoCount++;
				str += "&infoid="+this.value;
			}
	});
	temoCount > 0 ? window.location.href=str : art.tips("请至少选择一个媒体！");

}


//保存到方案
function saveSchemeHome2(name){
	var str;
	var tempCount = 0;
	$(".infos-home2").each(function(){
		   if(this.checked){
			   tempCount++
				str += "&infoId="+this.value;
			}
	});
	if(tempCount > 0){
		$.ajax({
			url : "save_userScheme?checkDefult=0"+str,
			type : "post",
			data : {
				"userScheme.schemeName":name
			},
			success : function(data) {
				if (JSON.parse(data).success) {
					art.tips('保存成功');
					initHome4(name);
				} else {
					art.tips('媒体已存在');
				}
			}
		});
	}else{
		art.tips("请至少选择一个媒体");
	}
}

//保存到新建方案
function newSchemeHome2(){
	var name =$("#newschemename").val();
	var str;
	var tempCount = 0;
	$(".infos-home2").each(function(){
		   if(this.checked){
			   tempCount++
				str += "&infoId="+this.value;
			}
	});
	if(tempCount > 0){
		$.ajax({
			url : "newScheme_userScheme?checkDefult=0"+str,
			type : "post",
			data : {
				"userScheme.schemeName":name
			},
			success : function(data) {
				if (JSON.parse(data).success) {
					$("#newschemeclose").click();
					art.tips('保存成功');
					initHome4(name);
				} else {
					$("#newschemeclose").click();
					art.tips('方案已存在或未选择媒体');
				}
			}
		});
	}else{
		art.tips("请至少选择一个媒体");
	}
}

/**
 * 返回选中媒体到首页地图
 */
function returnIndexMap_home2(){
	infoMarkersTemp = {};
	visibleMarkers();
	showTab(1);
	$(".infos-home2").each(function(){
		   if(this.checked){
			   infoMarkers[this.value].setVisible(true);
			   infoMarkersTemp[this.value] = infoMarkers[this.value];
			}
	});
}

/**
 * 弹窗显示图片
 */
function showImg_home2(id){
	var data = $("<div>").load("find_info?path=/oa/show-infoImgs.jsp&data.id="+id);
	art.tip(data,null,"图片查看");
}

</script>