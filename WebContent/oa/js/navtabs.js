$(document).ready(function(){
	//当前页面id
	window.nowTabId = "1";
	//当前页面divid
	window.nowTab = "tab_1";
	//当前页面div对象
	window.nowDiv =  $("#tab_1");

});

/**
 * 点击某个标签页的时候将此页面设置为当前页。
 * @param obj
 */
function tabClick(obj){
	var id = $(obj).find("span").eq(0).attr("id");
	var span = $("#"+id).html();
	if(span != undefined){
		//设置当前标签。
	 setNowTab(id);
	 $(window).scrollTop(0);
	}
}

/**
 * 设置当前标签
 * @param id
 */
function setNowTab(id){
	nowTabId = id;
	nowTab = "tab_"+nowTabId;
	nowDiv =  $("#"+nowTab);
}

/**
 * 添加标签和DIV
 * @param id
 * @param name
 */
function addTab(id,name){
	//创建DOM
	var tabTitle = '<li class="" onclick="tabClick(this)" name="'+name+'"><a href="#tab_'+id+'" data-toggle="tab">'+name+'&nbsp;<span style="margin-top:4px;" onclick="closeTab(this)" id="'+id+'" class="close"></span></a></li>';
	var tabContent = '<div class="tab-pane" id="tab_'+id+'"></div>';
	var tab = $(tabTitle);
	var div = $(tabContent);
	//添加到div
	tab.appendTo($("#tabTitle"));
	div.appendTo($("#tabContent"));
	//设置当前标签。
	setNowTab(id);
}

/**
 * 显示标签，需要标签具有title、url属性
 * @param obj 标签中的this
 */
function showTab(obj){
	//创建id
	var id = new Date().getTime();
	//获取标签名字
	var name = $(obj).attr("title");
	//获取标签内容的url
	var url = $(obj).attr("url");
	//检测重名,如果有，就在重名标签加载传过来的url
    if(checkName(name,url)){
    	return;
    }
	//添加标签
    addTab(id,name);
	//处理url并加载到指定标签
	dealUrl(url,"tab_"+id);
	//设置当前标签为显示
	setNowTabIsShow();
}

/**
 * 在当前页打开分页内容
 * @param url
 */
function pageTab(url){
	dealUrl(url,nowTab);
}

/**
 * 以指定标签名字加载一个指定url的标签，如有重名择显示已有，并重新加载
 * @param url
 * @param name
 */
function loadTab(url,name){
	var id = new Date().getTime();
	//检测重名,如果有，就在重名标签加载此url
    if(checkName(name,url)){
    	return;
    }
    //添加标签
    addTab(id,name);
	//处理url并加载到指定标签
	dealUrl(url,"tab_"+id);
	//设置当前标签为显示
	setNowTabIsShow();
}

/**
 * 检测重名，有重名的就重新加载那个标签，没有就新建。
 * @param name
 * @param url
 * @returns {Boolean}
 */
function checkName(name,url){
	var flag = false;
	var tabTitle = $("#tabTitle");
    tabTitle.find("li").each(function(){
    	var tname = $(this).attr("name");
    	if(tname == name){
    		var id = $(this).find("span").eq(0).attr("id");
    		var div = "tab_"+id;
    		//在指定Id的div加载url
    		dealUrl(url,div);
    		//设置当前标签
    		setNowTab(id);
    		//消除所有选中状态的标签
    		removeOtherActive();
    		//当前选中标签设置为显示。
    		$(this).addClass("active");
    		$("#"+div).addClass("active");
    		flag = true;
    	}
    });
    return flag;
}

/**
 * 移出其他拥有active样式的引用
 */
function removeOtherActive(){
	var tabTitle = $("#tabTitle");
	var tabContent = $("#tabContent");
    tabTitle.find("li").each(function(){
    	$(this).removeClass("active");
    });
    tabContent.find("div").each(function(){
    	$(this).removeClass("active");
    });
	
}

/**
 * 设置当前标签为显示
 */
function setNowTabIsShow(){
	//设置当前标签为显示
	removeOtherActive();
	$("#"+nowTabId).parent().parent().addClass("active");
	nowDiv.addClass("active");
}

/**
 * 关闭当前页，并打开上一页
 * @param obj
 */
function closeTab(obj){

	var id = $(obj).attr("id");
	//如果是当前页，移出当前页并设置上一页为当前页
	if(id == nowTabId){
		//设置上一页为当前页
		var prevId = $("#"+id).parent().parent().prev().find("span").eq(0).attr("id");
		//设置当前标签。
		setNowTab(prevId);
		$("#"+id).parent().parent().prev().addClass("active");
		$("#"+id).parent().parent().remove();
		$("#tab_"+id).prev().addClass("active");
		$("#tab_"+id).remove();
		
	}else{
		//如果不是当前页，则直接关闭选择要关闭的页面
		$("#"+id).parent().parent().remove();
		$("#tab_"+id).remove();
	}

}

/**
 * 关闭当前页，并且重新加载一个指定名称指定url的tab，如有重名则在那个标签加载指定url
 * 用于添加页面，完成后跳转
 * @param obj
 */
function reLoadTab(url,name){
	$("#"+nowTabId).parent().parent().remove();
	$("#"+nowTab).remove();
	loadTab(url,name)
}

/**
 * 解析url，并将其加载到指定id的div
 */
function dealUrl(url,div){
	var div = $("#"+div);
	var paramsString = url.substring(1);
    var paramsArray = paramsString.split("&");
    var params = {};
    for(var i = 0; i < paramsArray.length; i++) {
        var tempArray = paramsArray[i].split("=");
        params[tempArray[0]] = tempArray[1];
    }
    if(params["action"] == undefined) {
        var _url = "/oa/" + params["module"] + ".jsp?_t=" + new Date().getTime();
        params["module"] = undefined;
        $.ajax({url:_url, type:"post", data: params, 
        	success: function(datas){
        		div.html(datas);
        	},
        	error: function(XMLHttpRequest, textStatus, errorThrown){
        		div.html(XMLHttpRequest.responseText);
             }
        });
    } else {
        var _actionUrl = "/oa/" + params["action"] + "?_t=" + new Date().getTime();
        params["path"] = "/oa/" + params["module"] + ".jsp";
        params["action"] = undefined;
        params["module"] = undefined;
        $.ajax({url:_actionUrl, type:"post", data: params, 
        	success: function(datas){
        		div.html(datas);
        	},
        	error: function(XMLHttpRequest, textStatus, errorThrown){
        		div.html(XMLHttpRequest.responseText);
             }
        });
    }
}