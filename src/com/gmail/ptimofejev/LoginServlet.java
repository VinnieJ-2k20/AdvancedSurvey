package com.gmail.ptimofejev;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        try {
            User currentUser = UserList.getUserList().get(login);
            if (currentUser != null && password.hashCode() == currentUser.getPasswordHash()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("user_login", login);
                session.setAttribute("passed_test", currentUser.isPassed());
                session.setAttribute("user", currentUser);
                response.sendRedirect("account.jsp");
                return;
            }
        } catch (NullPointerException e) {
        }

        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String exit = request.getParameter("exit");
        HttpSession session = request.getSession(false);

        if ("exit".equals("true") && (session != null))
            session.removeAttribute("user_login");

        response.sendRedirect("index.jsp");
    }
}
