package org.example.demomerge.dao;

import org.example.demomerge.connection.DBConnection;
import org.example.demomerge.dto.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO {
    public void register(Customer cus) throws SQLException, ClassNotFoundException {

        String query = "INSERT INTO customer (full_name, NIC, email, phone, password) VALUES (?,?,?,?,?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Set parameters for the prepared statement
            stmt.setString(1, cus.getName());
            stmt.setString(2, cus.getNIC());
            stmt.setString(3, cus.getEmail());
            stmt.setString(4, cus.getPhone());
            stmt.setString(5, cus.getPassword());

            // Execute the insert operation
            int rowsAffected = stmt.executeUpdate();

            // Optionally, you can check if the insertion was successful
            if (rowsAffected > 0) {
                System.out.println("Customer registered successfully.");
            } else {
                System.out.println("Customer registration failed.");
            }


        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean login(String email, String password) {

        String query = "SELECT * FROM customer WHERE email=? AND password=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            //set parameters
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return true;
            }

        }catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
