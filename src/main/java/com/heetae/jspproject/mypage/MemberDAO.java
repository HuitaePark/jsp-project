package com.heetae.jspproject.mypage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDAO {
	String jdbcDriver="jdbc:mysql://localhost:3306/fitness_db?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8"; //DB서버,db명
	String dbUser="root"; //계정
	String dbPass="admin"; //비번
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	public MemberDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateMember(MemberDTO mem) throws SQLException {
        try {
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            pstmt = conn.prepareStatement(
                "UPDATE members SET name = ?, email = ?, phone_number = ?, address = ?, password = ? WHERE member_id = ?"
            );
            pstmt.setString(1, mem.getName()); // 이름
            pstmt.setString(2, mem.getEmail()); // 이메일
            pstmt.setString(3, mem.getTel()); // 전화번호
            pstmt.setString(4, mem.getAddr()); // 주소
            pstmt.setString(5, mem.getPassword()); // 비밀번호
            pstmt.setString(6, mem.getMemberid()); // 회원 ID (조건)
            //pstmt.executeUpdate();
            
            int rowsUpdated = pstmt.executeUpdate(); // 업데이트된 행의 수 반환
            if (rowsUpdated == 0) {
                System.out.println("업데이트 실패: 해당 memberid가 존재하지 않습니다.");
                throw new SQLException("업데이트된 행이 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

}
