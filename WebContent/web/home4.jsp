<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 详细信息 -->
<div class="portlet box" >
	<div class="portlet-body flip-scroll">
		<div class="btn-group" data-toggle="buttons-radio" >
			<button type="button" class="btn blue " style="background-color: #11A49C;color: white;"  onclick="$('#check-all-home4').click()">
				<i class="icon-ok"></i> 全选 
			</button>
			<button type="button" class="btn blue " style="background-color: #11A49C;color: white;"  onclick="check_home4_fanxuan();">
				<i class="icon-ok"></i> 反选
			</button>
			<!-- <button type="button" class="btn blue" style="background-color: #11A49C;color: white;"  onclick="exportInfoListHome4();">
				<i class="icon-download"></i> 批量下载PPT
			</button>  -->
		</div>
		<div class="btn-group">
			<button type="button" class="btn red" style="background-color: #11A49C;color: white;"  onclick="deleteUserSchemeHome4();">
				<i class="icon-trash"></i> 批量删除
			</button> 
		</div>

		<div class="btn-group">
			<!-- <button type="button" class="btn green" onclick="initMap_home4();"> 重置地图</button> -->
			<button type="button" class="btn green" style="background-color: #00B3D3" onclick="returnIndexMap_home4();">
				在首页地图显示
			</button>
		</div>
		<div class="btn-group">
			<a class="btn green dropdown-toggle" style="background-color: #00B3D3" data-toggle="dropdown" href="#" >
				保存到方案 <i class="icon-angle-down"></i>
			</a>
			<ul class="dropdown-menu" >
				<s:iterator value="schemeList" id="Scheme">
					<li><a  style="text-align: left;" href="#" class="btn" onclick="saveSchemeHome4('${Scheme.schemeName}');">${Scheme.schemeName}</a></li>
				</s:iterator>
				<li><a  style="text-align: left;" href="#newscheme_home4" role="button" class="btn" data-toggle="modal">新建...</a></li>
			</ul>
		</div>
		
		<div class="btn-group" >
			<a class="btn green dropdown-toggle" style="background-color: #00B3D3" data-toggle="dropdown" href="#" >
				选择方案<i class="icon-angle-down"></i>
			</a>
			<ul class="dropdown-menu">
				<li ><a  style="text-align: left;" href="#" class="btn" onclick="selectSchemeHome4('临时方案');">临时方案</a></li> 
				
				<s:iterator value="schemeList" id="Scheme"> 
					<li ><a  style="text-align: left;" href="#" class="btn" onclick="selectSchemeHome4('${Scheme.schemeName}');">${Scheme.schemeName}</a></li>
				</s:iterator> 
			</ul>
			
		</div>
		<div class="btn-group">
			<button type="button" class="btn green" style="background-color: #00B3D3" onclick="configToUserScheme();">
				<i class="icon-trash"></i> 管理方案
			</button>

		</div>
		当前方案：${userSchemeVo.schemeName == null ? "默认方案":userSchemeVo.schemeName}
		（总计：${userSchemeVOList.size() > 0 ? userSchemeVOList.size() : 0 } 条数据）
		<div class="row-fluid">
			<div class="span6" style="max-height: 700px;overflow: auto;">
				<table class="table table-bordered table-condensed flip-content table-hover">
				<thead class="flip-content" style="display: none;">
					<tr >
						<th>
								<input type="checkbox" class="group-checkable1" id="check-all-home4" onclick="selectAll_home4_list1(this);">
						</th>
						<th width="86%"></th>
						<th></th> 
					</tr>
	
				</thead>
				<tbody>
					<s:iterator value="userSchemeVOList" status="index" >
							<tr>
								<td>
									<div  id="hidden_home4_${id}" ></div>
									<input type="checkbox"  usId="${userSchemeId}" value="${id}" onchange="showMarker_home4(this);"   class="infos-home4 group-checkable1" name="infoId">
									<input type="hidden" id="indexX_home4_${id}" value="${indexX}"> 
									<input type="hidden" id="indexY_home4_${id}" value="${indexY}"> 
									<input type="hidden" id="typeId_home4_${id}" value="${typeId}"> 
									<input type="hidden" id="number_home4_${id}" value="${number}"> 
									
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
											<div id="show-infoImgs-home4-${id}" class="carousel slide">
												 <ol class="carousel-indicators">
												 	 <s:iterator value="imgs" status="stu" >
												 		<s:if test="#stu.index==0">
												 			 <li data-target="#show-infoImgs-home4-${id}" data-slide-to="<s:property value='#stu.index'/>" class="active"></li>
												 		</s:if>
												 		<s:else>
												 		 	<li data-target="#show-infoImgs-home4-${id}" data-slide-to="<s:property value='#stu.index'/>" ></li>
												 		</s:else>
												 	</s:iterator>
												 </ol>
												 <!-- Carousel items -->
												 <div class="carousel-inner" onclick="showImg_home4('${id}');">
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
												  <a class="carousel-control left" href="#show-infoImgs-home4-${id}" data-slide="prev">&lsaquo;</a>
												  <a class="carousel-control right" href="#show-infoImgs-home4-${id}" data-slide="next">&rsaquo;</a>
												</div>
										</div>
									</div>
								</td>
	
								<td>
									
									<a class="btn green" style="background-color: #11A49C" href="/web/toExportScheme_infoScheme?dataVO.id=${id}">下载</a>
									<br><br>
									<a class="btn red" href="#" style="background-color: #00B3D3" onclick="deleteSchemeJs('${userSchemeId}');">删除</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</tbody>
			</table>		
		</div>
		<div class="span6">
			 <div id="googleMap_home4" style="width: 100%; min-height: 700px;"></div> 
		</div>
		</div>
	  </div>
