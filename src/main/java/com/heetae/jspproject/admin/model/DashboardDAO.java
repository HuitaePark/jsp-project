package com.heetae.jspproject.admin.model;

import com.heetae.jspproject.admin.util.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {

    public DashboardDTO getDashboardData() {
        DashboardDTO dto = new DashboardDTO();

        String visitorSql = "SELECT COUNT(*) FROM visitors"; // 방문자 수 테이블
        String memberSql = "SELECT COUNT(*) FROM members";
        String reviewSql = "SELECT COUNT(*) FROM reviews";

        try (Connection conn = DatabaseUtil.getConnection()) {

            // 방문자 수 조회
            try (PreparedStatement stmt = conn.prepareStatement(visitorSql);
                 ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    dto.setVisitorCount(rs.getInt(1));
                }
            }

            // 회원 수 조회
            try (PreparedStatement stmt = conn.prepareStatement(memberSql);
                 ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    dto.setMemberCount(rs.getInt(1));
                }
            }

            // 리뷰 수 조회
            try (PreparedStatement stmt = conn.prepareStatement(reviewSql);
                 ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    dto.setReviewCount(rs.getInt(1));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
}