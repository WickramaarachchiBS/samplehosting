package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.connection.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "FeedbackServlet", value = "/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Capture feedback form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedbackText = request.getParameter("feedback");

        System.out.println(name);

        String query = "INSERT INTO feedback (name, email, feedback_text, date) VALUES (?, ?, ?, NOW())";

        try (Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {

            // Set parameters
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, feedbackText);

            // Execute the statement
            stmt.executeUpdate();

            // Redirect to the feedback page
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/pay_confirm.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}