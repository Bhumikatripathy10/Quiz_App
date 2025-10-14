package com.example.quiz.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.example.quiz.dao.QuestionDao;
import com.example.quiz.model.Question;

@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("quizId"));
        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");

        Question question = new Question();
        question.setQuizId(quizId);
        question.setQuestionText(questionText);
        question.setOptionA(optionA);
        question.setOptionB(optionB);
        question.setOptionC(optionC);
        question.setOptionD(optionD);
        question.setCorrectOption(correctOption);

        QuestionDao dao = new QuestionDao();
        boolean success = dao.addQuestion(question);

        if (success) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            request.setAttribute("error", "Failed to add question!");
            RequestDispatcher rd = request.getRequestDispatcher("addQuestion.jsp");
            rd.forward(request, response);
        }
    }
}
