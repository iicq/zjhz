<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

	<s:iterator value="list">
		<a title="${serverCompany}" onclick="showInfoWindow('${id}');">
			<s:property value="%{serverCompany.length() > 15 ? serverCompany.substring(0,15) + '...' : serverCompany}" />
		</a>
</s:iterator> 


<%-- <p style="text-align: center;">符合条件的媒体有<span style="color: red;"><s:property value="total"/></span>块</p> --%>
<script>
	$(document).ready(function() {
		$('#paginator_pro1').bootstrapPaginator(
				getPaginatorOptionsPro1(
					"webIndexMap_info?query.westX=${query.westX}&query.westY=${query.westY}&query.eastX=${query.eastX}&query.eastY=${query.eastY}",
					"${index}","${total}","${size}"
				)
		 );
		$("#web_index_left_pro1_count").html("${total}");
	});

</script>