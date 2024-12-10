<%@ page import="com.mysql.cj.Session" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 23/11/2024
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Contct Us</title>
    <!-- bootstrap cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">
    <!-- css -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Geist+Mono:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        *{
            box-sizing: border-box;
        }
        body {
            margin: 0;
            background-color: black;
            padding: 0 0 6.25rem;
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
        #contact {
            width: 100%;
            height: 100%;
        }
        /* header css */
        .header {
            text-align: left;
            margin: 0 auto;
            padding: 1.563rem 0;
            font: 1 1.875rem Geist Mono;
            color: white;
            /*background-color: #032f30;*/
            background-color: #2f150e;
            text-transform: uppercase;
            letter-spacing: 0.313rem;
            border-top: 1px solid #ea861a;
            border-bottom: 1px solid #ea861a;
        }
        .topic{
            margin-left: 20%;
        }
        .contact-wrapper {
            display: flex;
            background-color: #011621;
            border-radius: 8px;
            margin: 0 auto;
            flex-direction: row;
            justify-content: space-between;
            padding: 1.25rem;
            position: relative;
            width: 60%;
            box-shadow: 0 0 10px rgba(234, 134, 26, 0.65);
        }
        /* Left contact page */
        .left-form {
            display: block;
            text-align: center;
            width: 70%;
            padding: 2%;
            margin: 0 auto;
            float: left;
            font-family: 'Lato', serif;
            font-weight: 400;
            /*background-color: #6ba3be;*/
        }
        .left-form2{
            display: block;
            text-align: center;
            padding: 2%;
            float: right;
            margin: 0 auto;
            width: 70%;
            font-family: 'Lato', serif;
            font-weight: 400;
            color: #000;
            /*background-color: #6ba3be;*/
        }
        .form-control{
            margin: 0 auto;
            width: 80%;
            border-radius: 0.313rem;
        }
        .form-group{
            padding: 0;
            margin: 0;
            width: 100%;
        }
        .form-control,
        textarea {
            max-width: 400px;
            border-color: #7f74bb;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #eeeeee;
            color: #000000;
            letter-spacing: 1px;
        }
        .column{
            text-align: center;
        }
        .send-button {
            border-color: #525252;
            background-color: #ea861a;
            text-align: center;
            margin: 0.938rem auto;
            border-radius: 5px;
            height: 2.8rem;
            overflow: hidden;
            width: 54%;
            transition: all .2s ease-in-out;
        }
        .send-button:hover{
            background-color: #ffaf00;
            box-shadow: 0 0 10px #ffffff;
        }
        .alt-send-button {
            background-color: #0a7075;
            height: 2.125rem;
            transition: all .2s ease-in-out;
        }
        .send-text {
            display: block;
            text-align: center;
            align-items: center;
            margin-top: 0.625rem;
            margin-bottom: 0.625rem;
            font: 700 12px 'Lato', sans-serif;
            letter-spacing: 2px;
        }
        .alt-send-button:hover {
            background-color: #0a7075;
            transform: translate3d(0px, -29px, 0px);
        }
        .alt-send-button::after{
            background-color: #0a7075;
        }
        /* Location, Phone, Email Section */
        .contact-list {
            list-style-type: none;
            color: #000;
            margin-left: -1.875rem;
            padding-right: 1.25rem;
        }
        .list-item {
            line-height: 4;
            color: #aaa;
        }
        .contact-text {
            font: 300 18px 'Lato', sans-serif;
            letter-spacing: 2px;
            color: #ffaf00;
        }
        .place {
            margin-left: 3.875rem;
        }
        .phone {
            margin-left: 3.5rem;
        }
        .gmail {
            margin-left: 3.313rem;
        }
        .contact-text a {
            color: #000000;
            text-decoration: none;
            transition-duration: 0.2s;
        }
        /* Social Media Icons */
        .social-media-list {
            position: relative;
            font-size: 22px;
            text-align: center;
            width: 100%;
            margin: 0 auto;
            padding: 0;
        }
        .social-media-list li a {
            color: #fff;
        }
        .social-media-list li {
            justify-content: center;
            align-items: center;
            position: relative;
            display: inline-flex;
            height: 3.75rem;
            width: 3.75rem;
            margin: 0.625rem 3px;
            line-height: 3.75rem;
            border-radius: 50%;
            color: #fff;
            background-color: rgba(31, 61, 54, 0.61);
            cursor: pointer;
            transition: all .5s ease-in-out;
        }
        .social-media-list li:after {
            position: absolute;
            top: 0;
            left: 0;
            width: 3.75rem;
            height: 3.75rem;
            line-height: 3.75rem;
            border-radius: 50%;
            opacity: 0;
            box-shadow: 0 0 0 1px #fff;
            transition: all .2s ease-in-out;
        }
        .social-media-list li:hover {
            background-color: #fff;
        }
        .social-media-list li:hover:after {
            opacity: 1;
            transform: scale(1.12);
            transition-timing-function: cubic-bezier(0.37,0.74,0.15,1.65);
        }
        .social-media-list li:hover a {
            color: #000;
        }
        .copyright {
            font: 200 14px 'Oswald', sans-serif;
            color: #555;
            letter-spacing: 1px;
            text-align: center;
        }
        hr {
            border-color: rgba(255,255,255,.6);
        }
        /* Begin Media Queries*/
        @media screen and (max-width: 1300px) {
            .contact-wrapper {
                display: flex;
            }
            .direct-contact-container, .form-horizontal {
                margin: 0 auto;
            }
            .left-form{
                width: 80%;
                padding: 1%;
                margin: auto;
                max-width: 300px;
            }
            .form-group{
                width: 100%;
            }
        }
        @media screen and (max-width: 1024px) {
            .contact-wrapper {

                display: flex;
            }
            .direct-contact-container, .form-horizontal {
                margin: 0 auto;
            }
            .left-form{
                width: 100%;
                margin: auto;
                max-width: 300px;
            }
            .left-form2{
                width: 100%;
                padding: 0;
                margin: auto;
                max-width: 300px;
            }
            .form-group{
                width: 100%;
            }
            .direct-contact-container {
                margin-top: 60px;
                max-width: 300px;
            }
            .social-media-list li {
                height: 60px;
                width: 60px;
                line-height: 60px;
            }
            .social-media-list li:after {
                width: 60px;
                height: 60px;
                line-height: 60px;
            }
        }
        @media screen and (max-width: 850px) {
            .contact-wrapper {

                display: flex;
                flex-direction: column;
            }
            .left-form{
                width: 100%;
                margin: auto;
                max-width: 300px;
                align-items: center;
            }
            .left-form2{
                align-items: center;
                text-align: center;
            }
            .form-group{
                width: 100%;
                max-width: 100%;
            }
            .direct-contact-container, .form-horizontal {
                margin: 0 auto;
            }
            .direct-contact-container {
                margin-top: 60px;
                max-width: 300px;
            }
            .social-media-list li {
                height: 60px;
                width: 60px;
                line-height: 60px;
            }
            .social-media-list li:after {
                width: 60px;
                height: 60px;
                line-height: 60px;
            }
        }
        @media screen and (max-width: 569px) {
            .direct-contact-container, .form-wrapper {
                float: none;
                margin: 0 auto;
            }
            .contact-wrapper{
                width: 100%;
            }
            .left-form{
                width: 100%;
                margin: auto;
                max-width: 300px;
            }
            .form-control, textarea {
                margin: 0 auto;
            }
            .name, .email, textarea {
                width: 280px;
            }
            .social-media-list {
                left: 0;
            }
            /*
            .social-media-list li {
              height: 55px;
              width: 55px;
              line-height: 55px;
              font-size: 2rem;
            }
            .social-media-list li:after {
              width: 55px;
              height: 55px;
              line-height: 55px;
            } */
        }
        @media screen and (max-width: 320px) {
            .header{
                width: 100%;
            }
            .left-form{
                width: 80%;
                margin: auto;
                max-width: 300px;
            }
            .contact-wrapper{
                width: 80%;
                padding: 0;
            }
            .left-form{
                padding: 0;
            }
            .form-group{
                padding-top: 20px;
            }
        }
    </style>
