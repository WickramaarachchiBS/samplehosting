package org.example.demomerge.dao;

import org.example.demomerge.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
    public boolean adminLogin(String email, String password) {

        String query = "SELECT * FROM admindetails WHERE email=? AND password=?";

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
