package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.MovieDAO;
import org.example.demomerge.dto.Movie;

import java.io.IOException;

@WebServlet(name = "TransferDataToUpdate", value = "/TransferDataToUpdate")
public class TransferDataToUpdate extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the movie ID from the request
        String movieIdStr = request.getParameter("id");

        try {
            int movieId = Integer.parseInt(movieIdStr);

            // Fetch the movie details from your database
            MovieDAO movieDAO = new MovieDAO();
            Movie movie = movieDAO.getMovieById(movieId);

            // Set the movie as an attribute to be used in the update JSP
            request.setAttribute("movie", movie);

            // Forward to the update movie page
            request.getRequestDispatcher("/update_movie.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}