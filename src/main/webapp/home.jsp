<%@ page import="java.util.*, com.example.quiz.model.Quiz" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Portal - Home</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            margin: 0;
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background: rgba(0,0,0,0.2);
            padding: 20px 50px;
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            letter-spacing: 1px;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
        }

        .quiz-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 20px;
            padding: 40px;
            flex-grow: 1;
        }

        .quiz-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(8px);
            border-radius: 20px;
            padding: 25px;
            transition: transform 0.3s, background 0.3s;
            cursor: pointer;
        }

        .quiz-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.25);
        }

        .quiz-title {
            font-size: 1.3rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .quiz-category {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        footer {
            background: rgba(0,0,0,0.3);
            text-align: center;
            padding: 15px;
            font-size: 0.9rem;
        }

        .search-bar {
            text-align: center;
            margin: 20px 0;
        }

        .search-bar input {
            padding: 10px 15px;
            border: none;
            border-radius: 25px;
            width: 280px;
            font-size: 1rem;
            outline: none;
        }

        .no-quizzes {
            text-align: center;
            margin-top: 50px;
            font-size: 1.2rem;
            opacity: 0.8;
        }
    </style>
</head>
<body>

<header>🎯 Welcome to Quiz Portal</header>

<div class="search-bar">
    <input type="text" id="searchBox" placeholder="Search quizzes by title or category...">
</div>

<div class="quiz-container" id="quizContainer">
    <%
        List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizList");
        if (quizzes != null && !quizzes.isEmpty()) {
            for (Quiz q : quizzes) {
    %>
        <div class="quiz-card" onclick="startQuiz('<%= q.getId() %>')">
            <div class="quiz-title"><%= q.getTitle() %></div>
            <div class="quiz-category">Category: <%= q.getCategory() %></div>
        </div>
    <%
            }
        } else {
    %>
        <div class="no-quizzes">No quizzes available right now. Please check back later!</div>
    <%
        }
    %>
</div>

<footer>© 2025 Quiz Portal | Designed with ❤️</footer>

<script>
    // Simple search filter
    const searchBox = document.getElementById('searchBox');
    const quizContainer = document.getElementById('quizContainer');
    searchBox.addEventListener('keyup', function() {
        const searchValue = this.value.toLowerCase();
        const quizzes = quizContainer.getElementsByClassName('quiz-card');
        Array.from(quizzes).forEach(q => {
            const title = q.querySelector('.quiz-title').innerText.toLowerCase();
            const category = q.querySelector('.quiz-category').innerText.toLowerCase();
            q.style.display = (title.includes(searchValue) || category.includes(searchValue)) ? '' : 'none';
        });
    });

    function startQuiz(quizId) {
        // Redirect to quiz start page
        window.location.href = 'startQuiz?id=' + quizId;
    }
</script>

</body>
</html>
