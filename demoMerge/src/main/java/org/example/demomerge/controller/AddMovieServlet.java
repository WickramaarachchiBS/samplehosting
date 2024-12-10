package org.example.demomerge.controller;
import org.example.demomerge.dao.MovieDAO;
import org.example.demomerge.dto.Movie;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.annotation.MultipartConfig;


@WebServlet(name = "AddMovieServlet", value = "/AddMovieServlet")
@MultipartConfig
public class AddMovieServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "C:/Users/USER/Desktop/demoMerge/demoMerge/src/main/webapp/Assets"; // Your existing directory name

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //create object from Movie
            Movie mov = new Movie();


            //retrieve data from the form
            mov.setId(Integer.parseInt(request.getParameter("id")));
            mov.setTitle(request.getParameter("movieName"));
            mov.setPrice(request.getParameter("moviePrice"));
            mov.setDesc(request.getParameter("movieDesc"));
            mov.setGenre(request.getParameter("movieGenre"));
            mov.setDuration(request.getParameter("movieDuration"));

            //handle file upload
            Part filePart = request.getPart("cardImage");
            if (filePart != null && filePart.getSize() > 0) {

                // Use original filename directly
                String fileName = filePart.getSubmittedFileName();

                //define upload directory
                File uploadDir = new File(UPLOAD_DIRECTORY);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                //save the file
                String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
                filePart.write((filePath));

                // Store the relative path in database
                mov.setImagePath(UPLOAD_DIRECTORY + "/" + fileName);
            }
            //save to database
            MovieDAO md = new MovieDAO();
            md.addMovie(mov);

            // Redirect to success page
            request.setAttribute("popupMessage", "Movie Added Successfully!");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}