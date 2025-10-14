package com.example.quiz.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.example.quiz.dao.QuizDao;
import com.example.quiz.model.Quiz;

@WebServlet("/addQuiz")
public class AddQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String category = request.getParameter("category");

        Quiz quiz = new Quiz();
        quiz.setTitle(title);
        quiz.setCategory(category);

        QuizDao dao = new QuizDao();
        boolean status = dao.addQuiz(quiz);

        if (status) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            request.setAttribute("error", "Failed to add quiz!");
            RequestDispatcher rd = request.getRequestDispatcher("addQuiz.jsp");
            rd.forward(request, response);
        }
    }
}
