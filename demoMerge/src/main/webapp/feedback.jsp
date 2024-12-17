<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Contact Us</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            line-height: 1.6;
        }

        .contact-container {
            width: 100%;
            max-width: 500px;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }

        .contact-header {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .contact-header h2 {
            font-size: 24px;
            color: #2c3e50;
        }

        .contact-header p {
            color: #7f8c8d;
            margin-top: 10px;
        }

        .contact-form .form-group {
            margin-bottom: 20px;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-size: 16px;
        }

        .contact-form input:focus,
        .contact-form textarea:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.2);
        }

        .contact-form textarea {
            resize: vertical;
            min-height: 150px;
        }

        .send-button {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .send-button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .send-button i {
            font-size: 18px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 600px) {
            .contact-container {
                width: 95%;
                padding: 20px;
            }
        }
    </style>
</head>
<body style="background-color: black">
<div class="contact-container" style="background-color: #565353">
    <div class="contact-header">
        <h2 style="color: #ea861a">Contact Us</h2>
        <p style="color: white">Have a question or want to get in touch? Send us a message!</p>
    </div>

    <form id="contact-form" class="contact-form" role="form" action="FeedbackServlet" method="POST">
        <div class="form-group">
            <input type="text" class="form-control" id="name" placeholder="Your Name" name="name" required>
        </div>

        <div class="form-group">
            <input type="email" class="form-control" id="email" placeholder="Your Email" name="email" required>
        </div>

        <div class="form-group">
            <textarea class="form-control" placeholder="Your Message" name="feedback" required></textarea>
        </div>

        <button class="send-button" id="submit" type="submit">
            <i class="fas fa-paper-plane"></i>
            <span class="send-text">Send Message</span>
        </button>
    </form>
</div>
</body>
</html>