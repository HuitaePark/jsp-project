package com.heetae.jspproject.admin.model;

import com.heetae.jspproject.util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public List<ReviewDTO> getAllReviews() {
        List<ReviewDTO> reviewList = new ArrayList<>();
        String sql = "SELECT r.*, m.name FROM reviews r JOIN members m ON r.member_id = m.member_id";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ReviewDTO review = new ReviewDTO();
                review.setReviewId(rs.getInt("review_id"));
                review.setMemberId(rs.getInt("member_id"));
                review.setMemberName(rs.getString("name"));
                review.setExerciseName(rs.getString("exercise_name"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setCreatedAt(rs.getTimestamp("created_at"));
                reviewList.add(review);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reviewList;
    }

    // 필요에 따라 리뷰 추가, 수정, 삭제 메서드도 구현할 수 있습니다.
}