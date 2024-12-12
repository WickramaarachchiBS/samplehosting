package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.MovieDAO;
import org.example.demomerge.dto.Movie;

import java.io.IOException;

@WebServlet(name = "MovieDetailServlet", value = "/MovieDetailServlet")
public class MovieDetailServlet extends HttpServlet {
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

        // Forward to single movie page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/single_movie.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}