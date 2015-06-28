$(document).ready(function (){
	
	//--- 全局变量
	var district;						//	地区选择插件变量声明
	var tempCheckData;			//	临时数据保存选择的checkData
	
	 nowDiv.load("lastList_log?path=home.jsp");	//获取首页信息
	 App.init(); 
	 console.info("欢迎进入Saagood管理系统，");
	 console.info("你想做什么呢~？");
	 
	 //增加replaceAll方法
	 String.prototype.replaceAll = function (oldStr, newStr) {  
		    return this.replace(new RegExp(oldStr, "gm"), newStr);  
	 };   
	
});


/**
 * 检查页面是否有重复Id
 */
function checkWebIds(){

	var tags = document.getElementsByTagName("*"),
	count = tags.length, time, ret = {}, id;
	time = new Date();
	for(var i = 0; i < count; i++){
		id = tags[i].id;
		if(id){
		    if(ret[id]){
		        alert(id + " 用时：" + (new Date() - time));
		        return;
		    }else{
		        ret[id] = true;
		    }
		}
	}
	alert("未找到相同ID");
}


//刷新权限并刷新页面。
function reloadPower(){
	tools.loadAction("/oa/power_login",{},function(data){
		if(data.success){
			tools.tip("刷新成功",function(){
				window.location.reload();
			});
		}else{
			tools.tip("刷新失败，请重新登录");
		}
	});
}

//paginator分页插件通用option配置
/**
 * url:路径，可以带参数
 * index：当前页索引
 * total：总页数
 * size：每页显示条数
 */
function getPaginatorOptions(url,index,total,size){
		//总行数
		var ttotal = parseInt(total);
		//默认大小
		var tsize = parseInt(size);
		//总页数 忽略小数点，取整
		var totalpage = ttotal / tsize;
		//余数
		var mod = ttotal % tsize;
		
		var paginatorOptions = {
				 	//对齐方式
			        alignment:'center',
			        //当前页
			        currentPage:index,
			        //共显示八页
			        numberOfPages:8,
			        //总页数
			        totalPages: totalpage == 0 ? 1 : mod == 0 ? totalpage : totalpage+1,
			        itemTexts: function (type, page, current) {  
			            switch (type) {  
			                case "first":  
			                    return "首页";  
			                case "prev":  
			                    return "上一页";  
			                case "next":  
			                    return "下一页";  
			                case "last":  
			                    return "尾页";  
			                case "page":  
			                    return  page;  
			            }                 
			        },  
			        //url
			        pageUrl: function(type, page, current){
			        	if(current == page){
			        		return "javascript:void(0);";
			        	}
			        	return "javascript:pageTab('"+url+"&index="+page+"&size="+size+"');";
			        },
			        onPageClicked: function (e, originalEvent, type, page) {  
			        	//点击的时候可以干点别的。
			        }
			    };
		 
		 return paginatorOptions;
	}

