package com.heetae.jspproject.mypage;

import com.heetae.jspproject.admin.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDAO {
	

	public int updateMember(MemberDTO mem) throws SQLException {
        String SQL = "UPDATE members SET name = ?, email = ?, phone_number = ?, address = ?, password = ? WHERE user_id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)){


            pstmt.setString(1, mem.getName()); // 이름
            pstmt.setString(2, mem.getEmail()); // 이메일
            pstmt.setString(3, mem.getTel()); // 전화번호
            pstmt.setString(4, mem.getAddr()); // 주소
            pstmt.setString(5, mem.getPassword()); // 비밀번호
            pstmt.setString(6, mem.getMemberid()); // 회원 ID (조건)

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // 오류 발생 시 -1 반환
        }
    }

}
