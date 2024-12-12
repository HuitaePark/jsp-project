package com.jspproject.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/fitness_db"; // 실제 데이터베이스 이름으로 변경
    private static final String USERNAME = "root"; // 실제 사용자 이름으로 변경
    private static final String PASSWORD = "26323174"; // 실제 비밀번호로 변경

    static {
        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8.x 사용 시
            // MySQL 5.x 사용 시 "com.mysql.jdbc.Driver" 사용
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
