<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div style="margin-left: 10px;">
	<div class=" form-horizontal form-bordered" id="param-pro21">
		 <s:if test="#session.account.power == 1">
			<br><br> 
			<span>联系公司：</span>
			<input type="text" name="query.serverCompany"  style="width: 300px;">
			<br><br> 
			<span>联系电话：</span>
			<input type="text" name="query.serverPhone"  style="width: 300px;">
			<br><br> 
			<span>联&nbsp;&nbsp;系&nbsp;人：</span>
			<input type="text" name="query.serverName"  style="width: 300px;">
		</s:if>
		<br><br> 
		<span>媒体编号：</span>
		<input type="text" name="query.number" style="width: 300px;"> 
		<br>
		<br>
		<span>媒体位置：</span>
		<input type="text" name="query.address" style="width: 300px;"> 
		<br><br>
		<span>媒体形式：</span>
		<select data-placeholder="选择媒体类型" name="query.type" class="chosen" multiple="multiple"  id="select_type21"  >
			<s:iterator value="list">
				<s:if test="type == 0">
				<option value="${code}" > <s:property value="name"/></option>
				</s:if>
			</s:iterator>
		 </select>
		 <br><br>
		 <span>高速路段：</span>
		 <select data-placeholder="选择高速路段"  name="query.way" class="chosen " multiple="multiple" >
			<s:iterator value="Waylist">
					<option value="${code}" > <s:property value="name"/></option>
			</s:iterator>
		</select>
		<br><br> 
		<span>价格区间：</span>
		<select data-placeholder="选择价格区间" name="query.price" style="width: 312px;" class="chosen-with-diselect"  >
					<option value="" ><span>请选择</span></option>
					<option value="0" ><span>10万以下</span></option>
					<option value="1" ><span>10万-20万</span></option>
					<option value="2" ><span>20万-30万</span></option>
					<option value="3" ><span>30万-40万</span></option>
					<option value="4" ><span>40万以上</span></option>
		</select> 
	 	<br><br>  
		<span style="display: inline;" > 城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市：</span>
		<div style="display: inline;" id="information_region21"></div>
		<br><br>  
		<span>媒体灯光：</span>
		<input type="radio"  value="1" name="query.light"> 有
		<input type="radio"  value="0"  name="query.light"> 无
		<input type="radio" checked value="2"  name="query.light"> 随意
		<br><br> 
		<span>媒体档期：
		</span><input type="radio"  value="1"  name="query.dangqi"> 有
	    <input type="radio"  value="0" name="query.dangqi"> 无
	    <input type="radio" checked value="2" name="query.dangqi"> 随意
	    <br><br> 
		<span>其&nbsp;&nbsp;&nbsp;&nbsp;他：</span>
		<input type="checkbox" id="isZhaoBiao_pro21" > 招标中<br> 
		
		
	 </div>
</div>

<script>
	
	$(document).ready(function(){

		 district = new District("information_region21");
         district.initSelectProvince();
         try {
        	 $(".chosen").chosen();
    		 $(".chzn-container").css("width","100%");
		} catch (e) {
			console.log(e);
		}
		 
	});
	
	function search_21() {
		var param = web.formParams("param-pro21");
		param["query.zhaobiao"] = $("#isZhaoBiao_pro21").is(":checked") == true ? 1 : 0;
		//地区显示编号不带00 如 济南市250000  简化后为25 可以搜到251607 之类
		param["query.region"] = district.getRegion().replaceAll("00","");
		
		if(param["query.type"]!=null){
			param["query.type"] = param["query.type"].join(",");
		}
		if(param["query.way"]!=null){
			param["query.way"] = param["query.way"].join(",");
		}

		param["path"] = "home1.jsp";
		param["index"] = "1";
		param["size"] = "0";
		 
		$.ajax({url:"webIndexMapJson_info", type:"post",async: false,data: param, dataType:"json",
			beforeSend:function(XMLHttpRequest){
				art.tips("正在搜索...",100,"loading.gif");
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
				
				web.loadHome2("webIndexMap_info",param);
				
				showTab(1);
				art.tips("搜索成功，结果已经显示在地图上。",1,"success.gif");
			}
		});
	}
</script>