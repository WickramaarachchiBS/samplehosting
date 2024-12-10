package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.MovieDAO;
import org.example.demomerge.dto.Movie;

import java.io.IOException;

@WebServlet(name = "DeleteMovieServlet", value = "/DeleteMovieServlet")
public class DeleteMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get movie ID from request parameter
        int movieId = Integer.parseInt(request.getParameter("id"));

        //System.out.println(movieId);

        MovieDAO movieDAO = new MovieDAO();

        try {
            boolean isDeleted = movieDAO.deleteMovie(movieId);

            if (isDeleted) {

                // Set a success message and forward to the success page
                request.setAttribute("message", "Movie Deleted Successfully");
                request.getRequestDispatcher("RetrieveAdminMovieServlet").forward(request, response);

            }else {
                request.setAttribute("message", "Movie not found or could not be deleted");
                request.getRequestDispatcher("RetrieveAdminMovieServlet").forward(request, response);
            }

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}