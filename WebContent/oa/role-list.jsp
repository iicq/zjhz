<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script language="javascript">
	function printdiv(printpage) {
		var headstr = "<html><head><title></title></head><body>";
		var footstr = "</body>";
		var newstr = document.all.item(printpage).innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = headstr + newstr + footstr;
		window.print();
		document.body.innerHTML = oldstr;
		return false;
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="portlet box green">

		<div class="portlet-title">

			<div class="caption">
				<i class="icon-edit"></i>角色列表
			</div>


		</div>

		<div class="portlet-body">
			<div class="clearfix">

					<s:if test="#session.sessionTools.userPower('9')">
					
						<a url="#module=role-add" class="btn green" title="角色添加" onclick="showTab(this)" >
	
							 <i class="icon-plus-sign-alt"></i>	角色添加
	
						</a>
						<a  class="btn green" title="打印" onClick="printdiv('div_print');" >
	
							 <i class="icon-plus-sign-alt"></i>	打印
	
						</a>
					</s:if>

			</div>
			<div id ="div_print" >
			<table class="table table-striped table-hover table-bordered">

				<thead>

					<tr>
						<th>角色名</th>

						<th>角色简介</th>
						
						<th>下属权限数量</th>
						
						<th>查看</th>
						
						<th>授权</th>
						
						<th>编辑</th>
						
						<th>删除</th>

					</tr>

				</thead>

				<tbody>

					 <s:iterator value="list">
					
						<tr class="">
							<td><s:property value="name" /></td>
	
							<td><s:property value="intro" /></td>
	
							<td><s:property value="powerCount" /></td>
	
							<td>
								<a url="#module=role-show&action=find_role&data.id=${id}" title="角色查看"  onclick="showTab(this)" >
								<span class="label label-success">
								<i class="icon-search"></i> 查看</span></a>
							</td>
							<td>
							<s:if test="#session.sessionTools.userPower('f53171a4a9b241d681e9596a58314e8e')">
								<a url="#module=role-power&action=givePower_role&data.id=${id}" title="角色授权"  onclick="showTab(this)" >
								<span class="label label-info">
								<i class="icon-check"></i> 授权</span></a>
							</s:if>
							</td>
							<td>
							<s:if test="#session.sessionTools.userPower('4d79a5412c1f468fa984c768c56da71d')">
								<a url="#module=role-edit&action=find_role&data.id=${id}" title="角色编辑"  onclick="showTab(this)" >
								<span class="label label-warning">
								<i class="icon-edit"></i> 编辑</span></a>
							</s:if>	
							</td>
							<td>
							<s:if test="#session.sessionTools.userPower('741e41b06aeb4325a9f19ebb9a2d8c7d')">
								<a href="javascript:remove_role('${id}');">
								<span class="label label-danger">
								<i class="icon-trash"></i> 删除</span></a>
							</s:if>
							</td>
	
						</tr>
						
					</s:iterator> 
					
				</tbody>

			</table>
			</div>
			<div id="paginator_role"></div>  
		</div>
	</div>
	
	<!-- END EXAMPLE TABLE PORTLET-->

	<script>
	
	jQuery(document).ready(function() {

		$('#paginator_role').bootstrapPaginator(
				getPaginatorOptions(
					"#module=role-list&action=list_role",
					"${index}","${total}","${size}"
					));
	});
		
		
	function remove_role(id){
		tools.confirm("确定要删除么？",function(state){
			if(state){
				tools.loadAction("delete_role", {"data.id":id},function(data){
					if(data.success){
						tools.tip("删除成功！",function(){
							pageTab("#module=role-list&action=list_role&index=1&size=10", "角色列表");
						});
					}else{
						var _case = {1:"服务器异常，删除失败！请联系管理员"};
						tools.adminErrorTip(_case, data.code);
					}
				});
			}
		});
	}
	
	</script>


	
	