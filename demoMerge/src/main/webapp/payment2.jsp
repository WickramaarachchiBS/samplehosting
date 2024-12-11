<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/12/2024
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- title -->
    <title>Payment Checkout Form</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Baloo+Bhaijaan|Ubuntu');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Ubuntu', sans-serif;
        }

        body {
            background: #2E2E2E; /* Dark background */
            margin: 0 10px;
        }

        .payment {
            background: #3A3A3A; /* Darker background for form */
            max-width: 400px;
            margin: 80px auto;
            padding: 35px;
            padding-top: 70px;
            border-radius: 5px;
            position: relative;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .payment h2 {
            text-align: center;
            letter-spacing: 2px;
            margin-bottom: 40px;
            color: #FF9800; /* Golden orange text */
        }

        .form .label {
            display: block;
            color: #FF9800; /* Golden orange label */
            margin-bottom: 6px;
        }

        .input {
            padding: 13px 0px 13px 25px;
            width: 100%;
            text-align: center;
            border: 2px solid #FF9800; /* Golden orange border */
            border-radius: 5px;
            letter-spacing: 1px;
            word-spacing: 3px;
            outline: none;
            font-size: 16px;
            color: #fff; /* White text */
            background: #555555; /* Dark background for inputs */
        }

        .input:focus {
            border-color: #FF5722; /* Focused input with a red-orange border */
        }

        .card-grp {
            display: flex;
            justify-content: space-between;
        }

        .card-item {
            width: 48%;
        }

        .space {
            margin-bottom: 20px;
        }

        .icon-relative {
            position: relative;
        }

        .icon-relative .fas,
        .icon-relative .far {
            position: absolute;
            bottom: 12px;
            left: 15px;
            font-size: 20px;
            color: #FF9800; /* Golden orange icons */
        }

        .btn {
            margin-top: 40px;
            background: #FF9800; /* Golden orange button */
            padding: 12px 20px;
            text-align: center;
            color: #fff; /* White text on button */
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 40px auto 0; /* Center the button */
            width: 100%;
        }

        .payment-logo {
            position: absolute;
            top: -50px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 100px;
            background: #FF9800; /* Golden orange background */
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            text-align: center;
            line-height: 85px;
        }

        .payment-logo:before {
            content: "";
            position: absolute;
            top: 5px;
            left: 5px;
            width: 90px;
            height: 90px;
            background: #2E2E2E; /* Dark background for logo */
            border-radius: 50%;
        }

        .payment-logo p {
            position: relative;
            color: #fff; /* White text for logo */
            font-family: 'Baloo Bhaijaan', cursive;
            font-size: 58px;
        }

        .payment-logo .fas {
            font-size: 40px; /* Adjust icon size */
        }

        /* Responsive design */
        @media screen and (max-width: 420px) {
            .card-grp {
                flex-direction: column;
            }
            .card-item {
                width: 100%;
                margin-bottom: 20px;
            }
            .btn {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>



<div class="wrapper">
    <div class="payment">
        <div class="payment-logo">
            <p><i class="fas fa-lock"></i></p> <!-- Lock icon inside the logo -->
        </div>
        <h2>Payment via Paypal</h2>
        <form action="PaymentServlet" method="POST" class="form">

            <!-- User Info Section -->
            <div class="card space icon-relative">
                <label class="label">Full Name:</label>
                <input type="text" name="fullName" class="input" placeholder="John Doe" required>
                <i class="fas fa-user"></i>
            </div>

            <div class="card space icon-relative">
                <label class="label">Email Address:</label>
                <input type="email" name="email" class="input" placeholder="youremail@example.com" required>
                <i class="fas fa-envelope"></i>
            </div>

            <div class="card space icon-relative">
                <label class="label">Phone Number:</label>
                <input type="text" name="phone" class="input" placeholder="123-456-7890" required>
                <i class="fas fa-phone-alt"></i>
            </div>

            <!-- Card Info Section -->
            <div class="card space icon-relative">
                <label class="label">Card Holder:</label>
                <input type="text" name="cardHolder" class="input" placeholder="John Market" required>
                <i class="fas fa-user"></i>
            </div>
            <div class="card space icon-relative">
                <label class="label">Card Number:</label>
                <input type="text" name="cardNumber" class="input" placeholder="Card Number" required>
                <i class="far fa-credit-card"></i>
            </div>
            <div class="card-grp space">
                <div class="card-item icon-relative">
                    <label class="label">Expiry Date:</label>
                    <input type="text" name="expiryDate" class="input" placeholder="MM / YY" required>
                    <i class="far fa-calendar-alt"></i>
                </div>
                <div class="card-item icon-relative">
                    <label class="label">CVC:</label>
                    <input type="text" name="cvc" class="input" placeholder="000" required>
                    <i class="fas fa-lock"></i>
                </div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn">Pay Now</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

</body>
</html>
