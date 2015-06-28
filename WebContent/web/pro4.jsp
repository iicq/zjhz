<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div style="margin-left: 10px;">
	<div id="param-pro4">

		<span>方案归属：</span><input type="text" name="query.infoSchemeName" style="width: 150px;" >
		<br>
		<span>广告公司：</span><input type="text" name="query.serverCompany"  style="width: 150px;">
		<br>
		<span>联系电话：</span><input type="text" name="query.serverPhone" style="width: 150px;" >
		<br>
		<span>选择道路：</span><input type="text" name="query.way" style="width: 150px;" >
		<br>
		<span>城 市：</span><div id="advertising_region"></div>
		
	</div>
	<p style="text-align: center;">
		<button class="btn" type="button" onclick="search_4();">搜索</button>
		<button class="btn" type="reset" onclick="search_4_1();">重置</button>
		<!-- <button class="btn" type="button">进入列表</button> -->
	</p>
<%-- 	<p style="text-align: center;">符合条件的媒体有<span style="color: red;"><s:property value="total"/></span>块</p> --%>
	 
</div>

<script>
	$(document).ready(function(){
		$(".chosen").chosen();
		advertising = new District("advertising_region");
		advertising.initSelectProvince();
	});
	function search_4(){
		var param = web.formParams("param-pro4");
		param["query.region"] = advertising.getRegion().replaceAll("00","");
		 
		param["path"] = "home1.jsp";
		param["index"] = "1";
		param["size"] = "0";
		 
		web.loadHome1("webIndexMap_info",param);
		showTab(1);
		
		param["path"] = "home2.jsp";
		param["index"] = "1";
		param["size"] = "10";
		web.loadHome2("webIndexMap_info",param);
		
		showTab(2);
	 
		
	}
	
	function search_4_1(){
		 
		 web.loadPro4("listQuery_type?path=pro4.jsp", null);
	}
	
</script>