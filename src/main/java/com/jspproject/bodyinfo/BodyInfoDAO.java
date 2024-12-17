package com.jspproject.bodyinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.jspproject.util.DatabaseUtil;

public class BodyInfoDAO {

    public BodyInfoDAO() {
        // DatabaseUtil에서 드라이버를 로드하므로 별도의 드라이버 로딩이 필요 없습니다.
    }

    public void saveBodyInfo(BodyInfoDTO bodyInfo) {
        String sql = "INSERT INTO MemberHealthInfo (memberid, height, weight, gender, age, bmi) " +
                "VALUES (?, ?, ?, ?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE " +
                "height = VALUES(height), " +
                "weight = VALUES(weight), " +
                "gender = VALUES(gender), " +
                "age = VALUES(age), " +
                "bmi = VALUES(bmi)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, bodyInfo.getMemberid());
            pstmt.setString(2, bodyInfo.getHeight());
            pstmt.setString(3, bodyInfo.getWeight());
            pstmt.setString(4, bodyInfo.getGender());
            pstmt.setString(5, bodyInfo.getAge());
            pstmt.setString(6, bodyInfo.getBMI());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Body info inserted/updated successfully for member_id: " + bodyInfo.getMemberid());
            }

        } catch (SQLException e) {
            System.err.println("Error saving body info for member_id: " + bodyInfo.getMemberid());
            e.printStackTrace();
        }
    }
}