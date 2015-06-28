(function(config){
    config['extendDrag'] = true;		//增强拖拽体验
    config['cache'] = false;				//是否缓存iframe
    config['zIndex'] = "9999";			//层级
    config['lock'] = true;					//锁屏
    config['max'] = false;					//最大化
    config['min'] = false;					//最小化
    config['okVal'] = '确认';				//ok按钮显示文字
    config['cancelVal'] = '取消';		//cancel按钮显示文字

})($.dialog.setting);

//lhgdialog弹窗插件
function art(){}

//提示框
art.tips = function(title,time,icon,func){
	 return $.dialog.tips(title,time,icon,func);
}

//自定义弹窗
art.param = function(param){
	return $.dialog(param);
}

//提醒
art.tip = function(content,func,title){
	return  $.dialog({
		title:title == undefined ? "提醒" : title,
	    content: content,
	    ok: func == undefined ? true : func,
	    okVal:"关闭"
	});
}

//简单弹窗
art.dialog = function(title,content,func,param){
	var dialog = $.dialog({
			title:title,
		    content: content,
		    ok: func,
		    cancel: true /*为true等价于function(){}*/
		});
	if(param != undefined){

		//出现时间（整数，单位：秒）
		if(param["time"] != undefined){
			dialog.time(param["time"],param["timeCallback"]);
		}
		//是否锁屏 boolean
		if(param["lock"] != undefined){
			param["lock"] == true ? dialog.lock() : dialog.unlock();
		}

		if(param["focus"] != undefined){
			dialog.focus();
		}
		//自定义按钮:[{nama:"",callback:function(){},focus:true,disabled:true},{}]
		if(param["button"] != undefined){
			dialog.button(param["button"]);
		}
	}
	return dialog;
}
