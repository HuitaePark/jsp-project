package com.heetae.jspproject.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDAO {
    private Connection conn;

    public loginDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/fitness_db";
            String dbID = "root";
            String dbPassword = "26323174";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean validateUser(String id, String password) {
        String SQL = "SELECT * FROM members WHERE user_id = ? AND password = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
