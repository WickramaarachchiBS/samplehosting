package org.example.demomerge.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.MovieDAO;
import org.example.demomerge.dto.Movie;

import java.io.IOException;

@WebServlet(name = "SeatBookingServlet", value = "/SeatBookingServlet")
public class SeatBookingServlet extends HttpServlet {

    private MovieDAO movieDAO;

    public void init() throws ServletException {
        movieDAO = new MovieDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get movie ID from request parameter
        int movieId = Integer.parseInt(request.getParameter("id"));

        // Retrieve movie details
        Movie movie = movieDAO.getMovieById(movieId);

        // Get selected date and time
        String selectedDate = request.getParameter("date");
        String selectedTime = request.getParameter("time");

        // Set movie and selected showtime as request attribute
        request.setAttribute("movie", movie);
        request.setAttribute("selectedDate", selectedDate);
        request.setAttribute("selectedTime", selectedTime);

        //session
        HttpSession session = request.getSession(false); // Retrieve the existing session
        if (session != null) {
            session.setAttribute("mId", movieId); // Add or update the attribute
            session.setAttribute("selectedDate", selectedDate);
            session.setAttribute("selectedTime", selectedTime);
        } else {
            session = request.getSession(); // Create a new session
            session.setAttribute("mId", movieId); // Add or update the attribute
            session.setAttribute("selectedDate", selectedDate);
            session.setAttribute("selectedTime", selectedTime);
        }

        // Forward to single movie page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/seat_selection2.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}