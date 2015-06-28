function tools(){}

//获取指定name值得提交表单信息，组成json参数，用于ajax提交。
tools.formParams = function(_formId) {

    var nodes = $("#" + _formId).find("input[type='text'],input[type='password']" +
    		",input[type='hidden'],input[type='radio']:checked," +
        	"input[type='checkbox']:checked,textarea,select");
    var params = {};
    
    for (var i = 0; i < nodes.length; i++) {
    	
        var e = $(nodes[i]);
        var name = e.attr("name");
        if(name != undefined){
        	 if (params[name] == undefined) {
        		 console.log("获取到表单："+name+"   表单值："+e.val());
                 params[name] = e.val();
             } else {
                 params[name] += "|" + e.val();
             }
        }
       
    }
    console.log(params);
    return params;
};

//提示窗
tools.tip = function (_content){

	bootbox.alert(_content, function() {});

};

//带返回的提示窗
tools.tip = function (_content,func){

	bootbox.alert(_content,func);

};

//依赖后台的返回值提示。
tools.errorTip = function(_case, _code) {
	
    var tip = _case[_code];

    bootbox.alert(tip, function() {});
};

//依赖后台的返回值提示。
tools.adminErrorTip = function(_case, _code) {
	
    if(_code == -1) { //超时
    	
    	bootbox.alert("连接超时， 请重新登录", function() {});
    	
        location.href = "/";
        
        return;
    }
    var tip = _case[_code];

    bootbox.alert(tip, function() {});
};


//加载指定url的返回值
tools.load = function(_url){
    $.ajax({url:_url, type:"post", data: null, 
    	success: function(datas){
    		nowDiv.html(datas);
    	},
    	error: function(XMLHttpRequest, textStatus, errorThrown){
    		nowDiv.html(XMLHttpRequest.responseText);
    		
         }
    });
};

//加载并且传递参数 获取指定url的返回值
tools.loadParam = function(_url,param){
    $.ajax({url:_url, type:"post", data: param, 
    	success: function(datas){
    		nowDiv.html(datas);
    	},
    	error: function(XMLHttpRequest, textStatus, errorThrown){
    		nowDiv.html(XMLHttpRequest.responseText);
         }
    });
};
//用于提交
tools.loadAction = function (_url,param,func){
    $.ajax({url:_url, type:"post", data: param, 
    	dataType:"json",
    	success: func,
    	error: function(XMLHttpRequest, textStatus, errorThrown){
    		nowDiv.html(XMLHttpRequest.responseText);
         }
    });
};

//执行action， 但是不执行任何返回操作
tools.toAction = function(_url){
    $.ajax({url:_url, type:"post", data: null, 
    	success: function(datas){
    		
    	},
    	error: function(XMLHttpRequest, textStatus, errorThrown){
    		nowDiv.html(XMLHttpRequest.responseText);
    		
         }
    });
};


//执行action，可以加一条提示语  但是不执行任何返回操作
tools.toAction = function(_url,_content){
	$.ajax({url:_url, type:"post", data: null, 
		success: function(datas){
			bootbox.alert(_content, function() {});
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			nowDiv.html(XMLHttpRequest.responseText);
			
		}
	});
};

//确认框 函数要保留一个默认值，为判断TRUE、FALSE 
tools.confirm = function(_title,func){
	bootbox.confirm(_title,func); 
};

//弹窗
tools.dialog = function(option){
	bootbox.dialog(option);
};

//自定义弹窗my
tools.myDialog = function (_title,_content,bt1,bt2){
	bootbox.dialog({
		title:_title,
		message:_content,
		buttons:{
			b1:{
			  label: "取消",
		      className: "btn-primary",
		      callback: bt1
			},
			b2:{
			  label: "确定",
		      className: "btn-success",
		      callback: bt2
			}
		}
	});
};

//自定义弹窗my
tools.okDialog = function (_title,_content,bt1){
	bootbox.dialog({
		title:_title,
		message:_content,
		buttons:{
			b1:{
			  label: "OK",
		      className: "btn-success",
		      callback: bt1
			}
		}
	});
};

/**
 * 添加日志，存入后台数据库。
 * @param content
 */
tools.addLog = function(content){
	tools.loadAction("save_log", {"data.content":content}, function(data){
		
	});
}