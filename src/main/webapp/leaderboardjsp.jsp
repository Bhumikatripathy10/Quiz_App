<%@ page import="java.sql.*,com.example.quiz.util.DBConnection" %>
<html>
<head>
  <title>Leaderboard | QuizMaster</title>
  <style>
    body {
      background: radial-gradient(circle at top, #1b2735 0%, #090a0f 100%);
      font-family: 'Poppins', sans-serif;
      color: #fff;
      text-align: center;
      padding-top: 60px;
    }
    h1 {
      color: #FFD700;
      text-shadow: 0 0 10px #FFD700;
    }
    table {
      margin: 50px auto;
      border-collapse: collapse;
      width: 80%;
      background: rgba(255,255,255,0.05);
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 0 20px rgba(255,255,255,0.1);
    }
    th, td {
      padding: 15px;
      border-bottom: 1px solid rgba(255,255,255,0.1);
    }
    th {
      background: rgba(255,215,0,0.1);
      color: #FFD700;
    }
    tr:hover { background: rgba(255,255,255,0.1); }
  </style>
</head>
<body>
<h1>🏆 QuizMaster Leaderboard</h1>
<table>
<tr><th>Rank</th><th>User</th><th>Quiz</th><th>Score</th><th>Streak</th></tr>
<%
try(Connection conn = DBConnection.getConnection()){
    PreparedStatement ps = conn.prepareStatement(
      "SELECT u.name, q.title, l.score, l.streak FROM leaderboard l JOIN users u ON l.user_id=u.id JOIN quiz q ON l.quiz_id=q.id ORDER BY l.score DESC LIMIT 10");
    ResultSet rs = ps.executeQuery();
    int rank = 1;
    while(rs.next()){
%>
<tr>
  <td><%= rank++ %></td>
  <td><%= rs.getString("name") %></td>
  <td><%= rs.getString("title") %></td>
  <td><%= rs.getInt("score") %></td>
  <td><%= rs.getInt("streak") %></td>
</tr>
<% } } catch(Exception e){ e.printStackTrace(); } %>
</table>
</body>
</html>