</div>

<div id="newscheme_home4" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="schemeLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="schemeLabel">新添加方案</h3>
  </div>
  <div class="modal-body">
    <p><h4 >方案名：</h4><input type="text" data-provide="typeahead" id="newschemename_home4"></p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true" id="newschemeclose_home4">关闭</button>
    <button class="btn btn-primary" onclick="newSchemeHome4();">保存</button>
  </div>
</div>
<script>


$(document).ready(function(){

	initMap_home4();
});


function initMap_home4(){
	var mapOptions = {
		center : new google.maps.LatLng(40.0507451947963, 116.40426635742188),
		zoom : 6,
		scaleControl : true
	};
	map_home4 = new google.maps.Map(document.getElementById("googleMap_home4"), mapOptions);
	
	load_marker_home4();
}
 

//加载marker到地图上
function load_marker_home4(){
	//重新初始化
	markers_home4 = {};
	$(".infos-home4").each(function(){
		var infoId = this.value;
		var indexX = $("#indexX_home4_"+infoId).val();
		var indexY = $("#indexY_home4_"+infoId).val();
		var typeId = $("#typeId_home4_"+infoId).val();
		var number = $("#number_home4_"+infoId).val();
		if(markers_home4[infoId]  == undefined){
			
			markers_home4[infoId] = new google.maps.Marker({
			    position: new google.maps.LatLng(indexX,indexY),
			   /*  map: map_home4, */
			    icon: "img/mapsType/"+typeId+".png",
			    title:number
			});
			boundSchemeMarkerClickEvent(infoId);
			
		}else{
			markers_home4[infoId].setMap(map_home4);
		}
	});
	$('#check-all-home4').click();
}
 
/**
 * 绑定方案列表媒体标记点击事件
 */
function boundSchemeMarkerClickEvent(infoId){
	google.maps.event.addListener(markers_home4[infoId], 'click', function(event){
		$("#hidden_home4_"+infoId).parent().parent().toggleClass("bgcolor_gray");
		window.location.hash="#hidden_home4_"+infoId;
	});

}
 
 
/**
 * 显示标签
 */
function showMarker_home4(obj){
	var checked = $(obj).is(":checked");
	var infoId = $(obj).val();
	if(checked){
		markers_home4[infoId].setMap(map_home4);
		map_home4.setCenter(markers_home4[infoId].getPosition());
	}else{
		markers_home4[infoId].setMap(null);
	}
}



//全选、全不选
function selectAll_home4_list1(obj){
	var isSelectInfo = $(obj).is(":checked");
	$(".infos-home4").prop("checked",isSelectInfo);
	if(isSelectInfo){
		for(marker in markers_home4){
			markers_home4[marker].setMap(map_home4);
		}
	}else{
		for(marker in markers_home4){
			markers_home4[marker].setMap(null);
		}
	}
}

//反选
function check_home4_fanxuan(){
	$(".infos-home4").each(function(){
		   $(this).attr("checked",!this.checked);              
	});
}

