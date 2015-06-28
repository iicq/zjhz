<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<table>
		<tr>
			<td colspan="2">
				<OBJECT ID="OcxDemoCtrl"CLASSID="CLSID:2E682E81-3FA7-4CE8-90A4-9C3652DA4D5E"></OBJECT>
			<td>
		</tr>
		<tr>
			<td>
				<input type="text" value="Hello World!" id="greetings" />
			</td>
			<td>
				<input type="button" onclick="jscript:ShowGreetings();"value="Show Greetings" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" value="com1" id="rread" />
			</td>
			<td>
				<input type="button" onclick="jscript:rread();" value="读磁卡" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" value="com1" id="wwrite" />
			</td>
			<td>
				<input type="button" onclick="jscript:wwrite();" value="写磁卡" />
			</td>
		</tr>
	</table>
</div>
<script type="text/jscript">
function ShowGreetings()
{
	var oGreetings = document.getElementById("greetings");
	OcxDemoCtrl.Greetings(oGreetings.value);
}

function rread()
{
     var oGreetings = document.getElementById("rread"); 
     alert(oGreetings.value)
    OcxDemoCtrl.R_Rcard(oGreetings.value, 23, 0, 0, 0);
	
	var data1 = OcxDemoCtrl.data1;
	var data2 = OcxDemoCtrl.data2;
	var data3 = OcxDemoCtrl.data3;
	var ret = OcxDemoCtrl.funcRtn;
	
	alert("return value = " + ret + "\r\ndata1=" + data1 + "\r\ndata2=" + data2 + "\r\ndata3=" + data3);
}

function wwrite()
{
     var oGreetings = document.getElementById("wwrite"); 
    OcxDemoCtrl.W_Wcard(oGreetings.value, 23, 0, "222222", "333333");

	var ret = OcxDemoCtrl.funcRtn;
	
	alert("return value = " + ret);
}

</script>
