<%@ page import="java.util.ArrayList" %>
<%@ page import="Internals.AppContext" %>
<%@ page import="Internals.User" %><%--
  Created by IntelliJ IDEA.
  Internals.User: bartek
  Date: 27.12.18
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="refresh" content="2; URL=index.jsp">
    <link rel="stylesheet" type="text/css" media="screen" href="styles.css"/>

</head>
<body>
<div id="header">
    <h1><a href=""><span id="title">aggregat<span id="title2">e</span></span></a></h1>
    <ul>
        <li>

<%
    AppContext ctx = AppContext.getInstance();
    if (request.getParameter("logout_button") != null) {
        ctx.logout();%>
        Logged you out.</br>
<%
        return;
    }
    if (request.getParameter("login_button") != null) {
        if (ctx.login(request.getParameter("login"), request.getParameter("password"))) {
            %>
            <%=request.getParameter("login")%> logged in!
<%            response.sendRedirect("index.jsp");
              return;
        } else { %>
                Failed to log in!
<%
            return;
        }
    }
    if (ctx.addUser(new User(request.getParameter("login"), request.getParameter("password")))) {
        ctx.login(request.getParameter("login"), request.getParameter("password"));
        response.sendRedirect("index.jsp");
    } else {
%>
        Failed to register!
<%
        return;
    } %>

        </li>
    </ul>
</div>
</body>
</html>
