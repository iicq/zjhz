<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
		
		<div>
			<div id="param-pro3">
				 <span >推荐方案：</span><input type="text" name="query.infoSchemeName" style="width: 150px;">
			</div>
		</div>

<script>
	function search_fangan(){
		art.tips("正在搜索方案...",100,"loading.gif");
		var param = web.formParams("param-pro3");

		param["index"] = "1";
		param["size"] = "0";
		 
		$.ajax({url:"webIndexMapJson_info", type:"post",async: false,data: param, dataType:"json",
			success: function(data){
				//隐藏全部标记
				visibleMarkers();
				for(var i = 0 ; i < data.length; i++){
					infoMarkers[data[i].id].setVisible(true);
				}
				param["path"] = "home2.jsp";
				param["index"] = "1";
				param["size"] = "10";
				web.loadHome2("webIndexMap_info",param);
				
				showTab(1);
				art.tips("搜索成功，结果已经显示在地图上。",1,"success.gif");
				var count = getMarkerCount();			//获取总数
				setIndexInfoCount(count);				//处理数量
			}
		});
	}
	
</script>