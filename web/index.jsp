<%@ page import="Internals.User" %>
<%@ page import="Internals.AppContext" %>
<%@ page import="Internals.Content" %><%--
  Created by IntelliJ IDEA.
  Internals.User: bartek
  Date: 27.12.18
  Time: 08:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>aggregate</title>
    <link rel="stylesheet" type="text/css" media="screen" href="styles.css"/>
</head>
<body>
<%
    java.util.Date date = new java.util.Date();
    AppContext ctx = AppContext.getInstance();
    User u = ctx.getCurrentUser();
%>
  <div id="header">
    <h1><a href=""><span id="title">aggregat<span id="title2">e</span></span></a></h1>
<% if (ctx.getCurrentUser() == null) {%>
    <ul>
      <li>want to <span id="projects" onclick="openRegisterForm()">register</span> or <span id="github" onclick="openLoginForm()">log in</span>?</li>
    </ul>
<% } %>

    <form method="post" action="register.jsp" class="form" id="register_form">
      <input size=10 type="text" name="login" placeholder="login"/><br />
      <input size=10 type="password" name="password" placeholder="password"/><br />
      <input type="submit" name="register_button" value="register">
    </form>
    <form method="post" action="register.jsp" class="form" id="login_form">
      <input size=10 type="text" name="login" placeholder="login"/><br />
      <input size=10 type="password" name="password" placeholder="password"/><br />
      <input type="submit" name="login_button" value="login">
    </form>
<% if (ctx.getCurrentUser() != null) {%>
    <ul>
      <li><span id="email" onclick="toggleContentForm()">add content</span></li>
      <li><p> || </p></li>
      <li><span id="logout" style="cursor:pointer" onclick="logout()">logout</span></li>
    </ul>
    <form method="post" action="add_content.jsp" class="form" id="content_form">
      <input size=30 type="text" name="title" placeholder="title"/><br />
      <input size=30 type="text" name="url" placeholder="url"/><br />
      <textarea rows=5 cols=30 name="description" placeholder="description"></textarea></br>
      <input type="submit" name="submit_button" value="submit">
    </form>
    <p></br>
        Welcome, <%=ctx.getCurrentUser().getLogin()%>!
        <% if (ctx.getUsers().size() <= 1) { %>
        No one else is here.
        <% } else {
              for (User e: ctx.getUsers()) {
                  if (e.getLogin().equals(ctx.getCurrentUser().getLogin()))
                      continue;%>
        <%=e.getLogin() %>
        <%    }%>
        also here.
        <% } %>
    </p>
      <% } %>
      <span id="info"></span>
  </div>
  <div id="page">
    <hr/>
    <div id="entries">

        <%
            for (int i = 0; i < ctx.getContents().size(); i++) {
                Content c = ctx.getContents().get(i);
        %>
      <div class="entry">
        <div class="voting">
            <% if (ctx.getCurrentUser() == null || c.hasUserVoted(ctx.getCurrentUser())) {%>
            <center><span style="color:#909090" onclick="vote(<%=i%>)">up</span></center>
            <% } else { %>
            <center><span style="color:#d0d0d0;cursor:pointer" onclick="vote(<%=i%>)"><b>up</b></span></center>
            <% } %>
            <center><h2><%=c.getVotes()%></h2></center>
            <% if (ctx.getCurrentUser() == null || c.hasUserVoted(ctx.getCurrentUser())) {%>
            <center><span style="color:#909090" onclick="downvote(<%=i%>)">down</span></center>
            <% } else { %>
            <center><span style="color:#d0d0d0;cursor:pointer" onclick="downvote(<%=i%>)"><b>down</b></span></center>
            <% } %>
        </div>
        <div class="content">
          <a href="<%=c.getUrl()%>"><h2><%=c.getTitle()%></h2></a>
            <% if (c.getAdder() == null) {%>
            <div class="entryinfo">Added by Daler Menhdi on <%=c.getDateCreated().toString()%></div>
            <% } else { %>
            <div class="entryinfo">Added by <%=c.getAdder().getLogin()%> on <%=c.getDateCreated().toString()%></div>
            <% } %>
          <div class="entrycontent"><%=c.getDescription()%></div>
        </div>
      </div>
        <%
            }
        %>
    </div>
  </div>
  <script>
  function openRegisterForm() {
    closeLoginForm();
    document.getElementById("register_form").style.display = "flex";
  }
  function closeRegisterForm() {
    document.getElementById("register_form").style.display = "none";
  }
  function openLoginForm() {
    closeRegisterForm();
    document.getElementById("login_form").style.display = "flex";
  }
  function closeLoginForm() {
    document.getElementById("login_form").style.display = "none";
  }
  function toggleContentForm() {
    var x = document.getElementById("content_form");
    if (x.style.display === "block")
      x.style.display = "none";
    else
      x.style.display = "block";
  }
  function logout() {
      post("logout.jsp");
  }
  function vote(id) {
      post("vote_content.jsp", {content_id: id, up: "1"})
  }
  function downvote(id) {
      post("vote_content.jsp", {content_id: id, up: "0"})
  }
  <%-- taken from https://stackoverflow.com/questions/133925/javascript-post-request-like-a-form-submit --%>
  function post(path, params, method) {
    method = method || "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
        }
    }

    document.body.appendChild(form);
    form.submit();
}
</script>
</body>
</html>
