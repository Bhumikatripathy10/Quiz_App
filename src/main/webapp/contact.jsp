<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Contact Us | QuizMaster</title>
  <style>
    body {
      font-family: "Poppins", sans-serif;
      background: url('https://images.unsplash.com/photo-1557683304-673a23048d34') no-repeat center center/cover;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .glass-card {
      backdrop-filter: blur(10px);
      background: rgba(255, 255, 255, 0.2);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 0 25px rgba(0,0,0,0.2);
      width: 350px;
      text-align: center;
      color: white;
    }
    input, textarea {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: none;
      border-radius: 10px;
      outline: none;
    }
    button {
      background: #FFD700;
      border: none;
      color: black;
      padding: 10px 20px;
      border-radius: 10px;
      cursor: pointer;
      font-weight: bold;
      transition: 0.3s;
    }
    button:hover { background: #fff; color: #333; }
  </style>
</head>
<body>
  <div class="glass-card">
    <h2>Contact Us 💬</h2>
    <form action="ContactServlet" method="post">
      <input type="text" name="name" placeholder="Your Name" required>
      <input type="email" name="email" placeholder="Your Email" required>
      <textarea name="message" rows="4" placeholder="Your Message" required></textarea>
      <button type="submit">Send</button>
    </form>
  </div>
</body>
</html>
