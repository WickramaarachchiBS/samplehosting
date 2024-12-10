<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25/11/2024
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>The Wild Robot - Nero Cinema</title>
    <!-- bootstrap cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- css -->
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            background-color: #000000;
            color: white;
            min-height: 100vh;
            padding: 0;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn{
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .container1 {
            display: flex;
            margin: 50px auto auto auto;
            background-color: rgba(0, 0, 0, 0.48);
            width: 90%;
            max-width: 1400px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 30px;
            gap: 50px;
        }
        .root {
            flex: 0 0 auto;
            display: flex;
            min-height: 500px;
            justify-content: center;
            align-items: center;
        }
        .moviename {
            flex: 1;
            background-color: rgb(0, 0, 0);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.51);
            display: flex;
            flex-direction: column;
            justify-content: center;
            max-width: 900px;
        }
        .img {
            width: 400px;
            height: auto;
            min-height: 500px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }
        h2 {
            color: white;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.1rem;
            line-height: 1.6;
            color: rgba(255, 255, 255, 0.9);
        }
        .now-showing {
            background-color: #ffd700;
            color: black;
            padding: 0px 5px;
            border-radius: 20px;
            display: inline-block;
            margin-bottom: 15px;
            font-weight: bold;
            max-width: 17.813rem;
            width: auto;
        }
        /* button css */
        .button {
            cursor: pointer;
            position: relative;
            padding: 5px 20px;
            font-size: 18px;
            width: 200px;
            color: rgb(214, 211, 27);
            border: 2px solid rgb(220, 233, 37);
            border-radius: 34px;
            background-color: transparent;
            font-weight: 600;
            transition: all 0.5s cubic-bezier(0.23, 1, 0.320, 1);
            overflow: hidden;
        }
        .button::before {
            content: '';
            position: absolute;
            inset: 0;
            margin: auto;
            width: 100px;
            height: 50px;
            border-radius: inherit;
            scale: 0;
            z-index: -1;
            background-color: #e6d929ef;
            transition: all .6s cubic-bezier(0.23, 1, 0.320, 1);
        }
        .button:hover::before {
            scale: 3;
        }
        .button:hover {
            color: #212121;
            scale: 1.1;
            box-shadow: 0 0px 20px rgba(193, 163, 98,0.4);
        }
        .button:active {
            scale: 1;
        }
        .btn {
            color: #e6d929ef;
            border: none;
        }
        .btn:hover {
            color: #212121;
        }
        /* Responsive Design */
        @media (max-width: 1200px) {
            .container1 {
                padding: 20px;
                gap: 30px;
            }
            .img {
                width: 350px;
            }
            .moviename {
                padding: 30px;
            }
        }
        @media (max-width: 992px) {
            .container1 {
                flex-direction: column;
                align-items: center;
            }
            .root {
                width: 100%;
                justify-content: center;
            }
            .moviename {
                width: 100%;
                margin: 0;
            }
            .img {
                width: 300px;
            }
            h2 {
                font-size: 2rem;
            }
        }
        @media (max-width: 480px) {
            body {
                padding: 10px;
            }
            .container1 {
                width: 95%;
                padding: 15px;
            }
            .moviename {
                padding: 20px;
            }
            .img {
                width: 250px;
            }
            h2 {
                font-size: 1.8rem;
            }
            p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
<%--  navbar  --%>
<jsp:include page="navbar.jsp" />
<br>


<div class="container1">
    <div class="root">
        <img src="${pageContext.request.contextPath}/${movie.imagePath}" alt="${movie.title}" class="img">
    </div>

    <div class="moviename">
        <div class="now-showing">NOW SHOWING AT NERO CINEMAS</div>
        <h2><u>${movie.title}</u></h2>
        <p> ${movie.desc}</p> <br>
        <p>Genre: <u>${movie.genre}</u></p>
        <p>Duration: <u>${movie.duration}</u></p>
        <button class="button">
            <a href="${pageContext.request.contextPath}/TimetableServlet?id=${movie.id}" class="btn">Buy Tickets</a>
        </button>

    </div>
</div>
<br><br><br>

<!-- footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
