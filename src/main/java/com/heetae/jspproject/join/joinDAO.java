package com.heetae.jspproject.join;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class joinDAO {
    private Connection conn;

    public joinDAO() {
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

    public int registerUser(joinDTO user) {
        String SQL = "INSERT INTO members(user_id, password, name, phone_number, email) VALUES (?, ?, ?, ?, ?)";
        try {
            System.out.println("ID: " + user.getId());
            System.out.println("Password: " + user.getPassword());
            System.out.println("Name: " + user.getName());
            System.out.println("Tel: " + user.getTel());
            System.out.println("Email: " + user.getEmail());

            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getTel());
            pstmt.setString(5, user.getEmail());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; 
    }
}
