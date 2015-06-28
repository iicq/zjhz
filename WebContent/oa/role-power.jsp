<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


	<div class="tab-pane">

		<div class="portlet box green ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>角色授权</div>
				
			</div>

			<div class="row-fluid portlet-body form">
				
				<div class="form-horizontal form-bordered span6">

					<div class="control-group">
						<label class="control-label">角色编号</label>
						<div class="controls">
							${data.id}
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">角色名</label>
						<div class="controls">
							${data.name}
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">角色简介</label>
						<div class="controls">
							${data.intro}
						</div>
					</div>
					
					<div class="form-actions">
						<button class="btn green" onclick="role_power();"><i class="icon-bolt"></i>  授权</button>
					
					</div>
					
				</div>
				<div class="span3">
				<ul class="tree">
					<li>
						<label id="rl0" onclick="choose_role_power(this);"  class="tree-toggle">顶级权限</label>
						<ul class="branch in" id="param_role_power">
							<s:iterator value="powerVO">
								<li>
									<input name="powers" type="checkbox" value="${id}" onclick="choose_role_power(this);" id="rl${id}"  ${session.sessionTools.power(id)?"checked='checked'":""}  style="vertical-align: -2px;">
									<a  href="javascript:void(0);"style="display: inline;" onclick="showul(this);"
										class="${list.size()>0? 'tree-toggle ':''}closed " >
										<i class="${icon}"></i> ${name}
									</a>
									<s:if test="list.size>0">
										<ul class="branch">
											<s:iterator value="list">
											<li>
												&nbsp;
												<input name="powers" value="${id}" onclick="choose_role_power(this);" parentId="${parentId}" id="rl${id}" type="checkbox" ${session.sessionTools.power(id)?"checked='checked'":""} style="vertical-align: -2px;">
												<a href="javascript:void(0);" style="display: inline;" onclick="showul(this);" 
													class="${list.size()>0? 'tree-toggle ':''}closed ">
													<i class="${icon}"></i> ${name}
												</a>
												<s:if test="list.size>0">
													<ul class="branch">
														<s:iterator value="list">
														<li>
															&nbsp;&nbsp;&nbsp;
															<input name="powers" value="${id}" type="checkbox"  onclick="choose_role_power(this);" parentId="${parentId}"  id="rl${id}" ${session.sessionTools.power(id)?"checked='checked'":""} style="vertical-align: -2px;">
															<a href="javascript:void(0);" style="display: inline;" onclick="showul(this);"  >
																<i class="${icon}"></i> ${name}
															</a>
														</li>
														</s:iterator>
													</ul>
												</s:if>
											</li>
											</s:iterator>
										</ul>
									</s:if>
								</li>
							</s:iterator>
						</ul>
					</li>
				</ul>
				</div>

			</div>

		</div>

	</div>

<script type="text/javascript">
	function role_power(){
		var params = tools.formParams("param_role_power");
		params["data.id"] = "${data.id}";
		$.post("changePower_role",params,function(data){
			var datas = $.parseJSON(data);
			if(datas.success){
				tools.tip("权限更改成功");
			}else{
				var _tip = {1:"更改失败，服务器异常，请联系管理员"};
				tools.adminErrorTip(_tip,datas.code);
			}
		});
	}
	
	//查看此权限下其他权限是否有选中的
	function isHaveChoosed(obj){
		var ch = $(obj);
		var parentId = ch.attr("parentId");
		var bool = false;
		try {
			$("#rl"+parentId).parent().find("ul").find(":checkbox").each(function(){
				
				if($(this).is(":checked")){
					bool = true;
				}
			});
		} catch (e) {
			console.error("子类检查执行失败");
		} 
		return bool;
	}
	
	//点选权限时执行的操作
	function choose_role_power(obj){
		var ch = $(obj);
		//获取父类权限的id
		var parentId = ch.attr("parentId");
		try {
			//遍历此权限下全部权限，并赋予状态
			$(obj).parent().find("ul").find(":checkbox").each(function(){
				$(this).prop('checked',ch.is(":checked"));
			});
			//检查同级权限有没有被选中的，主要是判断此权限的父类权限的选中状态
			if(isHaveChoosed(obj)){
				$("#rl"+parentId).prop('checked',true);
				try{
					var parent = $("#rl"+parentId).attr("parentId");
					$("#rl"+parent).prop('checked',true);
				}catch(e){
					
				}
			}else{
				$("#rl"+parentId).prop('checked',false);
			}
		} catch (e) {
			console.error("全选执行失败");
		} 
		return false;
	}
	
	//显示子类权限
	function showul(obj){
		$(obj).next("ul").toggleClass("in");
		$(obj).toggleClass("closed");
		return false;
	}
</script>
	
	