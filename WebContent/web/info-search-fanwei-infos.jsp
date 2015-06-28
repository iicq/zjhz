<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 视野内搜索窗口 -->

<div class="portlet-body" style="height:600px; width:600px; overflow:auto;" >
	总计：<s:property value="listVO.size()"/> 条
	<table class="table table-striped table-bordered table-hover " >
		<thead>
			<tr>
				<th >
					<input type="checkbox" class="group-checkable" onclick="check_all_fanwei_infos(this);">
				</th>
				<th>媒体位置</th>
				
				<th >类型</th>
				
				<th style="width: 70px;">万/年</th>
			</tr>
		</thead>
	
	  	<tbody id="checkid">
			 <s:iterator value="listVO" status="info">
				<tr class="gradeX odd">
					<td>
						<input type="checkbox" value="${id}" class="checkbox-fanwei-infos" name="infoId">
					</td>
					<td><s:property value="address" /></td>
					<td><s:property value="typeName" /></td>
					<td><s:property value="publish12" /></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	
</div>

<script>

function check_all_fanwei_infos(obj){
	var isSelectInfo = $(obj).is(":checked");
	$(".checkbox-fanwei-infos").prop("checked",isSelectInfo);
}

//批量下载PPT
function exportInfoListFanwei() {
	
	var temoCount = 0;
	var str='/web/toExportSchemeList_infoScheme?checkDefult=0';
	$(".checkbox-fanwei-infos").each(function(){
		   if(this.checked){
			   temoCount++
				str += "&infoid="+this.value;
			}
	});
	temoCount > 0 ? window.location.href=str : art.tips("请至少选择一个媒体！");

}

//添加到方案
function addToScheme_fanwei_infos(){
	var str = "";
	var tempCount = 0;
	$(".checkbox-fanwei-infos").each(function(){
		   if(this.checked){
			   tempCount++
				str += "&infoId="+this.value;
			}
	});
	
	addInfosToUserScheme(str);
}

</script>