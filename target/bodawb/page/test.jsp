<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 5/24/17
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- shiro jsp标签-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>你好阿</title>
    <shiro:hasRole name="admin">
        用户[<shiro:principal/>]拥有角色admin<br/>
    </shiro:hasRole>
</head>
<body>

</body>
</html>
