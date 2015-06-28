
//移出其他拥有active样式的引用
function removeOthersActive(){
	var tabTitle = $("#tabTitle");
	var tabContent = $("#tabContent");
    tabTitle.find("li.tab-title-class").each(function(){
    	$(this).removeClass("active");
    	$(this).find("li").each(function(){
        	$(this).removeClass("active");
        });
    });
    tabContent.find("div.tab-content-class").each(function(){
    	$(this).removeClass("active");
    });
};


/**
 * 
 * @param data 服务器返回数据
 * @param id tab的id 1 2 3 4
 */
function showTab(id){
	if(id == 1){
		closeInfoWindow();
	}
	removeOthersActive();
	$("#nav-tab-"+id).addClass("active");
	$("#portlet_tab"+id).addClass("active");
};

function pageTabHome2(_url){
	var param = null;
	web.loadHome2(_url, param);
}



