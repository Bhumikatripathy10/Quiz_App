<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${quiz.title} | SmartQuiz</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: #f8fafc;
            font-family: 'Poppins', sans-serif;
        }
        .quiz-container {
            max-width: 900px;
            margin: 60px auto;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            padding: 40px;
        }
        .timer {
            font-size: 1.3rem;
            font-weight: 600;
            color: #dc3545;
        }
        .question-card {
            border: 1px solid #e0e0e0;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            background: #fdfdfd;
        }
        .btn-submit {
            background: linear-gradient(90deg, #007bff, #00c6ff);
            color: white;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-submit:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="dashboard.jsp">SmartQuiz</a>
        <div class="d-flex">
            <span class="me-3 fw-semibold">Welcome, ${sessionScope.username}</span>
            <a href="LogoutServlet" class="btn btn-outline-danger btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="quiz-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold text-primary">${quiz.title}</h3>
        <div class="timer" id="timer">Time Left: <span id="time">00:00</span></div>
    </div>

    <form action="ResultServlet" method="post" id="quizForm">
        <input type="hidden" name="quizId" value="${quiz.id}"/>

        <!-- Dynamic Question Rendering -->
        <c:forEach var="q" items="${quiz.questions}" varStatus="s">
            <div class="question-card">
                <h5>Q${s.index + 1}. ${q.questionText}</h5>
                <div class="mt-3">
                    <c:forEach var="option" items="${q.options}">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="q${q.id}" value="${option}" required>
                            <label class="form-check-label">${option}</label>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-submit px-5 py-2">Submit Quiz</button>
        </div>
    </form>
</div>

<!-- Timer & Auto Submit Script -->
<script>
    // Example: timer from backend (in seconds)
    let timeLeft = ${quiz.duration}; // e.g., 300 for 5 mins
    const timerDisplay = document.getElementById('time');
    const quizForm = document.getElementById('quizForm');

    function updateTimer() {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        timerDisplay.textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
        if (timeLeft <= 0) {
            Swal.fire({
                icon: 'info',
                title: 'Time Up!',
                text: 'Your quiz will be auto-submitted.',
                timer: 3000,
                showConfirmButton: false
            }).then(() => quizForm.submit());
        } else {
            timeLeft--;
            setTimeout(updateTimer, 1000);
        }
    }

    window.onload = updateTimer;
</script>

</body>
</html>