//批量下载PPT
function exportInfoListHome4() {
	
	var temoCount = 0;
	var str='/web/toExportSchemeList_infoScheme?checkDefult=0';
	$(".infos-home4").each(function(){
		   if(this.checked){
			   temoCount++
				str += "&infoid="+this.value;
			}
	});
	temoCount > 0 ? window.location.href=str : art.tips("请至少选择一个媒体！");
}

function selectSchemeHome4(name){
	var action = "listByName_userScheme";
	var param = {
			path:"home4.jsp",
			"userSchemeVo.schemeName":name,
			index:"1",
			size:"10"
	};
	web.loadHome4(action,param);
}

//删除方案媒体
function deleteSchemeJs(id){
	$.dialog.confirm('你确定要在此方案中删除选中媒体吗？', function(){
		web.loadAction("delete_userScheme",{"userScheme.id" : id},function(data){
			if(data.success){
				art.tips("删除成功！");
				initHome4('${userSchemeVo.schemeName}');
			}
		});
	}, function(){
	    return ;
	});

}

//批量删除
function deleteUserSchemeHome4(){
	var temoCount = 0;
	var str='deleteAll_userScheme?checkDefult=0';
	$(".infos-home4").each(function(){
		   if(this.checked){
			   temoCount++
				str += "&infoId="+$(this).attr("usId");
			}
	});
	
	if(temoCount > 0){
		$.dialog.confirm('你确定要在此方案中删除选中媒体吗？', function(){
			web.loadAction(str,null,function(data){
				if(data.success){
					art.tips("删除成功！");
					initHome4('${userSchemeVo.schemeName}');

				}else{
					art.tips("删除失败！");
				}
			});
		}, function(){
		    return ;
		});
	}else{
		art.tips('请选择至少一个媒体。');
	}


}

//保存到方案
function saveSchemeHome4(name){
	var str;
	var tempCount = 0;
	$(".infos-home4").each(function(){
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
function newSchemeHome4(){
	var name =$("#newschemename_home4").val();
	var str;
	var tempCount = 0;
	$(".infos-home4").each(function(){
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
					$("#newschemeclose_home4").click();
					art.tips("保存成功");
					initHome4(name);
				} else {
					$("#newschemeclose_home4").click();
					art.tips('方案已存在或未选择媒体');
				}
			}
		});
	}else{
		art.tips("请至少选择一个媒体");
	}
}


//管理客户自己的方案
function configToUserScheme(){

	$.ajax({url:"listJson_userScheme", type:"post", data: null, dataType:"json",
		success: function(data){
			if(data != ""){
				art.param({
					title:"我的方案",
					content:createUserSchemeDeleteListDiv(data),
					ok:true,
					okVal:"关闭"
				});
			}else{
				art.tips("您没有创建过方案。");
			}
		}
	});
}


/**
* 创建用户方案列表div
*/
function createUserSchemeDeleteListDiv(data){
	var div = "<div><table>";
	for(var i=0; i<data.length;i++){
		var span = "<tr  height='50'><td><span>方案名："+data[i].schemeName+"</span></td>"
						+"<td><button class=\"btn red\" style=\"background-color:#00B3D3;\" onclick=\"deleteUserScheme('"+data[i].schemeName+"');\">删除此方案</button></td>"
						+"</tr>";
		div = div + span;
	}
	div = div + "<table></div>";
	return div;
}

/**
 * 删除用户方案。
 */
function deleteUserScheme(schemeName){
	$.ajax({
		url : "deleteScheme_userScheme",
		type : "post",
		data : {
			"userScheme.schemeName":schemeName
		},
		success : function(data) {
			if (JSON.parse(data).success) {
				art.tips("删除成功。");
				initHome4();
			} else {
				art.tips("删除失败！")
			}
		}
	});
}

/**
 * 返回选中媒体到首页地图
 */
function returnIndexMap_home4(){
	infoMarkersTemp = {};
	visibleMarkers();
	showTab(1);
	$(".infos-home4").each(function(){
		   if(this.checked){
			   infoMarkers[this.value].setVisible(true);
			   infoMarkersTemp[this.value] = infoMarkers[this.value];
			}
	});
}

/**
 * 弹窗显示图片
 */
function showImg_home4(id){
	var data = $("<div>").load("find_info?path=/oa/show-infoImgs.jsp&data.id="+id);
	art.tip(data,null,"图片查看");
}
</script>