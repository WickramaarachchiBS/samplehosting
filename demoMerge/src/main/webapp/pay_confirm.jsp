<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 23/11/2024
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>ThankYou...</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" href="pay_confirm.jsp">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }
        body {
            background-color: #000000;
            display: flex;
            flex-direction: column;
            position: relative;
            overflow: hidden;
            height: 920px;
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
        .background-elements {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }
        .cloud {
            position: absolute;
            background: rgba(234, 134, 26, 0.7);
            border-radius: 50px;
            height: 20px;
            width: 100px;
        }
        .cloud:nth-child(1) { top: 15%; left: 10%; }
        .cloud:nth-child(2) { top: 25%; right: 15%; }
        .cloud:nth-child(3) { top: 35%; left: 30%; }
        .cloud:nth-child(4) { bottom: 20%; right: 10%; }
        .cloud:nth-child(5) { top: 60%; left: 5%; }

        .diagonal-line {
            position: absolute;
            background: rgb(234, 134, 26);
            height: 2px;
            width: 50px;
            transform: rotate(-45deg);
        }

        .diagonal-line:nth-child(3) { top: 20%; right: 25%; }
        .diagonal-line:nth-child(4) { top: 40%; left: 20%; }
        .diagonal-line:nth-child(5) { bottom: 30%; left: 35%; }
        .diagonal-line:nth-child(6) { top: 60%; right: 10%; }
        .diagonal-line:nth-child(7) { bottom: 15%; left: 15%; }
        .diagonal-line:nth-child(8) { top: 45%; right: 30%; }
        .diagonal-line:nth-child(9) { bottom: 25%; right: 20%; }
        .diagonal-line:nth-child(10) { top: 30%; left: 40%; }
        .diagonal-line:nth-child(11) { bottom: 10%; right: 5%; }
        .diagonal-line:nth-child(12) { top: 70%; left: 15%; }
        .diagonal-line:nth-child(13) { bottom: 40%; right: 25%; }
        .diagonal-line:nth-child(14) { top: 15%; right: 35%; }
        .diagonal-line:nth-child(15) { top: 12%; left: 35%; }
        .diagonal-line:nth-child(16) { bottom: 18%; left: 38%; }

        .main-content {
            margin: auto;
            text-align: center;
            padding: 20px 20px;
            color: rgb(0, 0, 0);
            background-color: #a0a095de;
            opacity: 0.5;
            border-radius: 20px 50px 20px;
            max-width: 600px;
            width: 100%;
            position: relative;
            z-index: 1;
            box-shadow: 0 0 50px rgb(236, 176, 54);
        }
        .logo {
            width: 120px;
            height: 120px;
            background: rgb(255, 255, 255);
            border-radius: 50%;
            margin: 0 auto 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .logo svg {
            width: 100px;
            height: 100px;
            fill: #000000;
        }
        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            line-height: 1.3;
            font-weight: 600;
        }
        p {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 30px;
            line-height: 1.6;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
        }
        .bottom-text {
            font-size: 1rem;
            opacity: 0.8;
            margin-top: 40px;
        }
        .bottom-text a {
            color: rgb(19, 19, 19);
            text-decoration: none;
            padding-bottom: 2px;
            transition: border-color 0.3s ease;
        }
        .bottom-text a:hover {
            color: rgb(160, 25, 153);
        }
        @media (max-width: 768px) {
            .main-content {
                padding: 30px 20px;
            }
            h1 {
                font-size: 2rem;
            }
            p {
                font-size: 1rem;
            }
            .logo {
                width: 50px;
                height: 50px;
                margin-bottom: 25px;
            }
            .logo svg {
                width: 32px;
                height: 32px;
            }
        }
        @media (max-width: 480px) {
            h1 {
                font-size: 1.75rem;
            }
            .main-content {
                padding: 25px 15px;
            }
        }
    </style>
</head>
<body>

<div class="background-elements">
    <div class="cloud"></div>
    <div class="cloud"></div>
    <div class="cloud"></div>
    <div class="cloud"></div>
    <div class="cloud"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
</div>

<main class="main-content">
    <div class="logo">
        <svg viewBox="0 0 24 24">
            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.88-11.71L10 14.17l-1.88-1.88a.996.996 0 1 0-1.41 1.41l2.59 2.59c.39.39 1.02.39 1.41 0L17.3 9.7a.996.996 0 1 0-1.41-1.41z"/>
        </svg>
    </div>
    <h1>Your Booking is Confirmed!</h1>
    <h2>Thank you for choosing us...</h2> <br>
    <p>An email containing your reciept will be sent to you. <br>
        Please check your email. </p>
    <p class="bottom-text">You will redirected to home page shortly.<a href="index.jsp">&nbsp;&nbsp;&nbsp;<u>Redirect Now →</u></a></p>
</main>


<script>
    // Show modal automatically when page loads
    document.addEventListener('DOMContentLoaded', function() {
        var feedbackModal = new bootstrap.Modal(document.getElementById('feedbackModal'));
        feedbackModal.show();

        // Handle form submission
        document.getElementById('feedbackForm').addEventListener('submit', function(e) {
            e.preventDefault();

            // Collect form data
            var name = document.getElementById('customerName').value;
            var email = document.getElementById('customerEmail').value;
            var feedback = document.getElementById('feedbackText').value;
            var rating = document.getElementById('satisfactionRating').value;

            // Here you would typically send the data to a server
            // For this example, we'll just log to console
            console.log('Feedback Submitted:', {
                name: name,
                email: email,
                feedback: feedback,
                rating: rating
            });

            // Close the modal
            feedbackModal.hide();

            // Optional: Show a thank you message
            alert('Thank you for your feedback!');
        });
    });

    //redirect script
    setTimeout(function() {
      window.location.href = "index.jsp"; // Replace with your desired URL
    }, 30000); // 30 seconds

</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var feedbackModal = new bootstrap.Modal(document.getElementById('feedbackModal'));
        feedbackModal.show();

        document.getElementById('submitFeedbackBtn').addEventListener('click', function(e) {
            e.preventDefault(); // Prevent the default form submission

            const form = document.getElementById('feedbackForm');
            const formData = new FormData(form);

            // Use fetch to submit the form via AJAX
            fetch('FeedbackServlet', {
                method: 'POST',
                body: formData
            })
                .then(response => response.text())
                .then(data => {
                    alert('Feedback submitted successfully!');
                    feedbackModal.hide();  // Close the modal
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Something went wrong.');
                });
        });
    });
</script>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

</body>
</html>
