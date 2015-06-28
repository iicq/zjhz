<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
	<div class="tab-pane">

		<div class="portlet box blue ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>角色信息</div>
				
			</div>

			<div class="portlet-body form">
				
				<div class="form-horizontal form-bordered">

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
				</div>

			</div>

		</div>

	</div>


	
	