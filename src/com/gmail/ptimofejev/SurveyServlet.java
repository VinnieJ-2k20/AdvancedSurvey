package com.gmail.ptimofejev;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Survey", urlPatterns = {"/survey"})
public class SurveyServlet extends HttpServlet {
    public synchronized void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String login = (String)session.getAttribute("user_login");
        User currentUser = UserList.getUserList().get(login);

        currentUser.setName(request.getParameter("name"));
        currentUser.setSurname(request.getParameter("surname"));
        currentUser.setAge(Integer.parseInt(request.getParameter("age")));
        currentUser.setGender(request.getParameter("gender"));
        boolean driver = (request.getParameter("driver") == null);
        if (!driver) {
            currentUser.setDriver(true);
        } else {
            currentUser.setDriver(false);
        }

        currentUser.setPassed(true);

        response.sendRedirect("account.jsp");
    }
}
