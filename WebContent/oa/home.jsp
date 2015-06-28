<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="row-fluid" >

	<div>
		<%-- <s:if test="#session.sessionTools.userPower('8731c9d072d14a4da807f3e46e0904b6')"> --%>
			<a url="#module=info-list&action=list_info&index=1&size=25&query.status=1" title="媒体资料" onclick="showTab(this)" class="icon-btn span2">
				<i class="icon-map-marker"></i>
				<label>领取凭证</label>
			</a>
		<%-- </s:if> --%>
		
		<%-- <s:if test="#session.sessionTools.userPower('0ce9a4081585494dbcb19398661de36f')"> --%>
			<a url="#module=info-list&action=list_info&index=1&size=25" title="信息管理" onclick="showTab(this)" class="icon-btn span2">
				<i class="icon-map-marker"></i>
				<label>社员入社</label>
			</a>
		<%-- </s:if> --%>
		
		<%-- <s:if test="#session.sessionTools.userPower('95302b7306ea4dd08a12a8abae690538')"> --%>
		<a url="#module=scheme-list&action=list_scheme&index=1&size=10&dataVO.name=" title="方案管理" onclick="showTab(this)" class="icon-btn span2">
			<i class="icon-bookmark-empty"></i>
			<label>增加活期股金</label>
		</a>
		<%-- </s:if> --%>
		
		<%-- <s:if test="#session.sessionTools.userPower('712fba3216fa4750abc36356b2b2eb86')"> --%>
			<a url="#module=log-list&action=list_log&index=1&size=10&dataVO.type=&dataVO.content=" title="日志管理" onclick="showTab(this)" class="icon-btn span2">
				<i class="icon-calendar"></i>
				<label>增加定期股金</label>
			</a>
		<%-- </s:if> --%>
		
		<%-- <s:if test="#session.sessionTools.userPower('bca0fd125af740e0aaa1e0259729a916')"> --%>
		<a url="#module=way-list&action=list_way&index=1&size=10" title="路段管理" onclick="showTab(this)" class="icon-btn span2">
			<i class="icon-map-marker"></i>
			<label>支出定期股金</label>
		</a>
		<%-- </s:if> --%>
		
		<%-- <s:if test="#session.sessionTools.userPower('d0a1de450bd3496f8d7b075fba8445e5')">
		<a url="#module=direction-list&action=list_type&data.type=1&index=1&size=10" title="方位管理" onclick="showTab(this)" class="icon-btn span2">
			<i class="icon-eye-open"></i>
			<label>方位管理</label>
		</a>
		</s:if> --%>
	</div>
	<br><br><br><br><br>
	<fieldset>
		<legend><i class="icon-bullhorn"></i> 公告</legend>
		<table class="table table-bordered table-hover"  >

				<thead>

					<tr>
						
						<th>操作时间</th>
						
						<th class="hidden-480">内容</th>
						
						<th>管理员</th>
						
						<th class="hidden-480">对象Id</th>
						
						<!-- <th>删除</th> -->
					</tr>

				</thead>

				<tbody>

					 <s:iterator value="list">
					
						<tr class="">
							
							<td>
								${setTime == 0 ? '无数据':sessionTools.showTime(setTime,"yyyy-MM-dd HH:mm")}
							</td>
							
							<td class="hidden-480"><s:property value="content" /></td>
							
							<td><s:property value="adminName" /></td>
							
							<td class="hidden-480"><s:property value="textId" /></td>
							
<%-- 						<td>
								<a  href="javascript:remove_log('${id}');">
								<span class="label label-danger">
								<i class="icon-trash"></i> 删除</span></a>
							</td> --%>
						</tr>
					</s:iterator> 
				</tbody>
			</table>
	</fieldset>
	
	</div>
<script>
$(document).ready(function(){
	$("#tabTitle").pin({ minWidth: 940});
});

	function showTitle(obj){
		tools.tip($(obj).attr("title"));
	}

	
</script>
	
	