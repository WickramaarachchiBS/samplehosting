<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 23/11/2024
  Time: 1:09 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Navbar</title>
    <!-- Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- CSS -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        header {
            width: 100%;
            height: auto;
            background-color: #1a1a1a;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            position: relative;
        }
        .logo1 {
            font-size: 1.4rem;
            color: #f0c541;
            font-weight: 200;
            text-decoration: none;
        }
        .logo1:hover {
            color: #f0c541;
            /*box-shadow: 0 0 5px #ffffff;*/
            text-shadow: 0 0 15px rgb(255, 255, 255); /* Add shadow on hover */
            background: transparent;
        }
        .login-icon {
            right: 5px; /* Adjust the position */
            font-size: 20px; /* Size of the login icon */
            color: #f0c541; /* Color of the icon */
            cursor: pointer; /* Pointer cursor on hover */
        }
        .login-icon:hover {
            color: #f0c541;
            text-shadow: 0 0 5px rgb(255, 255, 255); /* Add shadow on hover */
            background-color: transparent;
        }
        nav {
            display: flex;
            gap: 10px;
        }
        nav a {
            color: #fff;
            padding: 5px 10px;
            font-size: 16px;
            transition: 0.2s;
            text-decoration: none;
        }
        a.active {
            background: #f0c541;
            border-radius: 2px;
            color: #1a1a1a;
        }
        a:hover {
            background: #f0c541;
            border-radius: 2px;
            color: #1a1a1a;
        }
        .hamburger {
            display: none; /* Hidden by default */
            flex-direction: column; /* Stack bars vertically */
            cursor: pointer; /* Pointer cursor on hover */
        }
        .bar {
            width: 25px;
            height: 2px;
            background-color: #f0c541; /* Color of the bars */
            margin: 3px 0; /* Space between bars */
            transition: all 0.3s ease; /* Transition for smooth effect */
        }
        /* New styles for user dropdown */
        .user-dropdown {
            position: relative;
            display: inline-block;
        }
        .user-dropdown-btn {
            color: #f0c541;
            font-size: 15px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .user-dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #1a1a1a;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border: 1px solid #333;
            border-radius: 15px;
        }
        .user-dropdown-content a {
            color: #f0c541;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        .user-dropdown-content a:hover {
            background-color: #333;
            border-radius: 15px;
        }
        .user-dropdown:hover .user-dropdown-content {
            display: block;
        }
        @media screen and (max-width: 768px) {
            .hamburger {
                display: flex; /* Show hamburger menu in mobile view */
                z-index: 10; /* Ensure it is above other elements */
                position: relative; /* Position relative for stacking context */
                margin-left:auto; /* Align it to the right */
                transition-duration :0.3s ; /* Smooth transition for hamburger menu */
                transform-origin : center ; /* Set transform origin for rotation effect */
            }
            nav {
                display: flex;
                flex-direction: column; /* Stack menu items vertically */
                width: 100%; /* Full width for mobile view */
                position: absolute; /* Position below the header */
                top: 100%;
                left: 0;
                background-color: #1a1a1a;
                padding: 0 5px 0px 5px;
                overflow: hidden; /* Hide overflowing items */
                max-height: 0; /* Initially collapsed */
                transition: max-height 0.3s ease-out; /* Smooth dropdown effect */
            }
            nav.active {
                max-height: 300px; /* Expand to fit all items */
            }
            nav a {
                width :100% ;
                text-align : center ;
                padding :10px ;
                margin-bottom :5px ;
            }
            /* Mobile styles for dropdown */
            .user-dropdown-content {
                position: static;
                display: none;
            }
            .user-dropdown:hover .user-dropdown-content {
                display: block;
            }
        }

        .search-container {
            display: flex;
            align-items: center;
            justify-content: flex-end; /* Align to the right */
            margin-left: auto;
            gap: 10px; /* Adds space between input and login icon */
            flex-wrap: wrap; /* Allows wrapping for smaller screens */
        }

        .search-input {
            padding: 8px 12px;
            font-size: 14px;
            border: 2px solid #f0c541; /* Golden border */
            border-radius: 4px;
            background-color: transparent;
            color: #fff;
            outline: none; /* Removes default focus outline */
            transition: border-color 0.3s ease;
            flex: 1; /* Responsive resizing */
            max-width: 250px; /* Limit the width */
            position: relative; /* For positioning the search icon */
        }

        .search-input:focus {
            border-color: #fff; /* Border changes to white on focus */
        }

        .search-icon {
            font-size: 18px; /* Adjust icon size */
            color: #f0c541; /* Static color */
            cursor: pointer; /* Pointer cursor on hover */
            position: absolute;
            right: 10px; /* Position the icon inside the input box */
            top: 50%;
            transform: translateY(-50%); /* Vertically center the icon */
            background: transparent;
            border: none;
            outline: none;
        }

        .login-icon {
            font-size: 18px; /* Adjust icon size */
            color: #f0c541; /* Static color */
            margin-left: 15px; /* Add spacing from the search bar */
            margin-top: 10px; /* Ensure spacing between the icons */
            transition: none; /* Disable any transition */
        }
        /* Responsive adjustments */
        @media (max-width: 600px) {
            .search-container {
                flex-direction: column; /* Stack elements on small screens */
                align-items: center; /* Center-align the content */
            }

            .search-input {
                max-width: 100%; /* Make the input field take full width */
            }

            .login-icon {
                margin-left: 0; /* Remove margin on small screens */
                margin-top: 10px; /* Space the login icon below the search box */
            }
        }

    </style>
</head>
<body>

    <%-- for session --%>
    <%
        // Check if session exists
        String email = (String) session.getAttribute("email");
        boolean isLoggedIn = (email != null && !email.isEmpty());
    %>


    <header>
        <nav id="navMenu">
            <a href="index.jsp" class="active">Home</a>
            <a href="RetrieveAllMovieServlet">Movies</a>
            <a href="locations.jsp">Locations</a>
            <a href="about_us.jsp">About Us</a>
            <a href="contact_us.jsp">Contact Us</a>
        </nav>

        <div class="search-container">
            <form action="searchResults.jsp" method="GET">
                <div style="position: relative;">
                    <input type="text" name="query" placeholder="Search for movies.." class="search-input" required>
                    <button type="submit" style="display: none;">Search</button> <!-- Hidden button for form submission -->
                    <button type="submit" class="search-icon" aria-label="Search">
                        <i class="fas fa-search"></i> <!-- Search icon inside the input -->
                    </button>
                </div>
            </form>
<%--            <a href="login.jsp">--%>
<%--                <i class="fas fa-user login-icon"></i> <!-- Login icon below the search box -->--%>
<%--            </a>--%>
        </div>

        <div class="auth-section">
<%--            <a href="index.jsp" class="logo1">Movie|Land</a> &nbsp;--%>

            <% if (isLoggedIn) { %>
            <div class="user-dropdown">
                <div class="user-dropdown-btn" style="font-weight: normal;">
                    <i class="fas fa-user"></i><%= email %>
                </div>
                <div class="user-dropdown-content">
                    <a href="LogoutServlet">Logout</a>
                </div>
            </div>

            <% } else { %>
            <a href="login.jsp" class="login-icon">
                <i class="fas fa-user iconlogin"></i>
            </a>

            <% } %>
        </div>

            <div class="hamburger" onclick="toggleMenu()">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
        </div>
    </header>

<script>
    function toggleMenu() {
        const nav = document.getElementById('navMenu');
        const bars = document.querySelectorAll('.bar');

        // Toggle active class for navigation
        nav.classList.toggle('active');
    }
</script>

</body>
</html>
