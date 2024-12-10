    <%--
      Created by IntelliJ IDEA.
      User: USER
      Date: 9/12/2024
      Time: 6:47 PM
      To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- tailwind css -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <!-- font awesome cdn -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

        <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
        <title>Update Movie</title>

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
            *{
                font-family: 'Poppins', sans-serif;
                box-sizing: border-box;
            }
            body {
                background-color: #000000;
                font-family: 'Inter', sans-serif;
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
            .card {
                background-color: #505050;
                border-radius: 0.5rem;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }
            .card-header {
                padding-top: 1.5%;
                padding-bottom: 1.5%;
                background-color: #c0ad05ce;
                color: #ffffff;
                border-bottom: 1px solid white;
            }
            .card-header h1 {
                font-size: 20px;
                text-align: left;
                margin-bottom: 0;
                font-weight: normal;
                letter-spacing: 1px;
            }
            .form-input{
                height: 45px;
                border-radius: .25rem;
            }
            .form-input,
            .form-textarea {
                padding: 0 10px 0 10px;
                background-color: #f8fafc;
                border: 1px solid #e3e3e7;
                border-radius: 8px;
                transition: all 0.3s ease;
            }
            .form-input:focus,
            .form-textarea:focus {
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
                outline: none;
            }
            .btn1 {
                transition: all 0.5s ease;
                text-transform: uppercase;
                font-size: 16px;
                margin-top: 10px;
                color: #000000;
                text-decoration: none;
                background: #f1dc16;
                border-radius: 10px;
                text-align: center;
                font-weight: 600;
                border-color: #f1dc16;
                margin: 3px;
            }
            .btn1:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .inputfile {
                display: block;
                width: 100%;
                padding: 0.75rem;
                background-color: #f8fafc;
                border-radius: 8px;
            }
            .modal-footer {
                background-color: #505050;
                padding: 1rem;
                border-top: 1px solid #e2e8f0;
            }
        </style>
    </head>
    <body>
        <!-- navbar -->
        <jsp:include page="navbar.jsp" />

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header text-white">
                            <h1 class="text">
                                Update Movie Details
                            </h1>
                        </div>

                        <!-- input section -->
                        <div class="p-8 mt-6 lg:mt-0">
                            <form class="form1" name="addForm" action="UpdateMovieServlet" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                                <div class="space-y-6">
                                    <!-- Movie ID -->
                                    <div class="md:flex mb-6">
                                        <div class="md:w-1/3">
                                            <label class="block text-black md:text-left mb-3 md:mb-0 pr-4" for="movieId">Movie ID</label>
                                        </div>
                                        <div class="md:w-2/3">
                                            <input class="form-input block w-full focus:bg-white" id="movieId" type="number" name="id" value="${movie.id}" readonly>
                                        </div>
                                    </div>

                                    <!-- Movie Name -->
                                    <div class="md:flex items-center">
                                        <div class="md:w-1/3">
                                            <label class="block text-black mb-2" for="movieName">
                                                <i class="fas fa-film mr-2"></i>Movie Name
                                            </label>
                                        </div>
                                        <div class="md:w-2/3">
                                            <input class="form-input block w-full" id="movieName" type="text" name="movieName" value="${movie.title}" required>
                                        </div>
                                    </div>

                                    <!-- Ticket Price -->
                                    <div class="md:flex items-center">
                                        <div class="md:w-1/3">
                                            <label class="block text-black mb-2" for="moviePrice">
                                                <i class="fas fa-ticket-alt mr-2"></i>Ticket Price ($)
                                            </label>
                                        </div>
                                        <div class="md:w-2/3">
                                            <input class="form-input block w-full" id="moviePrice" type="number" name="moviePrice" value="${movie.price}" required>
                                        </div>
                                    </div>

                                    <!-- Movie Description -->
                                    <div class="md:flex">
                                        <div class="md:w-1/3">
                                            <label class="block text-black mb-2" for="movieDesc">
                                                <i class="fas fa-comment-dots mr-2"></i>Movie Description
                                            </label>
                                        </div>
                                        <div class="md:w-2/3">
                                            <textarea class="form-textarea block w-full" id="movieDesc" rows="5" name="movieDesc">${movie.desc}</textarea>
                                        </div>
                                    </div>

                                    <!-- Genre -->
                                    <div class="md:flex items-center">
                                        <div class="md:w-1/3">
                                            <label class="block text-black mb-2" for="movieGenre">
                                                <i class="fas fa-tags mr-2"></i>Genre
                                            </label>
                                        </div>
                                        <div class="md:w-2/3">
                                            <input class="form-input block w-full" id="movieGenre" type="text" name="movieGenre" value="${movie.genre}" required>
                                        </div>
                                    </div>

                                    <!-- Duration -->
                                    <div class="md:flex items-center">
                                        <div class="md:w-1/3">
                                            <label class="block text-black mb-2" for="movieDuration">
                                                <i class="fas fa-clock mr-2"></i>Duration (Ex. 2h 10min)
                                            </label>
                                        </div>
                                        <div class="md:w-2/3">
                                            <input class="form-input block w-full" id="movieDuration" type="text" name="movieDuration" value="${movie.duration}" required>
                                        </div>
                                    </div>

                                    <!-- Image Upload -->
                                    <div class="md:flex mb-6">
                                        <div class="md:w-1/3">
                                            <label class="block text-black mb-2" for="cardImage">
                                                <i class="fas fa-image mr-2"></i>Card Image
                                            </label>
                                        </div>
                                        <div class="md:w-2/3">
                                            <input style="background-color: transparent; border: none;" id="cardImage" name="cardImage" class="inputfile" type="file" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer mt-6 flex">
                                    <button type="submit" class="btn1 btn-primary" style="scale: 1; padding: 6px;">Update Movie</button>
                                    <button type="button" class="btn1 btn-secondary" data-bs-dismiss="modal" style="scale: 1; padding: 6px;" onclick="goBack()">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
            function goBack() {
                history.back()
            }
        </script>

    </body>
    </html>
