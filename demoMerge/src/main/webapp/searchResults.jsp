<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Search Results</title>
    <style>
        body {
            background-color: #1e1e1e;
            color: #f4c542;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #f4c542;
        }

        .search-bar {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px;
        }

        .search-input {
            padding: 10px;
            font-size: 16px;
            width: 300px;
            border: 2px solid #f4c542;
            border-radius: 8px;
            background-color: #333;
            color: #fff;
        }

        .search-button {
            padding: 10px 20px;
            margin-left: 10px;
            font-size: 16px;
            background-color: #f4c542;
            color: #1e1e1e;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-button:hover {
            background-color: #d4a430;
        }

        .movie-results {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 10px;
        }

        .movie-item {
            width: 240px;
            margin: 15px;
            background-color: #2a2a2a;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .movie-item:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.5);
        }

        .movie-poster {
            width: 160px;
            height: 220px;
            border-radius: 8px;
        }

        .movie-item h3 {
            font-size: 20px;
            margin: 10px 0;
            color: #f4c542;
        }

        .movie-item p {
            font-size: 14px;
            color: #ccc;
        }

        @media (max-width: 768px) {
            .search-input {
                width: 200px;
            }

            .movie-item {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .movie-item {
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
<h1>Search Results</h1>
<div class="search-bar">
    <input type="text" placeholder="Search for movies..." class="search-input">
    <button class="search-button">Search</button>
</div>
<div class="movie-results">
    <%
        // Get the search query from the GET request
        String query = request.getParameter("query");

        // Database connection setup
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Assuming you have a JDBC connection method
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "scorehero");
            String sql = "SELECT * FROM movies WHERE mname LIKE ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + query + "%");
            rs = ps.executeQuery();

            // Check if there are results
            if (!rs.isBeforeFirst()) {
                out.println("<p>No movies found for your search query.</p>");
            } else {
                while (rs.next()) {
                    String movieTitle = rs.getString("mname");
                    String movieDescription = rs.getString("description");
                    String movieShowtime = rs.getString("showtime");

                    String fullPath = rs.getString("image_path");
                    String relativePath = fullPath.substring(fullPath.lastIndexOf("webapp/") + 7);
                    String movieImageUrl = request.getContextPath() + "/" + relativePath;
    %>

    <div class="movie-item">
        <img src="<%= movieImageUrl %>" alt="<%= movieTitle %> Poster" class="movie-poster">
        <h3><%= movieTitle %></h3>
        <p><%= movieDescription %></p>
        <p>Showtime: <%= movieShowtime %></p>
    </div>
    <%
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</div>
</body>
</html>
