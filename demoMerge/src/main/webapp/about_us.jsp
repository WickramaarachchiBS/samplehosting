<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 9/12/2024
  Time: 12:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Movie Land - About Us</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body, html {
            font-family: 'Montserrat', sans-serif;
            color: #ffffff;
            scroll-behavior: smooth;
            background: linear-gradient(135deg, #000000 0%, #000000 100%);
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .parallax-container {
            position: relative;
            height: auto;
            overflow: hidden;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)) , url('Assets/aboutusImages/dark-vip-cinema-studio-still-life.jpg') no-repeat center center;
            background-size: cover;
            background-attachment: fixed;
        }
        .content {
            position: relative;
            z-index: 1;
            max-width: 800px;
            margin: 0 auto;
            padding: 4rem 2rem;
            text-align: center;
        }
        .content h1 {
            font-size: 3.5rem;
            color: #ea861a;
            margin-bottom: 2rem;
            font-weight: 700;
        }
        .content p {
            font-size: 1.1rem;
            color: #ddd;
            margin-bottom: 1.5rem;
            text-align: justify;
            line-height: 1.6;
        }
        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }
        .btn {
            display: inline-block;
            padding: 0.8rem 2rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary {
            background-color: #ffaf00;
            color: #000000;
        }
        .btn-primary:hover {
            background-color: #ecb036;
            border-radius: 50px;
        }
        .team-section {
            padding: 4rem 2rem;
            text-align: center;
            border-top: 2px solid #ea861a;
        }
        .team-section h2 {
            color: #ffffff;
            margin-bottom: 2rem;
            font-size: 2.5rem;
        }
        .team-members {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
        }
        .team-member {
            text-align: center;
            max-width: 200px;
        }
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #b7b7b7;
            margin-bottom: 1rem;
            transition: transform 0.3s ease;
        }
        .team-member img:hover {
            transform: scale(1.1);

        }
        .team-member h3 {
            color: #ddd;
            margin-bottom: 0.5rem;
        }
        .team-member p {
            color: #999;
            font-size: 0.9rem;
        }
        .team-member a:hover {
            background-color: transparent;
        }
        @media (max-width: 768px) {
            .content {
                padding: 2rem 1rem;
            }
            .content h1 {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- navbar -->
    <jsp:include page="navbar.jsp" />


    <div class="parallax-container">
        <div class="content">
            <h1>About Movie Land</h1>
            <p>Movie Land is more than just a ticket booking platform — it's a digital gateway to cinematic experiences crafted by passionate software engineering students from NSBM Green University.</p>

            <p>Our mission is to transform how you discover, select, and enjoy movies. We've built an intuitive, user-friendly platform that brings the magic of cinema right to your fingertips, eliminating the hassles of traditional ticket booking.</p>

            <p>With real-time movie updates, seamless booking, and a deep understanding of what movie lovers want, we're not just selling tickets — we're curating experiences.</p>

            <div class="cta-buttons">
                <a href="#" class="btn btn-primary">Contact Us</a>
            </div>
        </div>
    </div>

    <div class="team-section">
        <h2><u>Our Team</u></h2>
        <div class="team-members">

            <div class="team-member">
                <a href="https://www.linkedin.com/in/banuka-wickramaarachchi-3a9117256/" target="_blank">
                    <img src="Assets/aboutusImages/banuka.jpeg" alt="Team Member 1">
                </a>
                <h3>Wickramaarachchi B S</h3>
                <p>Project Lead / Backend Developer</p>
            </div>
            <div class="team-member">
                <a href="https://www.linkedin.com/in/dilith-thiyanga-karunarathane-79562b1a6?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app" target="_blank">
                    <img src="Assets/aboutusImages/dilith.jpeg" alt="Team Member 2">
                </a>
                <h3>Galketi Karunarathne</h3>
                <p>Lead Developer</p>
            </div>
            <div class="team-member">
                <a href="#" target="">
                    <img src="Assets/aboutusImages/no_image.webp" alt="Team Member 3">
                </a>
                <h3>Satharasingha Sathsarani</h3>
                <p>UI/UX Designer / Backend Developer</p>
            </div>
            <div class="team-member">
                <a href="https://www.linkedin.com/in/rashmila-jayaweera-8b3593266?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app" target="_blank">
                    <img src="Assets/aboutusImages/no_image.webp" alt="Team Member 4">
                </a>
                <h3>Hingurage Jayaweera</h3>
                <p>Front-end Developer</p>
            </div>
            <div class="team-member">
                <a href="https://www.linkedin.com/in/ashirudilmin87?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app" target="_blank">
                    <img src="Assets/aboutusImages/ashiru.jpeg" alt="Team Member 5">
                </a>
                <h3>Hetti Silva</h3>
                <p>Front-end Developer</p>
            </div>
            <div class="team-member">
                <a href="https://www.linkedin.com/in/banuka-wickramaarachchi-3a9117256/" target="_blank">
                    <img src="Assets/aboutusImages/no_image.webp" alt="Team Member 6">
                </a>
                <h3>Marasinghage Marasinghe</h3>
                <p>Front-end Developer</p>
            </div>
            <div class="team-member">
                <a href="https://www.linkedin.com/in/muditha-sewmini-417a0b2b5?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app" target="_blank">
                    <img src="Assets/aboutusImages/muditha.jpeg" alt="Team Member 7">
                </a>
                <h3>Kankanam Diwyanjalee</h3>
                <p>Front-end Developer</p>
            </div>
            <div class="team-member">
                <a href="" target="">
                    <img src="Assets/aboutusImages/no_image.webp" alt="Team Member 8">
                </a>
                <h3>Herath Jayathilaka</h3>
                <p>Front-end Developer</p>
            </div>

        </div>
    </div>

    <!-- footer -->
    <jsp:include page="footer.jsp" />


</body>
</html>
