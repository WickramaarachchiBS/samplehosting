<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 4/11/2024
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Login</title>
    <!-- CSS -->
    <style>
        /* Importing Google Fonts - Poppins */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            height: 100vh;
            justify-content: center;
            align-items: center;
            padding: 10px;
            background: linear-gradient(135deg, #000000, #000000);   /*bg color*/
        }
        .container {
            max-width: 500px;
            width: 100%;
            background-color: #fff;
            padding: 25px 30px;
            margin: 50px auto;
            border-radius: 5px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
        }
        /* title */
        .container .title {
            font-size: 25px;
            font-weight: 500;
            position: relative;
        }
        .content{
            display: flex;
            justify-content: center;
        }
        .content form .user-details {
            display: flex;
            width: 100%;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px 0 12px 0;
        }
        form .user-details .input-box {
            margin-bottom: 15px;
            width: calc(95%);
        }
        form .input-box span.details {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }
        .user-details .input-box input {
            height: 45px;
            width: 100%;
            outline: none;
            font-size: 16px;
            border-radius: 5px;
            padding-left: 15px;
            border: 1px solid #ccc;
            border-bottom-width: 2px;
            transition: all 0.3s ease;
        }
        .user-details .input-box input:focus,
        .user-details .input-box input:valid {
            border-color: #9b59b6;
        }


        form .category label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        form .button {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            width: 95%;
            height: 45px;
            margin: 35px 0
        }
        form .button input {
            height: 100%;
            width: 100%;
            border-radius: 5px;
            border: none;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: #ff5722;
        }
        form .button input:hover {
            transition: all 0.3s ease;
            background: #ff5722;
        }
        /* Responsive media query code for mobile devices */
        @media(max-width: 584px) {
            .container {
                max-width: 100%;
            }
            form .user-details .input-box {
                margin-bottom: 15px;
                width: 100%;
            }

            .content form .user-details {
                max-height: 300px;
                overflow-y: scroll;
            }
            .user-details::-webkit-scrollbar {
                width: 5px;
            }
        }
        /* Responsive media query code for mobile devices */
        @media(max-width: 459px) {
        }
    </style>
</head>
<body>

<!-- navbar -->
<jsp:include page="navbar.jsp" />

<!-- login form -->
<div class="container">
    <!-- form title -->
    <div class="title">Admin Login</div>
    <div class="content">
        <!-- form -->
        <form class="" action="AdminLoginServlet" method="POST" autocomplete="off">
            <div class="user-details">
                <!-- email -->
                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="email" placeholder="saman@gmail.com" name="adminemail" required>
                </div>
                <!-- password -->
                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="password" placeholder="Password" name="adminpass" required>
                </div>
                <!-- Submit button -->
                <div class="button">
                    <input type="submit" value="submit">
                </div>
                
            </div>
        </form>

    </div>
</div>

</body>
</html>
