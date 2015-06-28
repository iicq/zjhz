<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="tab-pane">

		<div class="portlet box green ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>管理员编辑</div>
			</div>
			
			<div class=" portlet-body form" >
				
				<div class="form-horizontal form-bordered " id="param_admin_edit">
					
					<div class="control-group">
						<label class="control-label">账号</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" name="account.username" value="${dataVO.username}"/>
							<input type="hidden" name="account.id" value="${dataVO.id}">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">密码</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" name="account.password"  placeholder="请输入密码"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">再次输入密码</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" id="password_admin_edit"  placeholder="请再次输入密码"/>
						</div>
					</div>
					
					
					<div class="form-actions">
						<button class="btn green" onclick="update_admin_edit();"><i class="icon-ok"></i> 保存</button>
					</div>
					
				</div>

			</div>

		</div>

	</div>


	
	