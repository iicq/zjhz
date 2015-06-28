<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div style="width: 350px; max-height: 500px;overflow: scroll;" >
	<table>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">图片：</label>
			</td>
			<td>
				<div class="fileupload fileupload-new" data-provides="fileupload" style="min-width: 210px;">
					<input type="hidden" value="" name="">
					<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
						<img src="/image/information/bg_select_img.png" alt="">
					</div>
					<div class="fileupload-preview fileupload-exists thumbnail" 
												style="max-width: 200px; max-height: 150px; line-height: 20px;">
					</div>
					<div>
					<span class="btn btn-file">
						<span class="fileupload-new">选择</span>
						<span class="fileupload-exists">更改</span>
						<input type="file" class="default" id="web_info_file_change" name="file" >
					</span>
					<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">移除</a>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<table id = "param_web_info_change" style="width: 100%;">
		
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">位置：</label>
			</td>
			<td width="100">
				<textarea style="width: 200px;" name="infoChange.address" >${dataVO.address }</textarea>
			</td>
		</tr>
		
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">编号：</label>
			</td>
			<td width="100">
				<input type="text" name="infoChange.number" style="width: 200px;" value="${dataVO.number }">
			</td>
		</tr>
		
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">媒体类型：</label>
			</td>
			<td width="100">
				<select  id="select_type_web_info" name="infoChange.typeId" style="width: 214px;">
					<option value="SF" ${dataVO.typeId == "SF" ? "selected" : ""} >三翻</option>
					<option value="WD" ${dataVO.typeId == "WD" ? "selected" : ""} >围挡</option>
					<option value="DX" ${dataVO.typeId == "DX" ? "selected" : ""} >灯箱</option>
					<option value="KQ" ${dataVO.typeId == "KQ" ? "selected" : ""}>跨桥</option>
					<option value="LD" ${dataVO.typeId == "LD" ? "selected" : ""}>楼顶</option>
					<option value="ZSP" ${dataVO.typeId == "ZSP" ? "selected" : ""}>指示牌</option>
					<option value="LED" ${dataVO.typeId == "LED" ? "selected" : ""}>电子屏</option>
					<option value="SFZ" ${dataVO.typeId == "SFZ" ? "selected" : ""}>收费站</option>
					<option value="SM" ${dataVO.typeId == "SM" ? "selected" : ""}>三面立柱</option>
					<option value="LM" ${dataVO.typeId == "LM" ? "selected" : ""} >两面立柱</option>
					<option value="LMD" ${dataVO.typeId == "LMD" ? "selected" : ""}>两面立柱+可对牌</option>
					<option value="SMD" ${dataVO.typeId == "SMD" ? "selected" : ""}>三面立柱+可对牌</option>
					<option value="QT" ${dataVO.typeId == "QT" ? "selected" : ""}>其他</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">信息提供人：</label>
			</td>
			<td width="100">
				<input type="text" name="infoChange.serverName" style="width: 200px;" value="${dataVO.serverName }">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">公司：</label>
			</td>
			<td width="100">
				<input type="text" name="infoChange.serverCompany" style="width: 200px;" value="${dataVO.serverCompany }">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">电话：</label>
			</td>
			<td width="100">
				<input type="text" name="infoChange.serverPhone" style="width: 200px;" value="${dataVO.serverPhone }">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">QQ：</label>
			</td>
			<td width="100">
				<input type="text" name="infoChange.qq" style="width: 200px;" value="${dataVO.qq }">
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">媒体规格：</label>
			</td>
			<td width="100">
				宽：<input type="text" style="width: 30px;" onchange="getSum_infoChange(this);" name="infoChange.width" value="${dataVO.width }" placeholder="0.0米">
				高：<input type="text" style="width: 30px;" onchange="getSum_infoChange(this);" name="infoChange.height" value="${dataVO.height }" placeholder="0.0米">
				面：<input type="text" style="width: 30px;"  onchange="getSum_infoChange(this);" name="infoChange.face" value="${dataVO.face }" placeholder="0.0米">
				<br>
				面积：<input type="text" style="width: 162px;" class="span2" onfocus="getSum_infoChange(this);(this);" name="infoChange.area" value="${dataVO.area }" placeholder="根据规格自动计算">
			</td>
		</tr>

		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">发布价：</label>
			</td>
			<td width="100">
				<input type="text" name="infoChange.publish12" style="width: 150px;margin-bottom: 5px;" value="${dataVO.publish12 }">(万/年)
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">灯光：</label>
			</td>
			<td width="100">
				<input type="radio" name="infoChange.light" value="1" id="info_light_edit1"  ${dataVO.light == 1 ? "checked":""}  style="vertical-align: -3px;">
				<label for="info_light_edit1" style="display: inline;">有</label>
				&nbsp;
				<input type="radio" name="infoChange.light" value="0" id="info_light_edit2"  ${dataVO.light == 0 ? "checked":""}  style="vertical-align: -3px;">
				<label for="info_light_edit2"  style="display: inline;">无</label>
			</td>
		</tr>
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">档期：</label>
			</td>
			<td width="100">
				<input type="radio" name="infoChange.light" value="1" id="info_light_edit1"  ${dataVO.business == 1 ? "checked":""}  style="vertical-align: -3px;">
				<label for="info_light_edit1" style="display: inline;">有</label>
				&nbsp;
				<input type="radio" name="infoChange.light" value="0" id="info_light_edit2"  ${dataVO.business == 0 ? "checked":""}  style="vertical-align: -3px;">
				<label for="info_light_edit2"  style="display: inline;">无</label>
			</td>
		</tr>
		
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">档期日期：</label>
			</td>
			<td width="100">
				<div class="input-append">
					<input type="text"  class="info_dangqi_add" name="infoChange.dangqi" value="${dataVO.dangqi==''?'':session.sessionTools.showTime(dataVO.dangqi,'yyyy-MM-dd')}" style="width: 145px;" >
					<span class="add-on" style="padding-bottom: 2px;padding-top: 2px;" onclick="$(this).parent().find('input[type=text]').val('')"><i class="icon-remove"></i></span>
					<span class="add-on" style="padding-bottom: 2px;padding-top: 2px;" onclick="$(this).parent().find('input[type=text]').focus()"><i class="icon-calendar"></i></span>
				</div>
			</td>
		</tr>
		
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">腾讯街景连接：</label>
			</td>
			<td width="100">
				<input type="text" name="infoChange.url" value="${dataVO.url }" style="width: 200px;">
			</td>
		</tr>
		
		<tr>
			<td width="100">
				<label style="vertical-align: middle;text-align: left;">备注：</label>
			</td>
			<td width="100">
				<textarea style="width: 200px;" name="infoChange.intro" ></textarea>
			</td>
		</tr>
	</table>
