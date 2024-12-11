package org.example.demomerge.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException , ClassNotFoundException {

        //database credentials
        String url = "jdbc:mysql://localhost:3306/test1";
        String username = "root";
        String password = "scorehero";
        

        //JDBC driver class
        Class.forName("com.mysql.cj.jdbc.Driver");

        //establishing connection
        return DriverManager.getConnection(url, username, password);

    }
}
