package com.jspproject.mypage;

import com.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	PreparedStatement pstmt=null;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateMember(MemberDTO mem) throws SQLException {
        try(Connection conn = DatabaseUtil.getConnection();) {
            pstmt = conn.prepareStatement(
                "UPDATE memberTbl SET name = ?, email = ?, tel = ?, addr = ?, password = ?, score = ?, tierid = ? WHERE memberid = ?"
            );
            pstmt.setString(1, mem.getName()); // 이름
            pstmt.setString(2, mem.getEmail()); // 이메일
            pstmt.setString(3, mem.getTel()); // 전화번호
            pstmt.setString(4, mem.getAddr()); // 주소
            pstmt.setString(5, mem.getPassword()); // 비밀번호
            pstmt.setString(6, mem.getScore());
            pstmt.setString(7, mem.getTierid());
            pstmt.setString(8, mem.getMemberid()); // 회원 ID (조건)
            
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
        }
    }
	
	
	public List<MemberDTO> getRankings(String memberid) {
        List<MemberDTO> memberList = new ArrayList<>();
        try(Connection conn = DatabaseUtil.getConnection();) {

        	System.out.println("Database connection established.");
            String sql = """
                    SELECT * FROM (\r
                        SELECT *, \r
                               RANK() OVER (ORDER BY score DESC) AS ranking \r
                        FROM memberTbl\r
                    ) AS ranked\r
                    WHERE ABS(ranking - COALESCE((\r
                        SELECT ranking \r
                        FROM (\r
                            SELECT memberid, \r
                                   RANK() OVER (ORDER BY score DESC) AS ranking \r
                            FROM memberTbl\r
                        ) AS user_ranking \r
                        WHERE memberid = ?\r
                    ), 0)) <= 4\r
                    ORDER BY ranking;""";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberid);
            
            
            System.out.println("Executing SQL with memberid: " + memberid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MemberDTO member = new MemberDTO();
                member.setMemberid(rs.getString("memberid"));
                member.setName(rs.getString("name"));
                member.setScore(rs.getString("score"));
                member.setTierid(rs.getString("tierid"));
                memberList.add(member);
                
                System.out.println("Retrieved Member - ID: " + member.getMemberid() +
                        ", Name: " + member.getName() +
                        ", Score: " + member.getScore());
            }
            System.out.println("Retrieved rankings: " + memberList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
        }
        return memberList;
    }

}
