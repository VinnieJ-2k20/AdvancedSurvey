<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Survey - Registration</title>
</head>
<body>
<h3>Welcome to short survey service.</h3>
<form action="/register" method="POST">
    Login: <input type="text" name="login" required><br>
    Password: <input type="password" name="password" required><br>
    E-mail: <input type="email" name="email" required><br>
    <input type="submit" value="Complete registration" />
</form>
</body>
</html>
