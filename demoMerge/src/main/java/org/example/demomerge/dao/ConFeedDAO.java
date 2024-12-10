package org.example.demomerge.dao;

import org.example.demomerge.connection.DBConnection;
import org.example.demomerge.dto.Contact_Feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ConFeedDAO {
    public void addContact(Contact_Feedback cf) {

        String query = "INSERT INTO contactus(name, email, message) VALUES (?,?,?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            //set parameters
            stmt.setString(1, cf.getName());
            stmt.setString(2, cf.getEmail());
            stmt.setString(3, cf.getMessage());

            stmt.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
        }

    }
}
