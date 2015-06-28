<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
	<div class="tab-pane">

		<div class="portlet box green ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>权限信息</div>
				
			</div>

			<div class="portlet-body form">
				
				<div class="form-horizontal form-bordered">

					<div class="control-group">
						<label class="control-label">权限编号</label>
						<div class="controls">
							${dataVO.id}
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">权限名称</label>
						<div class="controls">
							${dataVO.name}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">权限图标</label>
						<div class="controls">
							<i class="${dataVO.icon}"></i>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">权限url</label>
						<div class="controls">
							${dataVO.url}
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">权限类型</label>
						<div class="controls">
							${dataVO.menu==1?"菜单权限":"操作权限"}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">权限索引</label>
						<div class="controls">
							${dataVO.ord}
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">权限简介</label>
						<div class="controls">
							${dataVO.intro}
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">父级权限编号</label>
						<div class="controls">
							${dataVO.parentId}
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">父级权限名称</label>
						<div class="controls">
							${dataVO.parentName==null ? "顶级权限":dataVO.parentName}
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>


	
	