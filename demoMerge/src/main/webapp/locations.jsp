<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 8/12/2024
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Movie Land - Locations</title>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- css -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap');
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --background-gradient-1: #000a1d;
            --background-gradient-2: #000000;
            --text-color: #ecf0f1;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', sans-serif;
            background: black;
            color: var(--text-color);
            min-height: 100vh;
            line-height: 1.6;
            opacity: 0; /* Initial state: invisible */
            animation: fadeIn 1s ease-in-out forwards; /* Apply fade-in animation */
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .cardArea {
            padding: 50px 0;
            background: transparent;
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
        }
        .header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--text-color);
            position: relative;
            display: inline-block;
        }
        .header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: #ea861a;
            border-radius: 2px;
        }
        .wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        .map-container {
            display: flex;
            justify-content: center;
            margin: 50px 0 50px 0;
            height: auto;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- navbar -->
<jsp:include page="navbar.jsp" />

<div class="cardArea">
    <div class="header">
        <h2>LOCATIONS</h2>
    </div>
    <div class="wrapper">

        <div class="container text-center">
            <div class="row align-items-start">
                <div class="col">
                    <b><div style="color: #ea861a">Cinemax 3D Cinema</div></b>
                    Negombo - Colombo Main Rd,<br>
                    Ja-Ela 11350,<br>
                    Sri Lanka <br>
                    +94 117 549 650

                </div>
                <div class="col">
                    <b><div style="color: #ea861a">Liberty by Scope Cinemas</div></b>
                    G-3 Udeshi City Shopping Complex, <br>
                    Makola Rd, Kiribathgoda, <br>
                    Sri Lanka <br>
                    +94 112 269 005

                </div>
                <div class="col">
                    <b><div style="color: #ea861a">Regal Cinemas</div></b>
                    44 Dr Danister De Silva Mawatha, <br>
                    Colombo 00900, <br>
                    Sri Lanka <br>
                    +94 72 353 5430

                </div>
            </div>
        </div>
    </div>

    <div class="map-container">
        <iframe
                src="https://www.google.com/maps/d/u/0/embed?mid=1Xbmy3LvLivZCCBQW1Z2TNJw2esqq7us&ehbc=2E312F&noprof=1"
                width="90%"
                height="450"
                style="border:2px solid #ea861a; box-shadow: 2px 2px 4px #797979; border-radius: 4px;"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
        </iframe>
    </div>
</div>

<jsp:include page="footer.jsp" />

<!-- script to load the page smoothly -->



</body>
</html>
