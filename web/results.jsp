<%@ page import="com.gmail.ptimofejev.User" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.gmail.ptimofejev.UserList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Survey results</title>
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
You have already passed the survey.<br>
<% } else { %>
Click <a href="/survey.jsp">here</a> to pass the survey<br>
<% } %>
<table border="1"><caption>Here are the survey results for all users</caption>
    <tr>
        <th align="center">Login</th>
        <th align="center">Name</th>
        <th align="center">Surname</th>
        <th align="center">Age</th>
        <th align="center">Gender</th>
        <th align="center">Driver license</th>
    </tr>
<% Set<String> keySet = UserList.getUserList().keySet(); %>
<% for (String key : keySet) { %>
    <% User thisUser = UserList.getUserList().get(key); %>
<% if (thisUser.isPassed()) { %>
    <tr><td align="center"><%= thisUser.getLogin()%></td>
        <td align="center"><%= thisUser.getName()%></td>
        <td align="center"><%= thisUser.getSurname()%></td>
        <td align="center"><%= Integer.toString(thisUser.getAge()) %></td>
        <td align="center"><%= thisUser.getGender()%></td>
        <% if (thisUser.isDriver()) {%>
        <td align="center">Yes</td>
        <% } else { %>
        <td align="center">No</td>
        <% } %>
    </tr>
<% } %>
<% } %>
</table>
<% } %>
</body>
</html>
