package com.heetae.jspproject.admin.model;

import com.heetae.jspproject.util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

    public List<MemberDTO> getAllMembers() {
        List<MemberDTO> memberList = new ArrayList<>();
        String sql = "SELECT * FROM members";

        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                MemberDTO member = new MemberDTO();
                member.setMemberId(rs.getInt("member_id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setAddress(rs.getString("address"));
                member.setPhoneNumber(rs.getString("phone_number"));
                member.setCreatedAt(rs.getTimestamp("created_at"));
                memberList.add(member);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return memberList;
    }


}