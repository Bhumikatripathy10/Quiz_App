package com.example.quiz.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.example.quiz.dao.UserDao;
import com.example.quiz.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao dao = new UserDao();
        User user = dao.loginUser(email, password);

        response.setContentType("text/html");
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect based on role
            String redirectPage = "userDashboard.jsp"; // default
            if ("admin".equalsIgnoreCase(user.getRole())) {
                redirectPage = "adminDashboard.jsp";
            } else if ("teacher".equalsIgnoreCase(user.getRole())) {
                redirectPage = "teacherDashboard.jsp"; // if you have teacher page
            }

            // Login success alert
            response.getWriter().println("<script>alert('Login Successful!'); window.location='" + redirectPage + "';</script>");
        } else {
            // Invalid login alert
            response.getWriter().println("<script>alert('Invalid Email or Password!'); window.location='login.jsp';</script>");
        }
    }
}
