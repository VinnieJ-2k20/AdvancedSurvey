<%@ page import="com.gmail.ptimofejev.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Survey - Account</title>
</head>
<body>
<h3>Welcome to short survey service.</h3>
<% String login = (String) session.getAttribute("user_login"); %>
<% User currentUser = (User) session.getAttribute("user"); %>
<% if(login == null) { %>
You are not supposed to visit this page. Get out and
<a href="/index.jsp">log in.</a>
<% } else { %>
You are currently logged in as
<%=login %> .
<a href="/login?exit=true">Log out</a><br>
<% if (currentUser.isPassed()) { %>
You have already passed the survey.
<a href="/results.jsp">See all results</a>
<% } else { %>
Click <a href="/survey.jsp">here</a> to pass the survey or <a href="/results.jsp">here</a> to see all results<br>
<% } %>
<% } %>
</body>
</html>
