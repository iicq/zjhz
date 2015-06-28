
	 //增加replaceAll方法
	 String.prototype.replaceAll = function (oldStr, newStr) {  
		    return this.replace(new RegExp(oldStr, "gm"), newStr);  
	};   

function web(){}

//获取指定name值得提交表单信息，组成json参数，用于ajax提交。
web.formParams = function(_formId) {

    var nodes = $("#" + _formId).find("input[type='text'],input[type='password']" +
    		",input[type='hidden'],input[type='radio']:checked," +
        	"input[type='checkbox']:checked,textarea,select");
    var params = {};
    
    for (var i = 0; i < nodes.length; i++) {
    	
        var e = $(nodes[i]);
        var name = e.attr("name");
        if(name != undefined){
        	 if (params[name] == undefined) {
                 params[name] = e.val();
             } else {
                 params[name] += "|" + e.val();
             }
        }
       
    }
    return params;
};

//提示窗
web.tip = function (_content){

	bootbox.alert(_content, function() {});

};

//带返回的提示窗
web.tip = function (_content,func){

	bootbox.alert(_content,func);

};


//依赖后台的返回值提示。
web.errorTip = function(_case, _code) {
	
    if(_code == -1) { //超时
    	
    	bootbox.alert("连接超时， 请重新登录", function() {});
    	
        location.href = "/";
        
        return;
    }
    var tip = _case[_code];

    bootbox.alert(tip, function() {});
};


//自定义弹窗my
web.myDialog = function (_title,_content,bt1,bt2){
	bootbox.dialog({
		title:_title,
		message:_content,
		buttons:{
			b1:{
			  label: "取消",
		      className: "blue",
		      callback: bt1
			},
			b2:{
			  label: "确定",
		      className: "green",
		      callback: bt2
			}
		}
	});
};



//用于提交
web.loadAction = function (_url,param,func){
    $.ajax({url:_url, type:"post", data: param, 
    	dataType:"json",
    	success: func
    });
};



//加载页面
web.loadHome1 = function (_url,param){
	$.ajax({url:_url, type:"post", data: param, 
    	success: function(data){
    		$("#portlet_tab1").html(data);
    	},
    	error: function(XMLHttpRequest, textStatus, errorThrown){
    		$("#portlet_tab1").html(XMLHttpRequest.responseText);
         }
    });
};
//加载页面
web.loadHome2 = function (_url,param){
	pageParamHome2 = param;
	pageParamHome2["action"] = _url;
	
	$.ajax({url:_url, type:"post", data: param, async: true,
		success: function(data){
			$("#portlet_tab2").html(data);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#portlet_tab2").html(XMLHttpRequest.responseText);
		}
	});
};
//加载页面
web.loadHome3 = function (_url,param){
	$.ajax({url:_url, type:"post", data: param, async: true,
		success: function(data){
			$("#portlet_tab3").html(data);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#portlet_tab3").html(XMLHttpRequest.responseText);
		}
	});
};
//加载页面
web.loadHome4 = function (_url,param){
	$.ajax({url:_url, type:"post", data: param, async: true,
		success: function(data){
			$("#portlet_tab4").html(data);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#portlet_tab4").html(XMLHttpRequest.responseText);
		}
	});
};



//加载页面
web.loadPro1 = function (_url,param){
	$.ajax({url:_url, type:"post", data: param, async: true,
		success: function(data){
			$("#web_index_left_pro1").html(data);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#web_index_left_pro1").html(XMLHttpRequest.responseText);
		}
	});
};

//加载页面
web.loadPro2 = function (_url,param){
	$.ajax({url:_url, type:"post", data: param, 
		success: function(data){
			$("#web_index_left_pro2").html(data);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#web_index_left_pro2").html(XMLHttpRequest.responseText);
		}
	});
};

//加载页面
web.loadPro3 = function (_url,param){
	$.ajax({url:_url, type:"post", data: param, 
		success: function(data){
			$("#web_index_left_pro3").html(data);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#web_index_left_pro3").html(XMLHttpRequest.responseText);
		}
	});
};

//加载页面
web.loadPro4 = function (_url,param){
	$.ajax({url:_url, type:"post", data: param, 
		success: function(data){
			$("#web_index_left_pro4").html(data);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#web_index_left_pro4").html(XMLHttpRequest.responseText);
		}
	});
};



