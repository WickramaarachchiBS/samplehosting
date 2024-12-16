package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "SeatBookingServlet2", value = "/SeatBookingServlet2")
public class SeatBookingServlet2 extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String totalPrice = request.getParameter("totalPrice");
        request.setAttribute("totalPrice", totalPrice);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String movieIdStr = request.getParameter("movieId");
        String selectedSeats = request.getParameter("selectedSeats");
        String totalPrice = request.getParameter("totalPrice");

        if (movieIdStr == null || movieIdStr.isEmpty() || selectedSeats == null || selectedSeats.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters.");
            return;
        }

        int movieId = Integer.parseInt(movieIdStr);
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String movieTitle = "";
        String movieImage = "";
        String showTime = "";

        try {
            // Get movie details from the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "scorehero");
            String movieQuery = "SELECT mname, image_path, showtime FROM movies WHERE mid = ?";
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

            // Book selected seats in the database
            String[] seats = selectedSeats.split(",");
            String updateSeatsQuery = "UPDATE seats SET is_available = 0 WHERE movie_id = ? AND seat_number = ? AND is_available = 1";
            pstmt = con.prepareStatement(updateSeatsQuery);
            for (String seat : seats) {
                pstmt.setInt(1, movieId);
                pstmt.setInt(2, Integer.parseInt(seat));
                pstmt.executeUpdate();
            }

            // Redirect to the payment page with seat and movie details
            double seatPriceInDollars = 1000;
            double totalPriceInDollars = seats.length * seatPriceInDollars;

            request.setAttribute("movieTitle", movieTitle);
            request.setAttribute("showtime", showTime);
            request.setAttribute("movieImage", movieImage);
            request.setAttribute("totalPrice", totalPriceInDollars);
            request.setAttribute("selectedSeats", selectedSeats);

            RequestDispatcher dispatcher = request.getRequestDispatcher("payment2.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}