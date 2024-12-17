package org.example.demomerge.controller;

import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "TempServlet", value = "/TempServlet")
public class TempServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String totalPrice = request.getParameter("totalPrice");
        String movieTitle = request.getParameter("movieTitle");
        String selectedSeats = request.getParameter("selectedSeats");

        sendConfirmationEmail(email, movieTitle, selectedSeats, totalPrice);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/feedback.jsp");
        rd.forward(request, response);

    }
    // Email details
    private static final String EMAIL_FROM = "verusatharasinghapersonal@gmail.com";
    private static final String EMAIL_PASSWORD = "umxd kevv dinz bbhe";


    private void sendConfirmationEmail(String to, String movieTitle, String selectedSeats, String totalPrice) {

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
                    "Hello ,\n\nThank you for booking!\n\nMovie: %s\nSeats: %s\nTotal Price: $%s\n\nEnjoy your movie!\n\nBest Regards,\nCinema Team",
                     movieTitle, selectedSeats, totalPrice));

            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}