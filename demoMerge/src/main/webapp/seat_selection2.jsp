<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Seat Booking</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #141414;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
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
            max-width: 900px;
            width: 100%;
            background: linear-gradient(145deg, #1e1e1e, #000000);
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        .movie-details {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #1f1f1f;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .movie-details .movie-image img {
            width: 150%;
            max-width: 150px; /* Adjust this value to make the image smaller */
            height: auto;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
            margin-bottom: 15px;
        }


        .movie-details h1, .movie-details p {
            margin: 10px 0;
            color: #ffb400;
        }

        .seat-grid {
            display: grid;
            grid-template-columns: repeat(10, 1fr); /* 10 seats per row */
            gap: 15px;
            justify-content: center;
            margin: 20px auto;
        }

        .seat {
            padding: 20px 0;
            border: 1px solid #ff9800;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            cursor: pointer;
            background-color: #1e1e1e;
            transition: all 0.3s ease;
            color: #ff9800;
        }

        .seat.available:hover {
            background-color: #ffb400;
        }

        .seat.selected {
            background-color: #ffeb3b; /* Bright golden for selected seats */
            color: #000;
        }

        .seat.unavailable {
            background-color: #f44336; /* Red for unavailable seats */
            color: #fff;
            cursor: not-allowed;
        }

        .summary {
            margin-top: 20px;
            font-size: 18px;
            color: #ffb400;
        }

        button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 18px;
            color: #fff;
            background-color: #ff9800;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #e65100;
        }

        @media (max-width: 768px) {
            .seat-grid {
                grid-template-columns: repeat(5, 1fr); /* 5 seats per row on smaller screens */
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Seat Booking</h2>

    <%
        int movieId = Integer.parseInt(request.getParameter("id"));
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String movieTitle = "", movieImage = "", showTime = "";

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "scorehero");

            // Query to fetch the movie details
            String movieQuery = "SELECT * FROM movies WHERE mid = ?";
            pstmt = con.prepareStatement(movieQuery);
            pstmt.setInt(1, movieId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                movieTitle = rs.getString("mname");
                showTime = rs.getString("showtime");

                String fullPath = rs.getString("image_path");
                String relativePath = fullPath.substring(fullPath.lastIndexOf("webapp/") + 7);
                movieImage = relativePath;
            }

            String sessionData = (String) session.getAttribute("selectedDate");
    %>
    <div class="movie-details">
        <div class="movie-image">
            <img src=" <%=movieImage%> " alt="Movie Image">
        </div>
        <h1><%= movieTitle %></h1>

        <p>Showtime: ${sessionScope.selectedDate}, ${sessionScope.selectedTime}</p>
    </div>

    <div class="seat-grid">
        <%
                // Query to fetch the seats availability for the selected movie
                String seatQuery = "SELECT seat_number, is_available FROM seats WHERE movie_id = ? ORDER BY seat_number";
                pstmt = con.prepareStatement(seatQuery);
                pstmt.setInt(1, movieId);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int seatNumber = rs.getInt("seat_number");
                    int isAvailable = rs.getInt("is_available");
                    String seatClass = isAvailable == 1 ? "available" : "unavailable";

                    // Display the seat number
                    out.println("<div class='seat " + seatClass + "' data-seat='" + seatNumber + "'>" + seatNumber + "</div>");
                }
            } catch (SQLException e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (con != null) try { con.close(); } catch (SQLException e) {}
            }
        %>
    </div>

    <div class="summary">
        Total Price: Rs.<span id="totalPrice">0.00</span> <br>
        <p class="ppperson" style="color: #ea861a; font-size: small"> Price per person : $10 </p>


        <form action="SeatBookingServlet2" method="POST">
            <input type="hidden" name="movieId" value="<%= movieId %>" />
            <input type="hidden" name="selectedSeats" id="selectedSeats" />
            <input type="hidden" id="hiddenTotalPrice" name="totalPrice" value="0.00">
            <button type="submit">Proceed to Payment</button>
        </form>
    </div>
</div>

<script>
    let selectedSeats = [];
    const seatPrice = 1000; // Price per seat
    const totalPriceElem = document.getElementById('totalPrice');

    document.querySelectorAll('.seat.available').forEach(seat => {
        seat.addEventListener('click', function () {
            const seatNumber = this.getAttribute('data-seat');

            if (selectedSeats.includes(seatNumber)) {
                selectedSeats = selectedSeats.filter(seat => seat !== seatNumber);
                this.classList.remove('selected');
            } else {
                selectedSeats.push(seatNumber);
                this.classList.add('selected');
            }

            document.getElementById('selectedSeats').value = selectedSeats.join(',');
            totalPriceElem.textContent = (selectedSeats.length * seatPrice).toFixed(2);
        });
    });
</script>
<script>
    // JavaScript function to set the hidden input value before form submission
    function sendTotalPrice() {
        const totalPrice = document.getElementById("totalPrice").innerText; // Get the totalPrice text
        document.getElementById("hiddenTotalPrice").value = parseFloat(totalPrice); // Update hidden input
        return true; // Allow form submission
    }
</script>
</body>
</html>
