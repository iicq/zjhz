<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
	<div class="tab-pane">

		<div class="portlet box green ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>角色编辑</div>
				
			</div>

			<div class="portlet-body form">
				
				<div class="form-horizontal form-bordered" id="param_role_edit">

					<div class="control-group">
						<label class="control-label">角色编号</label>
						<div class="controls">
							<input type="text" value="${data.id}" disabled="disabled" class="m-wrap span6" name="data.id"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">角色名</label>
						<div class="controls">
							<input type="text"  value="${data.name}" class="m-wrap span6" name="data.name"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">角色简介</label>
						<div class="controls">
							<textarea class="m-wrap span6" name="data.intro" style="height: 100px;"> ${data.intro}</textarea>
						</div>
					</div>
					
					<div class="form-actions">
						<button class="btn green" onclick="update_role_edit();"><i class="icon-ok"></i> 保存</button>
					</div>
					
				</div>

			</div>

		</div>

	</div>


	
	