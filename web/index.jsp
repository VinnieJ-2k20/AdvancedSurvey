<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Java PRO - Survey</title>
  </head>
  <body>
  <h3>Welcome to short survey service.</h3>
  <form action="/login" method="POST">
    Login: <input type="text" name="login" required><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="Log in" />
  </form>
  <a href="/register.jsp">Register</a>
  </body>
</html>
