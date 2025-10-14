<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SmartQuiz | Your Quiz Results</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            min-height: 100vh;
        }
        .navbar {
            background-color: rgba(0,0,0,0.3);
            backdrop-filter: blur(10px);
        }
        .result-container {
            background: rgba(255,255,255,0.95);
            color: #333;
            border-radius: 15px;
            padding: 40px;
            max-width: 800px;
            margin: 80px auto;
            box-shadow: 0 5px 25px rgba(0,0,0,0.2);
        }
        .score-circle {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            background: conic-gradient(#764ba2 calc(${score}% * 3.6deg), #eee 0deg);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 2rem;
            font-weight: bold;
            color: #764ba2;
        }
        .result-details {
            text-align: left;
            margin-top: 20px;
        }
        .result-details p {
            margin-bottom: 10px;
            font-size: 1.1rem;
        }
        .btn-custom {
            background-color: #764ba2;
            color: #fff;
            border-radius: 25px;
            padding: 10px 25px;
            transition: all 0.3s;
        }
        .btn-custom:hover {
            background-color: #5b3e94;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        .progress {
            height: 20px;
            border-radius: 10px;
        }
        .progress-bar {
            background-color: #764ba2;
        }
        .icon-large {
            font-size: 3rem;
            color: #764ba2;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand fw-bold" href="home.jsp">SmartQuiz</a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="home.jsp"><i class="fas fa-home"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Result Section -->
    <div class="container">
        <div class="result-container text-center animate__animated animate__fadeIn">
            <i class="fas fa-trophy icon-large mb-3"></i>
            <h2 class="fw-bold">Your Quiz Results</h2>
            <p class="text-muted">Quiz Completed Successfully!</p>

            <!-- Score Display -->
            <div class="score-circle">
                ${score}%
            </div>

            <!-- Result Breakdown -->
            <div class="result-details mt-4">
                <p><strong>Total Questions:</strong> ${totalQuestions}</p>
                <p><strong>Correct Answers:</strong> ${correctAnswers}</p>
                <p><strong>Incorrect Answers:</strong> ${wrongAnswers}</p>
                <p><strong>Accuracy:</strong> ${accuracy}%</p>

                <!-- Progress Visualization -->
                <div class="mt-3">
                    <label>Performance Overview</label>
                    <div class="progress mb-3">
                        <div class="progress-bar" role="progressbar" style="width: ${accuracy}%" aria-valuenow="${accuracy}" aria-valuemin="0" aria-valuemax="100">${accuracy}%</div>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="mt-4">
                <a href="home.jsp" class="btn btn-custom me-2"><i class="fas fa-home"></i> Go to Dashboard</a>
                <a href="history.jsp" class="btn btn-custom me-2"><i class="fas fa-history"></i> View Quiz History</a>
                <a href="downloadReport.jsp?quizId=${quizId}" class="btn btn-custom"><i class="fas fa-file-pdf"></i> Download Report</a>
            </div>
        </div>
    </div>

    <!-- Optional Section: Performance Insights -->
    <div class="container text-center mt-5 mb-5">
        <h4 class="fw-bold mb-3">Performance Insights</h4>
        <p>Keep improving! Analyze your weak areas and try quizzes in other categories to enhance your score trends over time.</p>
    </div>

    <!-- Footer -->
    <footer class="text-center py-3" style="background-color: rgba(0,0,0,0.4);">
        &copy; <%= java.time.Year.now() %> SmartQuiz | Empowering Smart Learning ⚡
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