</head>
<body>

<!-- navbar -->
<jsp:include page="navbar.jsp" />
<br>
<br>

<section id="contact">
    <div class="header">
        <h1 class="topic">Contact Us</h1>
    </div><br><br>
    <div class="contact-wrapper">

        <!-- Left contact page -->
        <form id="contact-form " class="left-form" role="form" action="ContactUsServlet" method="POST">
            <div class="form-group">
                <div class="col-sm-12 column">
                    <input type="text" class="form-control" id="name" placeholder="NAME" name="name" value="" required>
                </div>

                <div class="col-sm-12">
                    <input type="email" class="form-control" id="email" placeholder="EMAIL" name="email" value="" required>
                </div>

                <div class="col-sm-12">
                    <textarea class="form-control" rows="10" placeholder="MESSAGE" name="message" required></textarea>
                </div>
            </div>

            <button class="btn btn-primary send-button" id="submit" type="submit" value="SEND">
                <i><span class="send-text">SEND</span></i>
            </button>
        </form>

        <!-- Left contact page -->
        <form id="contact-form info" class="left-form2" role="form">
            <ul class="contact-list">
                <li class="list-item"><p class="contact-text place">Mahenwaththa, Pitipana, Homagama, Sri Lanka</p></li><br>

                <li class="list-item"><p class="contact-text phone"><a title="Give me a call">+94 11 544 5000<br>+94 71 244 5000</a></p></li>

                <li class="list-item"><span class="contact-text gmail"><a title="Send me an email">inquiries@nsbm.ac.lk</a></span></li>
            </ul>
            <hr>
            <ul class="social-media-list">
                <li><a href="#" target="_blank" class="contact-icon">
                    <i class="fa-brands fa-facebook"></i></a>
                </li>
                <li><a href="#" target="_blank" class="contact-icon">
                    <i class="fa-brands fa-linkedin-in"></i></a>
                </li>
                <li><a href="#" target="_blank" class="contact-icon">
                    <i class="fa-brands fa-instagram"></i></a>
                </li>
                <li><a href="#" target="_blank" class="contact-icon">
                    <i class="fa-brands fa-youtube"></i></a>
                </li>
            </ul>
            <hr>

            <div class="copyright">&copy; ALL OF THE RIGHTS RESERVED</div>
        </form>

    </div>

</section>

<!-- footer -->
<jsp:include page="footer.jsp" />


<!-- alert -->
<%
    // Retrieve the popup message from the request scope
    String popupMessage = (String) request.getAttribute("popupMessage");
    if (popupMessage != null) {
%>
    <script>
        // Display the popup message
        alert("<%= popupMessage %>");
    </script>
<%
    }
%>

<script>
    document.querySelector('#contact-form').addEventListener('submit', (e) => {
        e.preventDefault();
        e.target.elements.name.value = '';
        e.target.elements.email.value = '';
        e.target.elements.message.value = '';
    });
</script>

</body>
</html>
