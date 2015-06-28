<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
	<div class="tab-pane">

		<div class="portlet box green ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>管理员授权</div>
				
			</div>

			<div class="row-fluid portlet-body form">
				
				<div class="span6 form-horizontal form-bordered">

					<div class="control-group">
						<label class="control-label">管理员头像</label>
						<div class="controls">
						<img alt="${dataVO.name}" src="${dataVO.head}" style="width:200px;height:200px;"/>
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">管理员编号</label>
						<div class="controls">
							${dataVO.accountId}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">管理员账号</label>
						<div class="controls">
							${dataVO.username}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">账号类型</label>
						<div class="controls">
							${dataVO.power}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">账号登陆次数</label>
						<div class="controls">
							${dataVO.count}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">账号创建时间</label>
						<div class="controls">
							${session.sessionTools.showTime(dataVO.setTime,'yyyy-MM-dd HH:mm:ss')}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">最后一次登陆</label>
						<div class="controls">
							${session.sessionTools.showTime(dataVO.lastTime,'yyyy-MM-dd HH:mm:ss')}
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">管理员姓名</label>
						<div class="controls">
							${dataVO.name}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">身份证号</label>
						<div class="controls">
							${dataVO.card}
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">联系方式</label>
						<div class="controls">
							${dataVO.phone}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">备注</label>
						<div class="controls">
							${dataVO.intro}
						</div>
					</div>
				</div>
				<div class="span5" id="param_admin_role">
					<h2>请选择${dataVO.name}可以拥有的角色</h2>
					<ul class="tree">
						<s:iterator value="roleList">
							<li>
								<fieldset>
									<legend style="margin-bottom:0px;">
										<input ${session.sessionTools.role(id)?"checked":""} style="vertical-align:-2px;" id="${id}" type="checkbox" name="roleIds" value="${id}">
										<label style="display:inline;" for="${id}">
										<s:property value="name"/>
										</label>
									</legend>
									权限简介： <s:property value="intro"/>
								</fieldset>
							</li>
						</s:iterator>
					</ul>
					<div class="form-actions">
						<button class="btn green" onclick="role_admin_role();"><i class="icon-bolt"></i>  授权</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	function role_admin_role(){
		var params = tools.formParams("param_admin_role");
		params["accountId"] = "${dataVO.accountId}";
		$.post("changeRole_admin",params,function(data){
			var datas = $.parseJSON(data);
			if(datas.success){
				tools.tip("角色更改成功!");
			}else{
				var _tip = {1:"更改失败，服务器异常，请联系管理员"};
				tools.adminErrorTip(_tip,datas.code);
			}
		});
	}
</script>
	