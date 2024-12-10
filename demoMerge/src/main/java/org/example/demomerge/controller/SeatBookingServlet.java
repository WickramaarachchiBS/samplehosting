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

        // Print movie details to console
        System.out.println("Movie Details:");
        System.out.println("-------------");
        System.out.println("Movie ID: " + movie.getId());
        System.out.println("Title: " + movie.getTitle());
        System.out.println("Description: " + movie.getDesc());
        System.out.println("Price: " + movie.getPrice());
        System.out.println("Image Path: " + movie.getImagePath());
        System.out.println("Genre: " + movie.getGenre());
        System.out.println("Duration: " + movie.getDuration());

        System.out.println("\nSelected Date: " + selectedDate);
        System.out.println("Selected Time: " + selectedTime);
//
//        // Forward to single movie page
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/seat_booking.jsp");
//        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}