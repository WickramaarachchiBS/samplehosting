package org.example.demomerge.dao;

import org.example.demomerge.connection.DBConnection;
import org.example.demomerge.dto.Movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
    public void addMovie(Movie mov){

        String query = "INSERT INTO movies(mid, mname, price, description, image_path, genre, duration) VALUES (?,?,?,?,?,?,?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            //set parameters
            stmt.setInt(1, mov.getId());
            stmt.setString(2, mov.getTitle());
            stmt.setString(3, mov.getPrice());
            stmt.setString(4, mov.getDesc());
            stmt.setString(5, mov.getImagePath());
            stmt.setString(6, mov.getGenre());
            stmt.setString(7, mov.getDuration());

            stmt.executeUpdate();


        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean deleteMovie(int movieId){

        String query = "DELETE FROM movies WHERE mid = ?";

        try (Connection conn = DBConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, movieId);
            int rowsAffected = stmt.executeUpdate();

            return rowsAffected > 0;

        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateMovie(Movie mov){

        String query = "UPDATE movies SET mname = ?, price = ?, description = ?, image_path= ?, genre = ?, duration = ?  WHERE mid = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            //set parameters
            stmt.setString(1, mov.getTitle());
            stmt.setString(2, mov.getPrice());
            stmt.setString(3, mov.getDesc());
            stmt.setString(4, mov.getImagePath());
            stmt.setString(5, mov.getGenre());
            stmt.setString(6, mov.getDuration());
            stmt.setInt(7, mov.getId());

            stmt.executeUpdate();


        }catch (Exception e) {
            e.printStackTrace();
        }
    }


    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();

        String query = "SELECT * FROM movies";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Movie movie = new Movie();

                movie.setId(rs.getInt("mid"));
                movie.setTitle(rs.getString("mname"));
                movie.setPrice(rs.getString("price"));
                movie.setDesc(rs.getString("description"));
                movie.setImagePath(rs.getString("image_path"));
                movie.setGenre(rs.getString("genre"));
                movie.setDuration(rs.getString("duration"));

                String fullPath = rs.getString("image_path");
                String relativePath = fullPath.substring(fullPath.lastIndexOf("webapp/") + 7);
                movie.setImagePath(relativePath);

                movies.add(movie);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public Movie getMovieById(int id) {

        Movie movie = null;

        String query = "SELECT * FROM movies WHERE mid = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    movie = new Movie();

                    movie.setId(rs.getInt("mid"));
                    movie.setTitle(rs.getString("mname"));
                    movie.setPrice(rs.getString("price"));
                    movie.setDesc(rs.getString("description"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setDuration(rs.getString("duration"));

                    String fullPath = rs.getString("image_path");
                    String relativePath = fullPath.substring(fullPath.lastIndexOf("webapp/") + 7);
                    movie.setImagePath(relativePath);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }
}
