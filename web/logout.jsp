<%@ page import="Internals.AppContext" %><%--
  Created by IntelliJ IDEA.
  User: bartek
  Date: 27.12.18
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% AppContext ctx = AppContext.getInstance();
    ctx.logout();
    response.sendRedirect("index.jsp");
System.out.println("in logout");
%>

</body>
</html>
