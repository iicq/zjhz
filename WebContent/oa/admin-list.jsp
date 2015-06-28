<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="portlet box green">

		<div class="portlet-title">

			<div class="caption">
				<i class="icon-edit"></i>管理员列表
				
			</div>
			<%-- <div style="float:right;">
				<a href="oa/downExcel_admin">
					<span class="label label-success purple" style="height:15px;">
					 导出Excel<i class="icon-download-alt"></i></span>
				</a>
				
			</div> --%>
			
		</div>

		<div class="portlet-body">
		<div class="clearfix">

					<s:if test="#session.sessionTools.userPower('7')">
					
						<a url="#module=admin-add" class="btn green" title="管理员添加" onclick="showTab(this)" >
	
							 <i class="icon-plus-sign-alt"></i>	管理员添加
	
						</a>
						<!-- <div style=""><div class="buttonContent"><button type="button"  onclick="javascript:$.printBox('print_checkIncome')">打印</button></div></div> -->
						<a  class="btn green" title="打印" onClick="printdiv('div_print');" >
	
							 <i class="icon-plus-sign-alt"></i>	打印
	
						</a>
						<a href="oa/downExcel_admin" class="btn green" title="导出Excel"  >
	
							 <i class="icon-download-alt"></i> 导出Excel
	
						</a>
					</s:if>

			</div>
			<div id ="div_print" >
			<table class="table table-bordered table-hover" id="table_admin" width="100%" layoutH="150">

				<thead>

					<tr>
						
						<th class="hidden-480">用户ID</th>
						
						<th class="hidden-480">用户账号</th>
						
						<th>用户名</th>

						<th class="hidden-480">身份证号</th>
						
						<th class="hidden-480">联系电话</th>
						
						<s:if test="#session.sessionTools.userPower('0301913718124b80978c3bc85cf42dbb')">
						<th>授权</th>
						</s:if>
						
						<s:if test="#session.sessionTools.userPower('4ae4aa0386494117a43d3ce89481803e')">
						<th class="hidden-480">编辑</th>
						</s:if>
						
						<s:if test="#session.sessionTools.userPower('237db00926dd4b3fa3945b37bc431a57')">
						<th>删除</th>
						</s:if>
					</tr>

				</thead>

				<tbody>

					 <s:iterator value="list">
					
						<tr class="">
							
							<td class="hidden-480"><s:property value="id" /></td>
							
							<td class="hidden-480"><s:property value="username" /></td>
	
							<td>
								<s:property value="name" />
								<%-- <s:property value="%{name.length()>4 ? name.substring(0,4)+'...' : name}" /> --%>
							</td>
							
							<td class="hidden-480"> <s:property value="card" /></td>
							
							<td class="hidden-480"><s:property value="phone" /></td>
							
							<td>
							<s:if test="#session.sessionTools.userPower('0301913718124b80978c3bc85cf42dbb')">
								<a  url="#module=admin-role&action=findRole_admin&data.id=${id}&accountId=${accountId}" title="管理员授权"  onclick="showTab(this)" >
								<span class="label label-info">
								<i class="icon-check"></i> 授权</span></a>
							</s:if>
							</td>
							
							<td class="hidden-480">
							<s:if test="#session.sessionTools.userPower('4ae4aa0386494117a43d3ce89481803e')">
								<a  url="#module=admin-edit&action=find_admin&data.id=${id}" title="管理员编辑"  onclick="showTab(this)" >
								<span class="label label-warning">
								<i class="icon-edit"></i> 编辑</span></a>
							</s:if>
							</td>
							
							<td>
							<s:if test="#session.sessionTools.userPower('237db00926dd4b3fa3945b37bc431a57')">
								<a  href="javascript:remove_admin('${accountId}');">
								<span class="label label-danger">
								<i class="icon-trash"></i> 删除</span></a>
							</s:if>
							</td>
						</tr>
					</s:iterator> 
				</tbody>
			</table>
			</div>
			<div id="paginator_admin"></div>  
		</div>

	</div>

	<!-- END EXAMPLE TABLE PORTLET-->

	<script>
		jQuery(document).ready(function() {
			$('#paginator_admin').bootstrapPaginator(
				getPaginatorOptions(
				"#module=admin-list&action=list_admin&dataVO.username=${dataVO.username}",
				"${index}","${total}","${size}"
				));
		});
		
		function remove_admin(id){
			tools.confirm("确定要删除么？",function(state){
				if(state){
					tools.loadAction("delete_admin", {"accountId":id},function(data){
						if(data.success){
							tools.tip("删除成功！",function(){
								pageTab("#module=admin-list&action=list_admin&index=1&size=10&dataVO.username=","管理员列表");
							});
						}else{
							var _case = {1:"服务器异常，删除失败！请联系管理员"};
							tools.adminErrorTip(_case, data.code);
						}
					});
				}
			});
		}
		
		(function($){
			$.printBox = function(rel){
				alert("")
				var _printBoxId = 'printBox';
				var $contentBox = rel ? $('#'+rel) : $("body"),
					$printBox = $('#'+_printBoxId);
					
				if ($printBox.size()==0){
					$printBox = $('<div id="'+_printBoxId+'"></div>').appendTo("body");
				}

				$printBox.html($contentBox.html()).find("[layoutH]").height("auto");
				window.print();

			}

		})(jQuery);
	</script>


	
	