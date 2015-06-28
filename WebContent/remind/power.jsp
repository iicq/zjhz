
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head><title>链接超时</title>

</head>
<body>
<script  type="text/javascript">
    alert("权限不足，您不能访问此位置。");
    window.location.href="/oa/index.jsp"
</script>
</body>
</html>