<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>About | QuizMaster</title>
  <style>
    /* General Reset */
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      color: #fff;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      overflow-x: hidden;
    }

    .hero {
      text-align: center;
      max-width: 900px;
      padding: 60px 20px;
      animation: fadeIn 1s ease-out;
    }

    .hero h1 {
      font-size: 3rem;
      margin-bottom: 20px;
      text-shadow: 0 4px 10px rgba(0,0,0,0.3);
    }

    .hero p {
      font-size: 1.25rem;
      line-height: 1.6;
      color: rgba(255, 255, 255, 0.9);
      margin-bottom: 40px;
    }

    .features {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 25px;
    }

    .card {
      background: rgba(255, 255, 255, 0.15);
      color: #fff;
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 20px;
      padding: 25px;
      width: 270px;
      text-align: center;
      backdrop-filter: blur(8px);
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      animation: slideUp 1s ease;
    }

    .card:hover {
      transform: translateY(-12px) scale(1.03);
      box-shadow: 0 12px 30px rgba(0,0,0,0.25);
    }

    .card h3 {
      font-size: 1.4rem;
      margin-bottom: 10px;
      color: #FFD700;
    }

    .card p {
      font-size: 1rem;
      opacity: 0.9;
    }

    footer {
      margin-top: 60px;
      text-align: center;
      font-size: 0.9rem;
      color: rgba(255,255,255,0.7);
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @keyframes slideUp {
      from { opacity: 0; transform: translateY(40px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 2.3rem;
      }
      .features {
        flex-direction: column;
        align-items: center;
      }
      .card {
        width: 90%;
      }
    }
  </style>
</head>
<body>

  <div class="hero">
    <h1>Welcome to <span style="color:#FFD700;">QuizMaster</span></h1>
    <p>Empowering students and teachers with AI-driven quizzes, adaptive flashcards, and gamified learning experiences for every subject and grade level.</p>

    <div class="features">
      <div class="card">
        <h3>🤖 AI Assistance</h3>
        <p>Auto-generate questions from your notes or uploaded documents using smart AI algorithms.</p>
      </div>
      <div class="card">
        <h3>🏅 Gamification</h3>
        <p>Earn badges, climb the leaderboard, and keep your learning streak alive every day!</p>
      </div>
      <div class="card">
        <h3>📡 Live Mode</h3>
        <p>Teachers host live quizzes, students join instantly with a unique session code.</p>
      </div>
    </div>
  </div>

  <footer>
    © 2025 QuizMaster | Built with ❤️ for smart learners.
  </footer>

</body>
</html>
