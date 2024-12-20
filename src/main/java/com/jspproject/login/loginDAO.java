package com.jspproject.login;

import com.jspproject.util.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDAO {

    public loginDTO validateUser(String id, String password) {
        String SQL = "SELECT * FROM memberTbl WHERE memberid = ? AND password = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                loginDTO user = new loginDTO();
                user.setUsername(rs.getString("memberid"));
                user.setPassword(rs.getString("password"));
                // 필요한 추가 정보 설정 가능
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 사용자 인증 실패 시 null 반환
    }
}