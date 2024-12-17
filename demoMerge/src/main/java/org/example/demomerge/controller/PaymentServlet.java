package org.example.demomerge.controller;

import com.mysql.cj.Session;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;


@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    // Database details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/test1";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "scorehero";

    // Email details
    private static final String EMAIL_FROM = "verusatharasinghapersonal@gmail.com";
    private static final String EMAIL_PASSWORD = "umxd kevv dinz bbhe";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String movieTitle = request.getParameter("movieTitle");
        String selectedSeats = request.getParameter("selectedSeats");
        String totalPrice = request.getParameter("totalPrice");
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        System.out.println(movieTitle);
        System.out.println(totalPrice);
        System.out.println(username);
        System.out.println(email);

        sendConfirmationEmail(email, username, movieTitle, selectedSeats);

        // Simulate payment processing
        boolean paymentSuccessful = processPayment(
                request.getParameter("cardNumber"),
                request.getParameter("expiryDate"),
                request.getParameter("cvv"));

        if (paymentSuccessful) {
            // Save booking details in the database
            if (saveBookingDetails(movieTitle, selectedSeats, totalPrice, username, email)) {
                // Send confirmation email
//                sendConfirmationEmail(email, username, movieTitle, selectedSeats, totalPrice);

                // Redirect to confirmation page
                response.sendRedirect("pay_confirm.jsp");
            } else {
                response.getWriter().println("Error storing booking details. Please try again.");
            }
        } else {
            response.getWriter().println("Payment failed. Please check your card details and try again.");
        }
    }

    private boolean processPayment(String cardNumber, String expiryDate, String cvv) {
        // Mock payment success logic
        return cardNumber != null && expiryDate != null && cvv != null &&
                cardNumber.length() == 16 && expiryDate.matches("\\d{2}/\\d{2}") && cvv.length() == 3;
    }

    private boolean saveBookingDetails(String movieTitle, String selectedSeats, String totalPrice, String username, String email) {

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO bookings (movieTitle, selectedSeats, totalPrice, username, email) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, movieTitle);
            stmt.setString(2, selectedSeats);
            stmt.setString(3, totalPrice);
            stmt.setString(4, username);
            stmt.setString(5, email);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    private void sendConfirmationEmail(String to, String email, String movieTitle, String selectedSeats) {

        // Email properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        jakarta.mail.Session session = jakarta.mail.Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_FROM, EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Booking Confirmation");
            message.setText(String.format(
                    "Hello %s,\n\nThank you for booking!\n\nMovie: %s\nSeats: %s\nTotal Price: $%s\n\nEnjoy your movie!\n\nBest Regards,\nCinema Team",
                    email, movieTitle, selectedSeats));

            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}