<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
function toBrushStockCard(){
	 alert("请在磁卡读写机灯亮后刷存折");

		tools.loadAction("test_admin",null,function(data){
			if(data.success){
				tools.tip("添加成功",function(){
					reLoadTab("#module=admin-list&action=list_admin&index=1&size=10&dataVO.username=","管理员列表");
				});
			}else{
				var _case = {1:"系统异常，请联系管理员",
							2:"用户名："+param["account.username"]+" 已经被使用，请换一个用户名进行注册。"		
				};
				tools.adminErrorTip(_case,data.code);
			}
		});
}
	 
</script>
<div>
<input type="text" size="30" id="stockNumber" name="stock.currentCard.stockNumber"  onblur="toShowInfo_addCurrentStockUI()" value='<s:property value="stock.stockNumber" />' class="required"  >
					<input type="button" value="刷存折" onclick="toBrushStockCard()">
					<span style="color: red" id="stockNumberError"></span>

</div>