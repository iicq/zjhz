
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head><title>链接超时</title>

</head>
<body>
<script  type="text/javascript">
    alert("连接超时或未登录，请重新登录");
    window.location.href="/";
</script>
</body>
</html>