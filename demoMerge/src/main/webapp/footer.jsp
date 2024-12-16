<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 8/12/2024
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Footer</title>
    <style>
      /* Footer Styling */
      .footer {
        background: #121212;
        color: #fff;
        padding: 20px 0;
      }
      .footer-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        padding: 0 50px;
      }
      .footer-section {
        flex: 1;
        margin: 20px;
        min-width: 250px;
      }
      .footer-section h2 {
        color: #ff9800;
        margin-bottom: 15px;
        font-size: 1.5rem;
      }
      .footer-section p,
      .footer-section ul {
        color: #b0b0b0;
        font-size: 0.9rem;
        line-height: 1.6;
      }
      .footer-section ul li {
        list-style: none;
        margin-bottom: 10px;
      }
      .footer-section ul li a {
        color: #b0b0b0;
        text-decoration: none;
        transition: color 0.3s;
      }
      .footer-section ul li a:hover {
        color: #ff9800;
      }
      /* Latest News Section */
      .news-alert {
        background: #1e1e1e;
        padding: 15px;
        border: 1px solid #333;
        border-radius: 5px;
        max-height: 150px; /* Controls height of the news section */
        overflow-y: auto; /* Enables scrolling for longer news lists */
      }
      .news-alert p {
        color: #b0b0b0;
        font-size: 0.9rem;
        margin-bottom: 10px;
      }
      /* Footer Bottom */
      .footer-bottom {
        text-align: center;
        padding: 10px;
        background: #1e1e1e;
        color: #b0b0b0;
        font-size: 0.9rem;
        border-top: 1px solid #333;
      }
    </style>
</head>
<body>
<!-- footer -->
<footer class="footer">
  <div class="footer-container">
    <!-- Logo and About -->
    <div class="footer-section about">
      <h2>Movie Land</h2>
      <p>
        Explore the world of cinema with Movie Land. Your destination for the latest blockbusters, timeless classics, and movie reviews.
      </p>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-youtube"></i></a>
      </div>
    </div>

    <!-- Quick Links -->
    <div class="footer-section links">
      <h2>Quick Links</h2>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="RetrieveAllMovieServlet">Movies</a></li>
        <li><a href="locations.jsp">Locations</a></li>
        <li><a href="about_us.jsp">About Us</a></li>
        <li><a href="contact_us.jsp">Contact Us</a></li>
      </ul>
    </div>

    <!-- Latest News -->
    <div class="footer-section news">
      <h2>Latest News</h2>
      <div class="news-alert">
        <p>🎥 *Avatar 3 Trailer Released!* - Coming to cinemas in 2025.</p>
        <p>🍿 *New Netflix Hits* - Don’t miss the latest binge-worthy series.</p>
        <p>🎬 *Oscars 2024 Nominations* - Check out the top contenders!</p>
      </div>
    </div>

    <!-- Contact Info -->
    <div class="footer-section contact">
      <h2>Contact Us</h2>
      <p><i class="fas fa-phone"></i> +1 234 567 890</p>
      <p><i class="fas fa-envelope"></i> support@movieland.com</p>
      <p><i class="fas fa-map-marker-alt"></i> 123 Movie Lane, Film City, CA</p>
    </div>
  </div>
  <div class="footer-bottom">
    <p>&copy; 2024 Movie Land | Designed by VS</p>
    <a href="seatbooking.jsp">Seat booking</a>
    <a href="pay_confirm.jsp">admin</a>
    <a href="feedback.jsp">feedback</a>
  </div>
</footer>
</body>
</html>
