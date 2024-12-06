package com.heetae.jspproject.join;

import com.heetae.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class joinDAO {

    // 회원 가입 메서드
    public int registerUser(joinDTO member) {
        String SQL = "INSERT INTO members(user_id, password, name, phone_number, email) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            // PreparedStatement에 파라미터 설정
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getTel());
            pstmt.setString(5, member.getEmail());

            // 쿼리 실행 및 결과 반환
            return pstmt.executeUpdate(); // 성공적으로 실행된 경우 1 이상의 값 반환

        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // 오류 발생 시 -1 반환
        }
    }
}