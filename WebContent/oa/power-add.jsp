<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="tab-pane">

		<div class="portlet box green ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>权限添加</div>
			</div>
			
			<div class="row-fluid portlet-body form" >
				<div class="span3">
					<ul class="tree">
						<li>
							<a href="javascript:void(0);" onclick="choose_power(this)" name="顶级权限" id="0"  class="tree-toggle " >顶级权限</a>
							<ul class="branch in">
								<s:iterator value="list">
									<li>
										<a href="javascript:void(0);" onclick="choose_power(this)" name="${name}" 
											class="${list.size()>0? 'tree-toggle ':''}closed" 
											id="${id}">
											<i class="${icon}"></i> ${name} 
										</a>
										<s:if test="list.size>0">
											<ul class="branch">
												<s:iterator value="list">
												<li>
													<a href="javascript:void(0);" name="${name}" onclick="choose_power(this)"
													class="${list.size()>0? 'tree-toggle ':''}closed" id="${id}">
														${list.size()>0? '':'&nbsp;&nbsp;'}<i class="${icon}"></i> ${name}
													</a>
													<s:if test="list.size>0">
														<ul class="branch">
															<s:iterator value="list">
															<li>
																<a href="javascript:void(0);" name="${name}" onclick="choose_power(this)" id="${id}">
																	&nbsp;&nbsp;<i class="${icon}"></i> ${name}
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
				<div class="span7 form-horizontal form-bordered" id="param_power">
					
					<div class="control-group">
						<label class="control-label">父级权限</label>
						<div class="controls">
							<label>已选择权限:
								<span  style="color:red;" id="cp">顶级权限</span>
								<input type="hidden" id="cpi" name="data.parentId" value="0">
							</label>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">权限名称</label>
						<div class="controls">
							<input type="text" class="m-wrap span12" name="data.name"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">权限URL</label>
						<div class="controls">
							<input type="text" class="m-wrap span12" name="data.url" value="#module=show-developing"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">权限图标</label>
						<div class="controls">
							<input type="text" class="m-wrap span12" name="data.icon" value="icon-asterisk"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">权限类型</label>
						<div class="controls">
							
							<label style="display: inline;" class=".radio-inline" for="m1">
							<input checked style="vertical-align: -1px;" type="radio" id="m1" name="data.menu" value="1">
							 菜单权限
							</label>
							&nbsp;&nbsp;&nbsp;
							<label style="display: inline;" class=".radio-inline" for="m0">
							<input style="vertical-align: -1px;" type="radio" id="m0" name="data.menu" value="0">
							 操作权限
							</label>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">权限索引</label>
						<div class="controls">
							<input type="text" class="m-wrap span12" name="data.ord" value="0"/>
							<label> 权限索引代表权限的顺序，除去顶级菜单权限，其他权限默认为0</label>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">权限简介</label>
						<div class="controls">
							<textarea class="m-wrap span12" name="data.intro" style="height: 100px;"></textarea>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">所属角色</label>
						<div class="controls">
							一个权限可以属于多个角色，这里先默认属于超级管理员角色。
						</div>
					</div>
					
					<div class="form-actions">
						<button class="btn green" onclick="save_power();"><i class="icon-ok"></i> 保存</button>
					</div>
					
				</div>

			</div>

		</div>

	</div>


	
	