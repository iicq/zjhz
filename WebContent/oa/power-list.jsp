<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="portlet box green">

		<div class="portlet-title">

			<div class="caption">
				<i class="icon-edit"></i>权限列表
			</div>


		</div>

		<div class="portlet-body">

			<div class="clearfix">
						
					<a href="javascript:pageTab('#module=power-list&action=list_power&data.parentId=0&index=1&size=10');" class="btn green" >
						 <i class="icon-home"></i>	返回顶级
					</a>
					
					<s:if test="#session.account.username == 'admin'">
						  <a url="#module=power-add&action=getAll_power" class="btn green"  title="权限添加" onclick="showTab(this)" >
	
							 <i class="icon-plus-sign-alt"></i>	权限添加
	
							</a> 
					
					</s:if>

			</div>

			<table class="table table-hover table-bordered" id="table_power">

				<thead>

					<tr>

						<th class="hidden-480">权限编号</th>

						<th>权限名</th>

						<th class="hidden-480">权限类型</th>
						
						<th class="hidden-480">权限简介</th>
						
						<th class="hidden-480">权限图标</th>
						
						<th class="hidden-480">父级权限名</th>
						
						<th class="hidden-480">权限URL</th>
						
						<th>查看</th>
						
						<s:if test="#session.account.username == 'admin'">
							<th class="hidden-480">编辑</th>
						</s:if>
						<s:if test="#session.account.username == 'admin'">
							<th>删除</th>
						</s:if>
					</tr>

				</thead>

				<tbody>

					 <s:iterator value="list">
					
						<tr class="">
	
							<td class="hidden-480"><s:property value="id" /></td>
	
							<td>
								<a title="${name}" href="javascript:pageTab('#module=power-list&action=list_power&data.parentId=${id}&index=1&size=10');">
									<s:property value="%{name.length()>5 ? name.substring(0,5)+'...' : name}" />
								</a>
							</td>
							
							<td class="hidden-480">${menu==1?"菜单权限":"操作权限"}</td>
							
							<td class="hidden-480" title="${intro}"><s:property value="%{intro.length()>6 ? intro.substring(0,6)+'...' : intro}" /></td>
							
							<td class="hidden-480">
							<i class="${icon}"></i>
							</td>
							
							<td class="hidden-480"  title="${parentName}">
								<s:property value="%{parentName == null ? '顶级权限' : (parentName.length()>5 ? parentName.substring(0,5)+'...' : parentName)}" />
							</td>
	
							<td class="hidden-480" title="${url}">
								<s:property value="%{url.length()>20 ? url.substring(0,20)+'...' : url}" />
							</td>
	
							<td>
								<a  url="#module=power-show&action=find_power&data.id=${id}" title="权限查看"  onclick="showTab(this)" >
								<span class="label label-success">
								<i class="icon-search"></i> 查看</span></a>
							</td>
							
							<s:if test="#session.account.username == 'admin'">
					 			<td class="hidden-480">
									<a  url="#module=power-edit&action=find_power&data.id=${id}" title="权限编辑"  onclick="showTab(this)" >
									<span class="label label-warning">
									<i class="icon-edit"></i> 编辑</span></a>
								</td>
							</s:if>
							
							<s:if test="#session.account.username == 'admin'">
								<td>
									<a  href="javascript:remove_power('${id}');">
									<span class="label label-danger">
									<i class="icon-trash"></i> 删除</span></a>
								</td> 
							</s:if>
							
						</tr>
						
					</s:iterator> 
					
				</tbody>

			</table>
		<div id="paginator_power"></div>  
		</div>

	</div>

	<!-- END EXAMPLE TABLE PORTLET-->

	<script>
	
		jQuery(document).ready(function() {
			$('#paginator_power').bootstrapPaginator(
					getPaginatorOptions(
						"#module=power-list&action=list_power&data.parentId=${data.parentId}",
						"${index}","${total}","${size}"
						));
		});
		
		function remove_power(id){
			tools.confirm("确定要删除么？",function(state){
				if(state){
					tools.loadAction("delete_power", {"data.id":id},function(data){
						if(data.success){
							tools.tip("删除成功！",function(){
								pageTab("#module=power-list&action=list_power&data.parentId=${data.parentId}&index=1&size=10");
							});
						}else{
							var _case = {1:"此权限下还有其他权限，请先删除它的子权限！",2:"服务器异常，删除失败！请联系管理员"};
							tools.adminErrorTip(_case, data.code);
						}
					});
				}
			});
		}
	</script>


	
	