</div>

<script>
$(document).ready(function(){

	 $(".info_dangqi_add").datepicker();
});



/**
 * 上传info
 */
function infoChanged(){
	var param = web.formParams("param_web_info_change");
	param["infoChange.infoId"] = "${dataVO.id}";
	if(param["infoChange.publish12"]==""){
		param["infoChange.publish12"] = "0.0";
	}

	if(param["infoChange.dangqi"] != ""){
		try{
			param["infoChange.dangqi"] = new Date(param["infoChange.dangqi"]).getTime();
		}catch (e) {
			art.tips("档期格式不正确！",2,"error.gif");
			return false;
		}
	}

	
	param["simg.date"] = "";
	param["simg.clientTypeId"] = "";
	param["simg.content"] = "";
	param["simg.status"] = "8";
	param["simg.defaultImage"] = "1";
	
	art.tips("上传中。。。",30,"loading.gif");

	 $.ajaxFileUpload({
         url:'changeSave_info',            			 		//需要链接到服务器地址
         data:param,											 	//参数
         fileElementId:"web_info_file_change",        		 	//文件选择框的id属性
         dataType: 'json',                                    	//服务器返回的格式，可以是json
         success: function (data, status){
        	 art.tips("上传成功",1,"success.gif");
        	 
         },
         error: function (data, status, e){
        	console.log("ajax_error : "+fileId);
         }
     });
}


//自动计算面积
function getSum_infoChange(obj){
	var width = $(obj).parent().find("input[name='data.width']").eq(0).val();
	var height = $(obj).parent().find("input[name='data.height']").eq(0).val();
	var face = $(obj).parent().find("input[name='data.face']").eq(0).val();
	var area = $(obj).parent().find("input[name='data.area']").eq(0);
	try {
		var a = parseFloat(width).toFixed(2);
		var b = parseFloat(height).toFixed(2);
		var c = parseFloat(face).toFixed(2);
		var d = parseFloat(a*b*c).toFixed(2);
		area.val(d);
	} catch (e) {}
}


</script>