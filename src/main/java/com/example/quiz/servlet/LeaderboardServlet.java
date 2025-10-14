package com.example.quiz.servlet;

import com.example.quiz.util.DBConnection;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LeaderboardServlet")
public class LeaderboardServlet extends HttpServlet {

    public static class LeaderboardEntry {
        public int rank;
        public String name;
        public String quizTitle;
        public int score;
        public int streak;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<LeaderboardEntry> leaderboard = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT u.name, q.title, l.score, l.streak " +
                         "FROM leaderboard l " +
                         "JOIN users u ON l.user_id=u.id " +
                         "JOIN quiz q ON l.quiz_id=q.id " +
                         "ORDER BY l.score DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            int rank = 1;
            while (rs.next()) {
                LeaderboardEntry entry = new LeaderboardEntry();
                entry.rank = rank++;
                entry.name = rs.getString("name");
                entry.quizTitle = rs.getString("title");
                entry.score = rs.getInt("score");
                entry.streak = rs.getInt("streak");
                leaderboard.add(entry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("leaderboard", leaderboard);
        RequestDispatcher rd = request.getRequestDispatcher("leaderboard.jsp");
        rd.forward(request, response);
    }
}
