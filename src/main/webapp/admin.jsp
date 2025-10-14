<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SmartQuiz | Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #764ba2, #667eea);
            color: #fff;
            min-height: 100vh;
            overflow-x: hidden;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
        }
        .dashboard-container {
            margin: 80px auto;
            max-width: 1100px;
            background: rgba(255, 255, 255, 0.95);
            color: #333;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        .admin-header {
            text-align: center;
            margin-bottom: 40px;
        }
        .admin-header h2 {
            font-weight: 700;
            color: #764ba2;
        }
        .card {
            border: none;
            border-radius: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
            background: #f9f9f9;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .card i {
            font-size: 2.5rem;
            color: #764ba2;
            margin-bottom: 15px;
        }
        .btn-custom {
            background-color: #764ba2;
            color: #fff;
            border-radius: 25px;
            font-weight: 600;
            padding: 8px 20px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background-color: #5b3e94;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        .footer {
            background-color: rgba(0,0,0,0.4);
            text-align: center;
            padding: 15px;
            color: #ddd;
            margin-top: 40px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">SmartQuiz Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="home.jsp"><i class="fas fa-home"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Section -->
    <div class="container dashboard-container">
        <div class="admin-header">
            <h2><i class="fas fa-user-shield"></i> Admin Dashboard</h2>
            <p class="text-muted">Manage users, quizzes, and system reports from one place.</p>
        </div>

        <!-- Dashboard Grid -->
        <div class="row g-4">
            <!-- Add Quiz -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <i class="fas fa-plus-circle"></i>
                    <h5>Add / Manage Quizzes</h5>
                    <p>Create new quizzes, edit questions, or manage categories.</p>
                    <a href="AdminServlet?action=addQuiz" class="btn btn-custom">Manage Quizzes</a>
                </div>
            </div>

            <!-- Manage Users -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <i class="fas fa-users-cog"></i>
                    <h5>Manage Users</h5>
                    <p>View, activate, or deactivate user accounts easily.</p>
                    <a href="AdminServlet?action=manageUsers" class="btn btn-custom">User Management</a>
                </div>
            </div>

            <!-- Reports -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <i class="fas fa-file-alt"></i>
                    <h5>Reports & Logs</h5>
                    <p>View user activity logs and generate PDF/Excel reports.</p>
                    <a href="AdminServlet?action=viewReports" class="btn btn-custom">View Reports</a>
                </div>
            </div>

            <!-- Analytics -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <i class="fas fa-chart-line"></i>
                    <h5>Performance Analytics</h5>
                    <p>Analyze user performance trends and quiz success rates.</p>
                    <a href="AdminServlet?action=analytics" class="btn btn-custom">View Analytics</a>
                </div>
            </div>

            <!-- Quiz Categories -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <i class="fas fa-layer-group"></i>
                    <h5>Quiz Categories</h5>
                    <p>Organize quizzes into categories for better accessibility.</p>
                    <a href="AdminServlet?action=manageCategories" class="btn btn-custom">Manage Categories</a>
                </div>
            </div>

            <!-- Feedback / Logs -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <i class="fas fa-comment-dots"></i>
                    <h5>User Feedback</h5>
                    <p>Review feedback and suggestions submitted by users.</p>
                    <a href="AdminServlet?action=viewFeedback" class="btn btn-custom">View Feedback</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional Analytics Preview -->
    <div class="container text-center mt-5">
        <h4 class="fw-bold mb-3">Quick Analytics Snapshot</h4>
        <p>Admins can track quiz participation, user growth, and performance insights in real time.</p>
        <img src="https://cdn-icons-png.flaticon.com/512/553/553416.png" alt="Analytics" width="100">
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; <%= java.time.Year.now() %> SmartQuiz | Admin Control Panel ⚙️
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
