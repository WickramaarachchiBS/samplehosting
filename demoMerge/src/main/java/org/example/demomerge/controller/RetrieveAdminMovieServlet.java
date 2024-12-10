package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.MovieDAO;
import org.example.demomerge.dto.Movie;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RetrieveAdminMovieServlet", value = "/RetrieveAdminMovieServlet")
public class RetrieveAdminMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MovieDAO dao = new MovieDAO();
        List<Movie> movies = dao.getAllMovies();
        request.setAttribute("movies", movies);

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
        dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}