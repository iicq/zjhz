$(document).ready(function (){
	
	 App.init(); 
	
});
var pageParamHome2={};//home2分页参数


/**
 * paginator分页插件通用option配置
 * url:路径，可以带参数
 * index：当前页索引
 * total：总页数
 * size：每页显示条数
 */
function getPaginatorOptionsPro1(url,index,total,size){
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
		        //共显示4页
		        numberOfPages:4,
		        //总页数
		        totalPages: totalpage == 0 ? 1 : mod == 0 ? totalpage : totalpage+1,
		        itemTexts: function (type, page, current) {  
		            switch (type) {  
		                case "first":  
		                    return "首";  
		                case "prev":  
		                    return "上";  
		                case "next":  
		                    return "下";  
		                case "last":  
		                    return "尾";  
		                case "page":  
		                    return  page;  
		            }                 
		        },  
		        //url
		        pageUrl: function(type, page, current){
		        	if(current == page){
		        		return "javascript:void(0);";
		        	}
		        	return "javascript:void(0);";
		        },
		        onPageClicked: function (e, originalEvent, type, page) {  
		        	//点击的时候可以干点别的。
		        	var action = url;
		        	var param = {
		        			path:"pro1.jsp",
		        			index:page,
		        			size:size
		        	};
		            web.loadPro1(action, param);
		        }
		    };
	 
	 return paginatorOptions;
}



	/**
	 * paginator分页插件通用option配置
	 * url:路径，可以带参数
	 * index：当前页索引
	 * total：总页数
	 * size：每页显示条数
	 */
	function getPaginatorOptionsHome2(url,index,total,size){
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
			        	return "javascript:void(0);";
			        },
			        onPageClicked: function (e, originalEvent, type, page) {  
			        	//点击的时候可以干点别的。
			        	var action = url;
			        	var param = {
			        			path:"home2.jsp",
			        			index:page,
			        			size:size
			        	};
			            web.loadHome2(action, param);
			        }
			    };
		 
		 return paginatorOptions;
	}

/**
	 * paginator分页插件通用option配置
	 * url:路径，可以带参数
	 * index：当前页索引
	 * total：总页数
	 * size：每页显示条数
	 */
	function getPaginatorOptionsHome3(url,index,total,size){
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
			        	return "javascript:void(0);";
			        },
			        onPageClicked: function (e, originalEvent, type, page) {  
			        	//点击的时候可以干点别的。
			        	var action = url;
			        	var param = {
			        			path:"home3.jsp",
			        			index:page,
			        			size:size
			        	};
			            web.loadHome3(action, param);
			        }
			    };
		 
		 return paginatorOptions;
	}
	function getPaginatorOptionsHome4(url,index,total,size){
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
			        	return "javascript:void(0);";
			        },
			        onPageClicked: function (e, originalEvent, type, page) {  
			        	//点击的时候可以干点别的。
			        	var action = url;
			        	var param = {
			        			path:"home4.jsp",
			        			index:page,
			        			size:size
			        	};
			            web.loadHome4(action, param);
			        }
			    };
		 
		 return paginatorOptions;
	}
