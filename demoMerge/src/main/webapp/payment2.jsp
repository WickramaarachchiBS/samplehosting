<%@ page import="jakarta.mail.Session" %>
<%@ page import="java.util.Properties" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Payment Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #121212;
            color: #f5c518;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 90%;
            max-width: 450px;
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .movie-details {
            margin-bottom: 20px;
        }

        .movie-details img {
            width: 150px;
            height: 220px;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .movie-details h3 {
            color: #f5c518;
        }

        .payment-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .input-container {
            position: relative;
        }

        .input-container input {
            width: 100%;
            padding: 10px;
            padding-left: 40px;
            background-color: #2a2a2a;
            border: 1px solid #444;
            border-radius: 5px;
            color: #fff;
            font-size: 14px;
            box-sizing: border-box;
        }

        .input-container input:focus {
            outline: none;
            border-color: #f5c518;
        }

        .input-container i {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #f5c518;
        }

        .header {
            margin-bottom: 20px;
        }

        .header h2 {
            font-size: 28px;
            margin: 0;
            color: #f5c518;
        }

        #paypal-button-container {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 15px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                width: 100%;
                padding: 10px;
            }

            .movie-details img {
                width: 120px;
                height: 180px;
            }

            .payment-form input {
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">T
        <h2>Payment Details</h2>
    </div>

    <div class="movie-details">
        <h3><i class="fas fa-film"></i> Movie: <c:out value="${movieTitle}" /></h3>
        <img src="<c:out value="${movieImage}" />" alt="Movie Image" />
        <p><strong>Showtime:</strong> <c:out value="${showtime}" /></p>
        <p><strong>Selected Seats No:</strong> <c:out value="${selectedSeats}" /></p>
        <p><strong>Total Price: Rs.<c:out value="${totalPrice}" /></strong></p>

        ${totalPrice}
    </div>

    <form action="PaymentServlet" method="POST" class="payment-form">
        <input type="hidden" name="movieTitle" value="${movieTitle}">
        <input type="hidden" name="totalPrice" value="${totalPrice}">
        <input type="hidden" name="selectedSeats" value="${selectedSeats}">

<%--        <div class="input-container">--%>
<%--            <i class="fas fa-user"></i>--%>
<%--            <input type="text" name="username" id="username" placeholder="Username" required>--%>
<%--        </div>--%>

<%--        <div class="input-container">--%>
<%--            <i class="fas fa-envelope"></i>--%>
<%--            <input type="email" name="email" id="email" placeholder="Email" required>--%>
<%--        </div>--%>

<%--        <div class="input-container">--%>
<%--            <i class="fas fa-credit-card"></i>--%>
<%--            <input type="text" name="cardNumber" id="cardNumber" placeholder="Card Number" required>--%>
<%--        </div>--%>

<%--        <div class="input-container">--%>
<%--            <i class="fas fa-calendar-alt"></i>--%>
<%--            <input type="text" name="expiryDate" id="expiryDate" placeholder="Expiry Date (MM/YY)" required>--%>
<%--        </div>--%>

<%--        <div class="input-container">--%>
<%--            <i class="fas fa-lock"></i>--%>
<%--            <input type="number" name="cvv" id="cvv" placeholder="CVV" required>--%>
<%--        </div>--%>
    </form>

    <div id="paypal-button-container"></div>
    <form action="TempServlet" method="POST" class="payment-form">
        <input type="hidden" name="movieTitle" value="${movieTitle}">
        <input type="hidden" name="totalPrice" value="${totalPrice}">
        <input type="hidden" name="selectedSeats" value="${selectedSeats}">
        <input type="hidden" name="email" value="rangekillerrangekiller@gmail.com" required>
        <button type="submit">Pay with Card</button>
    </form>
    <div><a href="feedback.jsp">Feedback</a></div>
</div>

<%

%>



<script src="https://www.paypal.com/sdk/js?client-id=AR4r8Aj4nDxClPqSu2U70BkWPy_hpJMxqWo0mFCjG-3r8ytI6n4HltzfdWtohGL7V85WwDurw3g5tRjf&components=buttons"></script>
<script>
    paypal.Buttons({
        createOrder: function(data, actions) {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: '<c:out value="${totalPrice}" />'
                    }
                }]
            });
        },
        onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                alert('Payment completed by ' + details.payer.name.given_name);

                var form = document.createElement('form');
                form.method = 'POST';
                form.action = 'PaymentServlet';

                form.appendChild(createInput('movieTitle', '${movieTitle}'));
                form.appendChild(createInput('totalPrice', '${totalPrice}'));
                form.appendChild(createInput('selectedSeats', '${selectedSeats}'));
                form.appendChild(createInput('username', document.getElementById('username').value));
                form.appendChild(createInput('email', document.getElementById('email').value));
                form.appendChild(createInput('paypalPaymentID', data.orderID)); // PayPal Order ID

                document.body.appendChild(form);
                form.submit();
            });
        },
        onError: function(err) {
            alert('Payment Error: ' + err);
        }
    }).render('#paypal-button-container');

    function createInput(name, value) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = name;
        input.value = value;
        return input;
    }
</script>

</body>
</html>
