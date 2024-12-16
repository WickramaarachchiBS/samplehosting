<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/12/2024
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>CinePlex - Movie Showtime</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- CSS -->
    <style>
        :root {
            --primary-color: #ea861a;
            --secondary-color: #34495e;
            --background-color: #121212;
            --card-background: #1e1e1e;
            --text-primary: #ffffff;
            --text-secondary: #b0b0b0;
            --accent-color: #ff6b6b;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }
        body {
            background-color: #000000;
            color: var(--text-primary);
            line-height: 1.6;
            overflow-x: hidden;
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards;
        }
        @keyframes fadeIn{
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        /* Modern Banner */
        .banner {
            position: relative;
            height: 60vh;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url(${pageContext.request.contextPath}/${movie.imagePath}) no-repeat center center/cover;
            display: flex;
            align-items: flex-end;
            color: var(--text-primary);
            perspective: 1000px;
        }
        .movie-info {
            position: relative;
            z-index: 2;
            padding: 30px;
            transform: translateZ(50px);
            background: rgba(12, 4, 0, 0.7);
            box-shadow: rgb(234, 134, 26) 0px 0px 10px;
            border-radius: 10px;
            margin: 0 20px;
        }
        .movie-info h2 {
            font-size: 2.5rem;
            margin-bottom: 15px;
            font-weight: 700;
        }
        .movie-info p {
            color: var(--text-secondary);
        }
        /* Date Selector */
        .date-selector {
            display: flex;
            justify-content: center;
            margin: 30px 0;
            padding-top: 20px;
            gap: 15px;
            overflow-x: auto;
        }
        .date-button {
            background-color: #2f150e;
            color: #ff9800;
            border: none;
            padding: 12px 20px;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
            min-width: 100px;
            text-align: center;
        }
        .date-button.active, .date-button:hover {
            background-color: #ff9800;
            color: #1a1a1a;
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        /* Timetable */
        .timetable {
            background-color: rgb(0, 0, 0);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .theater {
            background-color: rgba(255,255,255,0.05);
            box-shadow: 0px 0px 15px rgba(248, 248, 248, 0.5);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }
        .theater:hover {
            transform: scale(1.02);
            box-shadow: 0px 0px 15px rgba(255, 253, 253, 0.8);
        }
        .theater h3 {
            color: var(--primary-color);
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .theater h3 i {
            color: #ffaf00;
        }
        .showtimes {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .time-button {
            background-color: rgba(255,255,255,0.1);
            color: var(--text-secondary);
            border: none;
            padding: 10px 15px;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        .time-button:hover {
            background-color: #ecb036;
            color: var(--text-primary);
            transform: scale(1.05);
        }
        .time-button:hover a {
            color: black;
        }
        .timeTag{
            text-decoration: none;
            color: #fff;
        }
        .timeTag:hover{
            text-decoration: none;
            background-color: transparent;
        }
        /* Responsive Adjustments */
        @media screen and (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
            }
            .banner {
                height: 50vh;
            }
            .movie-info h2 {
                font-size: 2rem;
            }
            .date-selector {
                gap: 10px;
            }
        }
        @media screen and (max-width: 450px) {
            .date-selector {
                gap: 10px;
                flex-direction: column;
                width: 50%;
                align-items: center;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- navbar -->
    <jsp:include page="navbar.jsp" />

    <main>
        <div class="banner">
            <div class="container">
                <div class="movie-info">
                    <h2>${movie.title}</h2>
                    <p><i class="fas fa-tag"></i> Genre: ${movie.genre}</p>
                    <p><i class="fas fa-clock"></i> Duration: ${movie.duration}</p>
                </div>
            </div>
        </div>

        <!-- date buttons -->
        <div class="date-selector">
            <%
                LocalDate today = LocalDate.now();
                DateTimeFormatter dayFormatter = DateTimeFormatter.ofPattern("dd");
                DateTimeFormatter weekdayFormatter = DateTimeFormatter.ofPattern("EEE");

                LocalDate date = null;
                for (int i = 0; i < 4; i++) {
                    date = today.plusDays(i);
                    String dayNum = date.format(dayFormatter);
                    String weekday = date.format(weekdayFormatter).toUpperCase();
                    String activeClass = (i == 0) ? "active" : "";
            %>
            <button class="date-button <%=activeClass%>" data-date="<%=date.toString()%>">
                <%=dayNum%> <%=weekday%>
            </button>
            <% } %>
        </div>

        <section class="container">
            <div class="timetable">
                <div class="theater">
                    <h3><i class="fas fa-building"></i> Cinemax 3D: Jaela</h3>

                    <div class="showtimes">
                        <button class="time-button">
                            <a class="timeTag"
                               href="${pageContext.request.contextPath}/SeatBookingServlet?id=${movie.id}&date=<%=date.toString()%>&time=10:30 PM">
                                10:30 AM
                            </a>
                        </button>
                        <button class="time-button">
                            <a class="timeTag"
                               href="${pageContext.request.contextPath}/SeatBookingServlet?id=${movie.id}&date=<%=date.toString()%>&time=03:00 PM">
                                03:00 PM
                            </a>
                        </button>
                        <button class="time-button">
                            <a class="timeTag"
                               href="${pageContext.request.contextPath}/SeatBookingServlet?id=${movie.id}&date=<%=date.toString()%>&time=07:15 PM">
                                07:15 PM
                            </a>
                        </button>
                    </div>

                </div>

            </div>
        </section>
    </main>

    <!-- date buttons query -->
    <script>
        document.querySelectorAll('.date-button').forEach(button => {
            button.addEventListener('click', () => {

                // Remove active class from all buttons
                document.querySelectorAll('.date-button').forEach(btn => btn.classList.remove('active'));

                // Add active class to clicked button
                button.classList.add('active');

                // Get selected date
                const selectedDate = button.getAttribute('data-date');

                // You can add AJAX call or page reload logic here to fetch showtimes for selected date
                console.log('Selected Date:', selectedDate);
            });
        });
    </script>

    <script>
        // Variable to store the initially selected date
        let selectedDate = '<%=today.toString()%>';

        document.querySelectorAll('.date-button').forEach(button => {
            button.addEventListener('click', () => {
                // Remove active class from all buttons
                document.querySelectorAll('.date-button').forEach(btn => btn.classList.remove('active'));

                // Add active class to clicked button
                button.classList.add('active');

                // Update the selected date
                selectedDate = button.getAttribute('data-date');

                // Update all showtime links with the new date
                document.querySelectorAll('.timeTag').forEach(link => {
                    // Get the current URL
                    let currentUrl = new URL(link.href, window.location.origin);

                    // Update or add the date parameter
                    currentUrl.searchParams.set('date', selectedDate);

                    // Update the link's href
                    link.href = currentUrl.pathname + currentUrl.search;
                });

                console.log('Selected Date:', selectedDate);
            });
        });

        // Initially update all links with the default date
        document.querySelectorAll('.timeTag').forEach(link => {
            let currentUrl = new URL(link.href, window.location.origin);
            currentUrl.searchParams.set('date', selectedDate);
            link.href = currentUrl.pathname + currentUrl.search;
        });
    </script>

</body>
</html>
