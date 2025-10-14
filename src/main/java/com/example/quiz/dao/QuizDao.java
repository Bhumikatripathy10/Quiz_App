package com.example.quiz.dao;

import java.sql.*;
import java.util.*;
import com.example.quiz.model.Quiz;
import com.example.quiz.util.DBConnection;

public class QuizDao {

    // Get all quizzes
    public List<Quiz> getAllQuizzes() {
        List<Quiz> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM quiz";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Quiz q = new Quiz();
                q.setId(rs.getInt("id"));
                q.setTitle(rs.getString("title"));
                q.setCategory(rs.getString("category"));
                list.add(q);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Add quiz
    public boolean addQuiz(Quiz quiz) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO quiz(title, category) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, quiz.getTitle());
            ps.setString(2, quiz.getCategory());
            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
