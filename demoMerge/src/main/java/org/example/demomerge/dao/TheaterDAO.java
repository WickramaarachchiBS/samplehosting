package org.example.demomerge.dao;

import org.example.demomerge.connection.DBConnection;
import org.example.demomerge.dto.Theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TheaterDAO {

    public List<Theater> getTheatersForMovie(int movieId, String selectedDate) throws SQLException, ClassNotFoundException {

        List<Theater> theaters = new ArrayList<>();

        String query = "SELECT t.theater_id, t.theater_name, ts.time_slot " +
                       "FROM theaters t " +
                       "JOIN showtimes ts ON t.theater_id = ts.theater_id " +
                       "WHERE ts.movie_id = ? AND ts.showtime_date = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, movieId);
            stmt.setString(2, selectedDate);

            try (ResultSet rs = stmt.executeQuery()) {
                int currentTheaterId = -1;
                Theater currentTheater = null;

                while (rs.next()) {
                    int theaterId = rs.getInt("theater_id");
                    String theaterName = rs.getString("theater_name");
                    String timeSlot = rs.getString("time_slot");

                    if (currentTheaterId != theaterId) {
                        if (currentTheater != null) {
                            theaters.add(currentTheater);
                        }
                        currentTheater = new Theater(theaterId, theaterName, new ArrayList<>());
                        currentTheaterId = theaterId;
                    }

                    if (currentTheater != null) {
                        currentTheater.getTimeSlots().add(timeSlot);
                    }
                }
                if (currentTheater != null) {
                    theaters.add(currentTheater);
                }
            }
        }
        return theaters;
    }
}
