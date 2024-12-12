package com.jspproject.dashboard;

import com.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

public class UserboardDAO {

    // 데이터 삽입
    public void insertBoard(UserboardDTO board) {
        String insertBoardSQL = "INSERT INTO user_board (name, time) VALUES (?, ?)";
        String insertCategorySQL = "INSERT INTO user_board_category (user_board_id, category_name) VALUES (?, ?)";
        String insertStatusSQL = "INSERT INTO user_board_status (user_board_id, status_name) VALUES (?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement boardStmt = conn.prepareStatement(insertBoardSQL, Statement.RETURN_GENERATED_KEYS);
             PreparedStatement categoryStmt = conn.prepareStatement(insertCategorySQL);
             PreparedStatement statusStmt = conn.prepareStatement(insertStatusSQL)) {

            // 1. user_board 테이블에 데이터 삽입
            boardStmt.setString(1, board.getName());
            boardStmt.setString(2, board.getTime());
            boardStmt.executeUpdate();

            // 2. 생성된 user_board의 ID 가져오기
            ResultSet rs = boardStmt.getGeneratedKeys();
            int userBoardId = 0;
            if (rs.next()) {
                userBoardId = rs.getInt(1);
            }

            // 3. user_board_category 테이블에 데이터 삽입
            categoryStmt.setInt(1, userBoardId);
            categoryStmt.setString(2, board.getCategory());
            categoryStmt.executeUpdate();

            // 4. user_board_status 테이블에 데이터 삽입
            statusStmt.setInt(1, userBoardId);
            statusStmt.setString(2, board.getStatus());
            statusStmt.executeUpdate();

            System.out.println("데이터가 성공적으로 DB에 저장되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
