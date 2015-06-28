<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="portlet box green">

		<div class="portlet-title">

			<div class="caption">
				<i class="icon-edit"></i>日志列表
			</div>
		</div>

		<div class="portlet-body">
			<div style="margin-top: 10px;" class="query" id="query_log_list">
				日志类型：
				<select name="dataVO.type">
					<optgroup label="系统日志">
						<option value="">全部</option>
						<option ${dataVO.type == "0" ? "selected":""} value="0">系统</option>
					</optgroup>
					<optgroup label="媒体">
						<option ${dataVO.type == "21" ? "selected":""} value="21">媒体添加</option>
						<option ${dataVO.type == "22" ? "selected":""} value="22">媒体修改</option>
						<option ${dataVO.type == "23" ? "selected":""} value="23">媒体删除</option>
						<option ${dataVO.type == "24" ? "selected":""} value="24">媒体动态记录</option>
					</optgroup>
					<optgroup label="客户">
						<option ${dataVO.type == "31" ? "selected":""} value="31">客户添加</option>
						<option ${dataVO.type == "32" ? "selected":""} value="32">客户修改</option>
						<option ${dataVO.type == "33" ? "selected":""} value="33">客户删除</option>
						<option ${dataVO.type == "34" ? "selected":""} value="34">客户动态记录</option>
						<option ${dataVO.type == "35" ? "selected":""} value="35">客户转移记录</option>
					</optgroup>
					<optgroup label="方案">
						<option ${dataVO.type == "51" ? "selected":""} value="51">方案添加</option>
						<option ${dataVO.type == "52" ? "selected":""} value="52">方案修改</option>
						<option ${dataVO.type == "53" ? "selected":""} value="53">方案删除</option>
					</optgroup>
					<optgroup label="喷绘管理">
						<option ${dataVO.type == "71" ? "selected":""} value="71">喷绘添加</option>
						<option ${dataVO.type == "72" ? "selected":""} value="72">喷绘修改</option>
						<option ${dataVO.type == "73" ? "selected":""} value="73">喷绘删除</option>
					</optgroup>
					<optgroup label="媒体图片">
						<option ${dataVO.type == "61" ? "selected":""} value="61">媒体图片添加</option>
						<option ${dataVO.type == "62" ? "selected":""} value="62">媒体图片删除</option>
						<option ${dataVO.type == "63" ? "selected":""} value="63">媒体图片设置为主图</option>
						<option ${dataVO.type == "64" ? "selected":""} value="64">媒体图片相关信息修改</option>
					</optgroup>
				</select>
				关键字：
				<input type="text" name="dataVO.content" value="${dataVO.content}" >
				<button onclick="query_log_list();">查询</button>
			</div>
			
			<table class="table table-bordered table-hover"  >

				<thead>

					<tr>
						
						<th>日志时间</th>
						
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
			<div id="paginator_log"></div>  
		</div>

	</div>

	<!-- END EXAMPLE TABLE PORTLET-->

	<script>
		jQuery(document).ready(function() {
			$('#paginator_log').bootstrapPaginator(
					getPaginatorOptions(
						"#module=log-list&action=list_log&dataVO.type=${dataVO.type}&dataVO.content=${dataVO.content}",
						"${index}","${total}","${size}"
						));
		});
		
		/* function remove_log(id){
			tools.confirm("确定要删除么？",function(state){
				if(state){
					tools.loadAction("delete_buyer", {"data.id":id},function(data){
						if(data.success){
							tools.tip("删除成功！",function(){
								pageTab("#module=log-list&action=list_log&index=1&size=10","日志管理");
							});
						}else{
							var _case = {1:"服务器异常，删除失败！请联系管理员"};
							tools.adminErrorTip(_case, data.code);
						}
					});
				}
			});
		} */
		
		function query_log_list(){
			var param = tools.formParams("query_log_list");
			pageTab("#module=log-list&action=list_log&dataVO.content="+param["dataVO.content"]+"&dataVO.type="+param["dataVO.type"]+"&index=1&size=10");
		}
	</script>


	
	