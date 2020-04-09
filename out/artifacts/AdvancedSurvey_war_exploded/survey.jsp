<%@ page import="com.gmail.ptimofejev.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Welcome to short survey service.</h3><br>
<% String login = (String) session.getAttribute("user_login"); %>
<% User currentUser = (User) session.getAttribute("user"); %>
<% if(login == null) { %>
You are not supposed to visit this page. Get out and
<a href="/index.jsp">log in.</a>
<% } else { %>
You are currently logged in as
<%=login %> .<br>
<% if (currentUser.isPassed()) { %>
You have already passed the survey.
<a href="/results.jsp">See all results</a>
<% } else { %>
<form action="/survey" method="POST">
    First name: <input type = "text" name = "name" placeholder="Your name" required><br>
    Last name: <input type = "text" name = "surname" placeholder="Your surname" required><br>
    Age: <input type="number" name="age" placeholder="Your age" required><br>
    Gender: <input type="radio" name="gender" value="male" required> Male
    <input type="radio" name="gender" value="female" required> Female<br>
    Do you have driver license? <input type="checkbox" name="driver" value="Yes/No"><br>
    <input type="submit" value="Submit form">
</form>
<% } %>
<% } %>

</body>
</html>
