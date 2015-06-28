<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
<!--
.gm-style .gm-style-iw {
font-weight: normal;
font-size: 13px;
}
-->
</style>
<!-- 详细信息窗口 -->

<div class="tabbable tabbable-custom boxless" >
		
		<div style="margin-top: 50px;"> 
			<div>
				<div id="myCarousel_showInfo" class="carousel slide">
				  <ol class="carousel-indicators">
				  	 <s:iterator value="dataVO.imgs" status="stu" >
				  		<s:if test="#stu.index==0">
				  			 <li data-target="#myCarousel_showInfo" data-slide-to="<s:property value='#stu.index'/>" class="active"></li>
				  		</s:if>
				  		<s:else>
				  		 	<li data-target="#myCarousel_showInfo" data-slide-to="<s:property value='#stu.index'/>" ></li>
				  		</s:else>
				  	</s:iterator>
				  </ol>
				  <!-- Carousel items -->
				  <div class="carousel-inner" onclick="showImg_home2('${dataVO.id}');" >
				   <s:iterator value="dataVO.imgs" status="stu" >
					    <s:if test="#stu.index==0">
				  			 <div class="active item">
					    		<img src="${url}" alt="媒体图片" style="width: 340px;height: 165px;"/>
					   	 	</div>
				  		</s:if>
				  		<s:else>
				  		 	<div class="item">
					    		<img src="${url}" alt="媒体图片" style="width: 340px;height: 165px;" />
					   	 	</div>
				  		</s:else>
				   </s:iterator>
				  </div>
				  <!-- Carousel nav -->
				  <a class="carousel-control left" href="#myCarousel_showInfo" data-slide="prev">&lsaquo;</a>
				  <a class="carousel-control right" href="#myCarousel_showInfo" data-slide="next">&rsaquo;</a>
				</div>
				
				<table class="table table-bordered table-hover" style="width: 340px;">
					<tbody>
						<tr>
							<td width="40">位置：</td>
							<td>
								<s:property value='dataVO.address'/>
							</td>
						</tr>
						<tr>
							<td>编号：</td>
							<td>	
								<s:property value='dataVO.number'/>
							</td>
						</tr>
						<tr>
							<td>规格：</td>
							<td>
								<s:property value='dataVO.width'/>(宽)*
								<s:property value='dataVO.height'/>(高)*
								<s:property value='dataVO.face'/>(面)
							</td>
						</tr>
						
						<tr>
								<td>灯光：</td>
								<td>
								
									<s:if test="dataVO.light==0">无</s:if><s:else>有</s:else>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									档期：<s:if test="dataVO.business==0">无</s:if><s:else>有</s:else>
								</td>
						</tr>
						
						<tr>
							<td>价格：</td>
							<td>
								<s:if test="dataVO.publish12 != '0.0'">
									<s:property value='dataVO.publish12'/>万/年
								</s:if>
								<s:else>
									<label style="color: blue;font-size: 10px;display: inline;"> 暂无价格信息</label>
								</s:else>
								
								<s:if test="#session.account.power >= 1 || #session.user.level == 1 ">
									<label style="color: blue;font-size: 10px;float: right;" onclick="$(this).parent().parent().next().slideToggle(100);"> 查看广告人信息</label>
								</s:if>
							</td>
						</tr>
						
						<s:if test="#session.account.power >= 1 || #session.user.level == 1 ">
							<tr style="display: none;">
								<td>客户：</td>
								<td>
								联系人：<s:property value='dataVO.serverName'/>
								<br>
								联系公司：<s:property value='dataVO.serverCompany'/>
								<br>
								联系电话：<s:property value='dataVO.serverPhone'/>
								<br>
								<label style="color: blue;font-size: 12px;float: right;" onclick="showChangeDialog('${dataVO.id}');">添&nbsp&nbsp加&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp修&nbsp&nbsp改</label>
								</td>
							</tr>
						</s:if>
						
					</tbody>
				</table>
				
			</div> 
	 </div>
</div>
<script>

/**    
 * 弹窗显示图片
 */
function showImg_home2(id){
	var data = $("<div>").load("find_info?path=/oa/show-mp-infoImgs.jsp&data.id="+id);
	art.param({left:"0%",
		title:"图片查看",
		content:data,
		lock:false});
}
</script>

