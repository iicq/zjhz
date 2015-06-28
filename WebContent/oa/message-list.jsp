<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="portlet box green">
	
		<div class="portlet-title">

			<div class="caption">
				<i class="icon-edit"></i>消息列表
			</div>
		</div>

		<div class="portlet-body">
		<div class="clearfix">
				<div style="margin-top: 10px;" class="query" id="query_message_list">
			消息类型:
			<select name="data.type">
				<option value="" >全部</option>
				<option value="0" ${dataVO.type=="0"?"selected":""}>消息</option>
				<option value="1" ${dataVO.type=="1"?"selected":""}>公告</option>
			</select>
			消息标题:
			<input type="text" name="data.title" value="${dataVO.title}">
			<button onclick="query_message_list();">查询</button>
		</div>
		</div>
		
			<table class="table table-bordered table-hover"  >

				<thead>

					<tr>
						
						<th>发送人</th>
						
						<th class="hidden-480">接收人</th>
						
						<th class="hidden-480">标题</th>
						
						<th class="hidden-480">发送时间</th>
						
						<th class="hidden-480">阅读状态</th>
						
						<th class="hidden-480">类型</th>
						
						<th>删除</th>
					</tr>

				</thead>

				<tbody>

					 <s:iterator value="list">
					
						<tr class="">
							
							<td>
								<s:property value="sendId" />
							</td>
							
							<td class="hidden-480">
							<s:property value="receiveId" />
							</td>
							
							<td class="hidden-480">
							<s:property value="title" /></td>
							
							<td class="hidden-480">
							${session.sessionTools.showTime(setTime,"yyyy-MM-dd")}
							</td>
							
							<td class="hidden-480">
								${status==0?"未读":"已读"}
							</td>
							
							<td>
								<a  href="javascript:remove_message('${id}');">
								<span class="label label-danger">
								<i class="icon-trash"></i> 删除</span></a>
							</td>
							
						</tr>
					</s:iterator> 
				</tbody>
			</table>
			<div id="paginator_message"></div>  
		</div>

	</div>

	<!-- END EXAMPLE TABLE PORTLET-->

	<script>
		jQuery(document).ready(function() {
			$('#paginator_message').bootstrapPaginator(
					getPaginatorOptions(
						"#module=message-list&action=list_message",
						"${index}","${total}","${size}"
						));
		});
		
		function remove_message(id){
			tools.confirm("确定要删除么？",function(state){
				if(state){
					tools.loadAction("delete_message", {"data.id":id},function(data){
						if(data.success){
							tools.tip("删除成功！",function(){
								pageTab("#module=message-list&action=list_message&index=1&size=10","管理员列表");
							});
						}else{
							var _case = {1:"服务器异常，删除失败！请联系管理员"};
							tools.adminErrorTip(_case, data.code);
						}
					});
				}
			});
		}
		
		function query_message_list(){
			var param = tools.formParams("query_message_list");
			pageTab("#module=message-list&action=list_message&index=1&size=10&dataVO.type="+param["dataVO.type"]+"&dataVO.title="+param["dataVO.title"]+"");
		}
	</script>


	
	