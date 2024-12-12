package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dto.Movie;
import org.example.demomerge.dao.MovieDAO;

import java.io.IOException;

@WebServlet(name = "TimetableServlet", value = "/TimetableServlet")
public class TimetableServlet extends HttpServlet {

    private MovieDAO movieDAO;

    public void init() throws ServletException {
        movieDAO = new MovieDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get movie ID from request parameter
        int movieId = Integer.parseInt(request.getParameter("id"));

        // Retrieve movie details
        Movie movie = movieDAO.getMovieById(movieId);

        // Set movie as request attribute
        request.setAttribute("movie", movie);

        //session
        HttpSession session = request.getSession(false); // Retrieve the existing session
        if (session != null) {
            session.setAttribute("mId", movieId); // Add or update the attribute
        } else {
            session = request.getSession(); // Create a new session
            session.setAttribute("mId", movieId); // Add or update the attribute
        }

        // Forward to timetable jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/timetable.jsp");
        dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}