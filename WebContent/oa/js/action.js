//--- 全局变量
var lisize;		//统计有多少个li 全局变量
var licount = 0;//统计进行了多少个li 全局变量

/**
 * 角色添加
 */
function save_role(){
	var param = tools.formParams("param_role");
	tools.loadAction("save_role",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=role-list&action=list_role&index=1&size=10","角色列表");
			});
		}else{
			var _case = {1:"已经拥有同名角色，角色不能重名"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 更改角色信息
 */
function update_role_edit(){
	var param = tools.formParams("param_role_edit");
	tools.loadAction("update_role",param,function(data){
		if(data.success){
			tools.tip("更改成功",function(){
				reLoadTab("#module=role-list&action=list_role&index=1&size=10","角色列表");
			});
		}else{
			var _case = {1:"删除失败，数据异常，请联系管理员。"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 获取管理员数据
 */
function getData_admin(){
    if($("#dname").val() == null || $("#dname").val().replace(/\s/g,"") == ""){
    	tools.tip("请输入员工姓名！");
    	return;
    }
	var name = $("#dname").val();
	tools.loadAction("findByNameToJson_admin", {"data.name":name}, function(data){

		if(data != null){
			if(data.username != undefined){
				tools.tip("此员工已经分配账号，无需再次分配。");
				return;
			}
			$("#dcard").val(data.card);
			$("#dphone").val(data.phone);
			$("#aid").val(data.accountId);
		}else{
			tools.tip("没有找到此员工，请检查用户姓名是否输入正确");
		}
	})
}

/**
 * 管理员添加
 */
function save_admin(){
	
	var param = tools.formParams("param_admin");
    if(param["account.username"] == null || param["account.username"].replace(/\s/g,"") == ""){
    	tools.tip("请输入用户名！");
    	return;
    }
    if(param["account.password"] == null || param["account.password"].replace(/\s/g,"") == ""){
    	tools.tip("请输入密码！");
    	return;
    }
 	if($("#password").val() == null || param["account.password"] != $("#password").val()){
 		tools.tip("两次密码输入不一致，请重新输入！");
    	return;
 	}
    if($("#dname").val() == null || $("#dname").val().replace(/\s/g,"") == ""){
    	tools.tip("请输入员工姓名！");
    	return;
    }
    param["account.password"] = hex_md5(param["account.password"]);
    
	tools.loadAction("save_admin",param,function(data){
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

/**
 * 更改管理员信息
 */
function update_admin_edit(){
	var param = tools.formParams("param_admin_edit");
	
    if(param["account.password"] == null || param["account.password"].replace(/\s/g,"") == ""){
    	tools.tip("请输入密码！");
    	return;
    }
 	if($("#password_admin_edit").val() == null || param["account.password"] != $("#password_admin_edit").val()){
 		tools.tip("两次密码输入不一致，请重新输入！");
    	return;
 	}
    param["account.password"] = hex_md5(param["account.password"]);
	
	
	tools.loadAction("update_admin",param,function(data){
		if(data.success){
			tools.tip("更改成功",function(){
				reLoadTab("#module=admin-list&action=list_admin&index=1&size=10&dataVO.username=","管理员列表");
			});
		}else{
			var _case = {1:"数据异常，请联系管理员。"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 添加权限
 */
function save_power(){
	var param = tools.formParams("param_power");
	tools.loadAction("save_power",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=power-list&action=list_power&data.parentId=0&index=1&size=10","权限列表");
			});
		}else{
			var _case = {1:"已经拥有同名权限，权限不能重名"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 展开权限列表
 * @param obj
 * @returns {Boolean}
 */
function choose_power(obj){
	
	$("#cp").text($(obj).attr("name"));
	$("#cpi").val($(obj).attr("id"));
	$(obj).next("ul").toggleClass("in");
	$(obj).toggleClass("closed");
	return false;
}

/**
 * 更改权限信息
 */
function update_power(){
	var param = tools.formParams("param_power_edit");
	tools.loadAction("update_power",param,function(data){
		if(data.success){
			tools.tip("更改成功",function(){
				reLoadTab("#module=power-list&action=list_power&data.parentId=0&index=1&size=10","权限列表");
			});
		}else{
			var _case = {1:"数据异常，请联系管理员。"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 添加员工信息
 */
function save_staff(){
	
	var param = tools.formParams("param_staff");
    if(param["data.name"] == null || param["data.name"].replace(/\s/g,"") == ""){
    	tools.tip("请输入员工姓名！");
    	return;
    }
	tools.loadAction("save_staff",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=staff-list&action=list_staff&index=1&size=10&dataVO.username=","员工管理");
			});
		}else{
			var _case = {1:"系统异常，添加失败，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 更改员工信息
 */
function update_staff(){
	var param = tools.formParams("param_staff_edit");
	tools.loadAction("update_staff",param,function(data){
		if(data.success){
			tools.tip("更改成功",function(){
				reLoadTab("#module=staff-list&action=list_staff&index=1&size=10&dataVO.username=","员工管理");
			});
		}else{
			var _case = {1:"数据异常，请联系管理员。"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 添加广告位方位
 */
function save_direction(){
	
	var param = tools.formParams("param_direction");
	tools.loadAction("save_type",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=direction-list&action=list_type&data.type=1&index=1&size=10","方位管理");
			});
		}else{
			var _case = {1:"系统异常，添加失败，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 修改广告位方位
 */
function update_direction(){
	var param = tools.formParams("param_direction_edit");

	tools.loadAction("update_type",param,function(data){
		if(data.success){
			tools.tip("更改成功",function(){
				reLoadTab("#module=direction-list&action=list_type&data.type=1&index=1&size=10","方位管理");
			});
		}else{
			var _case = {1:"数据异常，请联系管理员。"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 添加广告位类型
 */
function save_type(){
	
	var param = tools.formParams("param_type");
	tools.loadAction("save_type",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=type-list&action=list_type&data.type=0&index=1&size=10","广告类型");
			});
		}else{
			var _case = {1:"系统异常，添加失败，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 修改广告位类型
 */
function update_type(){
	var param = tools.formParams("param_type_edit");
	
	tools.loadAction("update_type",param,function(data){
		if(data.success){
			tools.tip("更改成功",function(){
				reLoadTab("#module=type-list&action=list_type&data.type=0&index=1&size=10","广告类型");
			});
		}else{
			var _case = {1:"数据异常，请联系管理员。"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 添加高速公路路段
 */
function save_way(){
	
	var param = tools.formParams("param_way");
	tools.loadAction("save_way",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=way-list&action=list_way&index=1&size=10","路段管理");
			});
		}else{
			var _case = {1:"系统异常，添加失败，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 修改高速公路路段
 */
function update_way(){
	var param = tools.formParams("param_way_edit");
	
	tools.loadAction("update_way",param,function(data){
		if(data.success){
			tools.tip("更改成功",function(){
				reLoadTab("#module=way-list&action=list_way&index=1&size=10","路段管理");
			});
		}else{
			var _case = {1:"数据异常，请联系管理员。"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 添加资料库
 */
function save_info(){
	var imgDiv = $("#param_up_down_img_info_add");
	var lis = imgDiv.find("li[id]");
	lisize = lis.length;
	licount = 0;
	
	var param = tools.formParams("param_info");
	param["data.region"] = district.getRegion();
	/*if(param["data.region"] == ""){
		tools.tip("请选择媒体所在。");
		return;
	}*/
	
	if(param["data.dangqi"] != ""){
		try{
			param["data.dangqi"] = new Date(param["data.dangqi"]).getTime();
		}catch (e) {
			
		}
		
	}
	
	tools.loadAction("save_info",param,function(data){
		if(data.success){
			tools.okDialog("提醒","<div id=\"info_img_upload_title\">数据上传成功，正在上传图片,请稍后 <img src=\"/image/loading2.gif\" alt=''></div>",function(){});
			var imgBase64s = read_xheditor_info_add();
			var imgParam = {};
			imgParam["simg.textId"] = data.data;
			imgParam["simg.status"] = "0";
			imgParam["mapImg"] = imgBase64s;
			tools.loadAction("infoMapImgUpload_info",imgParam,function(imgBackdata){
				if(imgBackdata.success){
					postByTime(data.data,lis);
				}else{
					var _case = {1:"地图图片添加异常"};
					tools.adminErrorTip(_case,imgBackdata.code);
				}
			});
			
			
		}else{
			var _case = {1:"系统异常，添加失败，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 遍历上传图片。
 * @param info_id 媒体id
 * @param lis	需要上传的li
 */
function postByTime(info_id,lis){
	if(lisize == 0){
		$("#info_img_upload_title").html("<div>上传成功 <i class=\"icon-ok\"></i></div>");
		setTimeout(function(){
			$(".bootbox-close-button").eq(0).click();
		},1000);
		return;
	}
	
	var li = lis.eq(licount);
	var lid = li.attr("id");
	var title = li.attr("title");
	if(title != "old"){
		var fileId = "file_"+lid;
		var param = tools.formParams(lid);
		param["simg.textId"] = info_id;
		 $.ajaxFileUpload({
	            url:'infoImgUpload_info',            			 //需要链接到服务器地址
	            data:param,											 	 //参数
	            secureuri:false,										 //是否启用安全提交，默认为false
	            fileElementId:fileId,        					 	 //文件选择框的id属性
	            dataType: 'json',                                    //服务器返回的格式，可以是json
	            success: function (data, status){
	            	licount ++ ;
	        		if(licount < lisize){
	        			postByTime(info_id,lis);
	        		}else{
	        			$("#info_img_upload_title").html("<div>上传成功 <i class=\"icon-ok\"></i></div>");
	        			setTimeout(function(){
	        				$(".bootbox-close-button").eq(0).click();
	        			},1000);
	        		}
	              },
	              error: function (data, status, e){
	            	  console.log("ajax_error : "+fileId);
	              }
	        });
	}
}

/**
 * 修改资料库
 */
function edit_info(){
	var imgDiv = $("#param_up_down_img_info_edit");
	var lis = imgDiv.find("li[id]");
	lisize = lis.length;
	licount = 0;
	
	var param = tools.formParams("param_info_edit");
	param["data.region"] = district.getRegion();
	/*if(param["data.region"] == ""){
		tools.tip("请选择媒体所在。");
		return;
	}*/
	
	if(param["data.dangqi"] != ""){
		try{
			param["data.dangqi"] = new Date(param["data.dangqi"]).getTime();
		}catch (e) {
			
		}
	}
	//tools.tip("省市编号："+param["data.region"]+"     省市名称："+district.getRegionText());

	tools.loadAction("update_info",param,function(data){
		if(data.success){
			tools.okDialog("提醒","<div id=\"info_img_upload_title\">数据上传成功，正在上传图片,请稍后 <img src=\"/image/loading2.gif\" alt=''></div>",function(){});
			var imgBase64s = read_xheditor_info_edit();
			var imgParam = {};
			imgParam["simg.textId"] = data.data;
			imgParam["simg.status"] = "0";
			imgParam["mapImg"] = imgBase64s;
			tools.loadAction("infoMapImgUpload_info",imgParam,function(imgBackdata){
				if(imgBackdata.success){
					postByTime(data.data,lis);
				}else{
					var _case = {1:"地图图片添加异常"};
					tools.adminErrorTip(_case,imgBackdata.code);
				}
			});
			
		}else{
			var _case = {1:"系统异常，添加失败，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 前台用户添加
 */
function save_client(){
	
	var param = tools.formParams("param_client");
    if(param["account.username"] == null || param["account.username"].replace(/\s/g,"") == ""){
    	tools.tip("请输入用户名！");
    	return;
    }
    if(param["account.password"] == null || param["account.password"].replace(/\s/g,"") == ""){
    	tools.tip("请输入密码！");
    	return;
    }
 	if($("#password_client").val() == null || param["account.password"] != $("#password_client").val()){
 		tools.tip("两次密码输入不一致，请重新输入！");
    	return;
 	}
 	
    param["account.password"] = hex_md5(param["account.password"]);
    
	tools.loadAction("save_client",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=client-list&action=list_client&index=1&size=10&dataVO.name=","前台用户管理");
			});
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 更改前台用户信息
 */
function edit_client(){
	var param = tools.formParams("param_client_edit");
	
	tools.loadAction("update_client",param,function(data){
		if(data.success){
			tools.tip("更改成功",function(){
				reLoadTab("#module=client-list&action=list_client&index=1&size=10&dataVO.name=","前台用户管理");
			});
		}else{
			var _case = {1:"数据异常，请联系管理员。"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 客户添加
 */
function save_buyer(){
	
	var param = tools.formParams("param_buyer");
    if(param["data.name"] == null || param["data.name"].replace(/\s/g,"") == ""){
    	tools.tip("请输入用户姓名！");
    	return;
    }
    
	tools.loadAction("save_buyer",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=buyer-list&action=list_buyer&index=1&size=10&dataVO.name=","客户管理");
			});
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 客户编辑
 */
function edit_buyer(){
	
	var param = tools.formParams("param_buyer_edit");
    if(param["data.name"] == null || param["data.name"].replace(/\s/g,"") == ""){
    	tools.tip("请输入用户姓名！");
    	return;
    }
    
	tools.loadAction("update_buyer",param,function(data){
		if(data.success){
			tools.tip("修改成功",function(){
				reLoadTab("#module=buyer-list&action=list_buyer&index=1&size=10&dataVO.name=","客户管理");
			});
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 方案添加
 */
function save_scheme(){
	
	var param = tools.formParams("param_scheme");
    if(param["data.name"] == null || param["data.name"].replace(/\s/g,"") == ""){
    	tools.tip("请输入方案名！");
    	return;
    }
    
	tools.loadAction("save_scheme",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=scheme-list&action=list_scheme&index=1&size=10&dataVO.name=","方案管理");
			});
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 合同添加
 */
function save_agree(){
	var imgDiv = $("#agree_img_agree_add");
	var lis = imgDiv.find("li[id]");
	lisize = lis.length;
	licount = 0;
	
	var param = tools.formParams("param_agree");
    if(param["data.id"] == null || param["data.id"].replace(/\s/g,"") == ""){
    	tools.tip("请输入合同编号！");
    	return;
    }
	if(param["data.begin"] != ""){
		try{
			param["data.begin"] = new Date(param["data.begin"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.drawBegin"] != ""){
		try{
			param["data.drawBegin"] = new Date(param["data.drawBegin"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.drawEnd"] != ""){
		try{
			param["data.drawEnd"] = new Date(param["data.drawEnd"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.end"] != ""){
		try{
			param["data.end"] = new Date(param["data.end"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.changeImg"] != ""){
		try{
			param["data.changeImg"] = new Date(param["data.changeImg"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
    
	tools.loadAction("save_agree",param,function(data){
		if(data.success){
			tools.okDialog("提醒","<div id=\"info_img_upload_title\">数据上传成功，正在上传图片,请稍后 <img src=\"/image/loading2.gif\" alt=''></div>",function(){});
			postByTime(data.data,lis);
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 合同修改
 */
function edit_agree(){
	var imgDiv = $("#agree_img_agree_edit");
	var lis = imgDiv.find("li[id]");
	lisize = lis.length;
	licount = 0;
	
	var param = tools.formParams("param_agree_edit");
	if(param["data.id"] == null || param["data.id"].replace(/\s/g,"") == ""){
		tools.tip("请输入合同编号！");
		return;
	}
	if(param["data.begin"] != ""){
		try{
			param["data.begin"] = new Date(param["data.begin"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.drawBegin"] != ""){
		try{
			param["data.drawBegin"] = new Date(param["data.drawBegin"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.drawEnd"] != ""){
		try{
			param["data.drawEnd"] = new Date(param["data.drawEnd"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.end"] != ""){
		try{
			param["data.end"] = new Date(param["data.end"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.changeImg"] != ""){
		try{
			param["data.changeImg"] = new Date(param["data.changeImg"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	
	tools.loadAction("update_agree",param,function(data){
		if(data.success){
			tools.okDialog("提醒","<div id=\"info_img_upload_title\">数据上传成功，正在上传图片,请稍后 <img src=\"/image/loading2.gif\" alt=''></div>",function(){});
			postByTime(data.data,lis);
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 添加合同续约信息
 */
function save_agreeContinue(){
	var param = tools.formParams("param_agreeContinue");
	
	if(param["data.newTime"] != ""){
		try{
			param["data.newTime"] = new Date(param["data.newTime"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	
	if(param["data.oldTime"] != ""){
		try{
			param["data.oldTime"] = new Date(param["data.oldTime"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	
	tools.loadAction("save_agreeContinue",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=agreeContinue-list&action=list_agreeContinue&index=1&size=10","合同续约管理");
			});
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 更改客户负责人
 */
function change_buyer_admin(){
	var param = tools.formParams("param_buyer_admin_change");
	
	tools.loadAction("changeAdmin_buyer",param,function(data){
		if(data.success){
			tools.tip("转移成功",function(){
				reLoadTab("#module=log-list&action=list_log&index=1&size=10&dataVO.type=35","日志管理");
			});
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}


/**
 * 添加喷绘管理项目
 */
function save_decorate(){
	var param = tools.formParams("param_decorate");
	if(param["data.time1"] != ""){
		try{
			param["data.time1"] = new Date(param["data.time1"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.time2"] != ""){
		try{
			param["data.time2"] = new Date(param["data.time2"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	tools.loadAction("save_decorate",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=decorate-list&action=list_decorate&index=1&size=10","喷绘管理");
			});
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}

/**
 * 编辑喷绘管理
 */
function edit_decorate(){
	var param = tools.formParams("param_decorate_edit");
	if(param["data.time1"] != ""){
		try{
			param["data.time1"] = new Date(param["data.time1"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	if(param["data.time2"] != ""){
		try{
			param["data.time2"] = new Date(param["data.time2"]).getTime();
		}catch (e) {
			console.log("时间转换失败！");
		}
	}
	tools.loadAction("update_decorate",param,function(data){
		if(data.success){
			tools.tip("添加成功",function(){
				reLoadTab("#module=decorate-list&action=list_decorate&index=1&size=10","喷绘管理");
			});
		}else{
			var _case = {1:"系统异常，请联系管理员"};
			tools.adminErrorTip(_case,data.code);
		}
	});
}


