<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="tab-pane">

		<div class="portlet box green ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>管理员添加</div>
			</div>
			
			<div class=" portlet-body form" >
				
				<div class="form-horizontal form-bordered " id="param_admin">
				
					<div class="control-group">
						<label class="control-label">员工姓名</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" id="dname" onblur="getData_admin();"  placeholder="请输入员工姓名，自动关联员工信息"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">身份证号</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" id="dcard" value="" disabled="disabled"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">联系电话</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" id="dphone" value="" disabled="disabled"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">管理员账号</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" name="account.username"  placeholder="请输入登陆用的账号"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">管理员密码</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" name="account.password"  placeholder="请输入密码"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">再次输入密码</label>
						<div class="controls">
							<input type="text" class="m-wrap span7" id="password"  placeholder="请再次输入密码"/>
						</div>
					</div>
					
					<input type="hidden" id="aid" name="account.id" value="">
					
					<div class="form-actions">
						<button class="btn green" onclick="save_admin();"><i class="icon-ok"></i> 保存</button>
					</div>
					
				</div>

			</div>

		</div>

	</div>

	
	