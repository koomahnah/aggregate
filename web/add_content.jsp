<%@ page import="Internals.AppContext" %>
<%@ page import="Internals.Content" %><%--
  Created by IntelliJ IDEA.
  User: bartek
  Date: 27.12.18
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
    AppContext ctx = AppContext.getInstance();
    ctx.addContent(new Content(request.getParameter("title"),
            request.getParameter("url"),
            request.getParameter("description"),
            ctx.getCurrentUser()));
    response.sendRedirect("index.jsp");
    %>
</body>
</html>
