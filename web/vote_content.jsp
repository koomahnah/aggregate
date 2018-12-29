<%@ page import="Internals.AppContext" %>
<%@ page import="Internals.Content" %><%--
  Created by IntelliJ IDEA.
  User: bartek
  Date: 29.12.18
  Time: 11:18
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
    Integer index = new Integer(request.getParameter("content_id"));
    if (index < ctx.getContents().size())
        if (request.getParameter("up").equals("1"))
            ctx.getContents().get(index).vote(ctx.getCurrentUser());
        else
            ctx.getContents().get(index).downvote(ctx.getCurrentUser());
    response.sendRedirect("index.jsp");
%>

</body>
</html>
