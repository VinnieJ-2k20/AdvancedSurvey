package com.gmail.ptimofejev;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Register", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User newUser = new User(login, password.hashCode(), email, false);
        UserList.getUserList().put(login, newUser);

        HttpSession session = request.getSession(true);
        session.setAttribute("user_login", login);
        session.setAttribute("passed_test", newUser.isPassed());
        session.setAttribute("user", newUser);
        response.sendRedirect("account.jsp");
    }
}
