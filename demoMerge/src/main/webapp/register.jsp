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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title> Register </title>
    <!-- CSS -->
    <style>
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
            background:black;
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
        .container {
            max-width: 700px;
            width: 100%;
            background-color: #fff;
            padding: 25px 30px;
            margin: 50px auto;
            border-radius: 5px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
        }
        .container .title {
            font-size: 25px;
            font-weight: 500;
            position: relative;
        }
        .content form .user-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0 12px 0;
        }
        form .user-details .input-box {
            margin-bottom: 15px;
            width: calc(100% / 2 - 20px);
        }
        form .input-box span.details {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }
        .user-details .input-box input {
            height: 45px;
            width:100%;
            outline: none;
            font-size: 16px;
            border-radius: 5px;
            padding-left: 15px;
            border: 1px solid #ccc;
            border-bottom-width: 2px;

        }
        .user-details .input-box input:focus,
        .user-details .input-box input:valid {
            border-color:  #ff5722;
        }
        form .gender-details .gender-title {
            font-size: 16px;
            font-weight: 500;
        }
        form .category {
            display: flex;
            width: 80%;
            margin: 14px;
            justify-content: baseline;
            gap: 50px;
        }
        form .category label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        form .category label .dot {
            height: 18px;
            width: 18px;
            border-radius: 50%;
            margin-right: 10px;
            background: #d9d9d9;
            border: 5px solid transparent;

        }
        #dot-1:checked~.category label .one,
        #dot-2:checked~.category label .two
        {
            background: #ff5722;
            border-color: #d9d9d9;
        }
        form input[type="radio"] {
            display: none;
        }
        form .button {
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
            background: #ff5722;
        }
        @media(max-width: 584px) {
            .container {
                max-width: 100%;
            }
            form .user-details .input-box {
                margin-bottom: 15px;
                width: 100%;
            }
            form .category {
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
        @media(max-width: 459px) {
            .container .content .category {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<%--  navbar  --%>
<jsp:include page="navbar.jsp" />

<div class="container">
    <!-- Title section -->
    <div class="title">Registration</div>
    <div class="content">
        <!-- Registration form -->
        <form action="RegisterServlet" method="post" onsubmit="return validatePasswords()">
            <div class="user-details">
                <!-- Input for Full Name -->
                <div class="input-box">
                    <span class="details">Full Name</span>
                    <input type="text" placeholder="Enter your name" required name="name">
                </div>
                <!-- Input for nic -->
                <div class="input-box">
                    <span class="details">NIC Number</span>
                    <input type="text" placeholder="Enter your nic number" required name="nic">
                </div>
                <!-- Input for Email -->
                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="email" placeholder="Enter your email" required name="email">
                </div>
                <!-- Input for Phone Number -->
                <div class="input-box">
                    <span class="details">Phone Number</span>
                    <input type="tel" placeholder="Enter your phone number" required name="phone" pattern="[0-9]{10}">
                </div>
                <!-- Input for Password -->
                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="password" placeholder="Enter your password" required name="password">
                </div>
                <!-- Input for Confirm Password -->
                <div class="input-box">
                    <span class="details">Confirm Password</span>
                    <input type="password" placeholder="Re-Enter your password" name="confirm_password" required>
                </div>
                <!-- Error Message -->
                <div id="passwordError" style="color: red; display: none; font-size: 14px;"></div>
            </div>
            <!-- Submit button -->
            <div class="button">
                <input type="submit" value="Create">
            </div>
            <p>Already have an account..? &nbsp; <u><a href="login.jsp">Login here</a></u></p>
        </form>
    </div>
</div>

<!-- footer -->
<jsp:include page="footer.jsp" />


<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get the form
        const registrationForm = document.querySelector('form');

        // Get references to password and confirm password fields
        const passwordInput = document.querySelector('input[name="password"]');
        const confirmPasswordInput = document.querySelector('input[name="confirm_password"]');

        // Function to validate passwords
        function validatePasswords(e) {
            // Check if passwords match
            if (passwordInput.value !== confirmPasswordInput.value) {

                // Prevent form submission
                e.preventDefault();

                // Show error message
                alert('Passwords do not match. Please try again.');

                // Focus on confirm password field
                confirmPasswordInput.focus();

                // Optional: Add visual error indication
                confirmPasswordInput.style.borderColor = 'red';
                passwordInput.style.borderColor = 'red';
                return false;
            }
            // Reset border colors if passwords match
            confirmPasswordInput.style.borderColor = '';
            passwordInput.style.borderColor = '';
            return true;
        }
        // Add event listener to form submission
        registrationForm.addEventListener('submit', validatePasswords);
    });
</script>



</body>
</html>
