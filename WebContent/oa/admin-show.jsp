<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
	<div class="tab-pane">

		<div class="portlet box green ">

			<div class="portlet-title">

				<div class="caption"><i class="icon-reorder">
				</i>管理员信息</div>
				
			</div>

			<div class="portlet-body form">
				
				<div class="form-horizontal form-bordered">

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

			</div>

		</div>

	</div>


	
	