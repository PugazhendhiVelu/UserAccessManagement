package com.user.web.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");
        

        String jdbcUrl = "jdbc:postgresql://localhost:5432/management_system";
        String username = "postgres"; 
        String password = "Pugazh"; 

        return DriverManager.getConnection(jdbcUrl, username, password);
    }
}
