package com.jspproject.admin.model;

import com.jspproject.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public List<ReviewDTO> getAllReviews() {
        List<ReviewDTO> reviewList = new ArrayList<>();
        String sql = "SELECT review_id, member_id, exercise_name, rating, comment, created_at " +
                "FROM reviews";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ReviewDTO review = new ReviewDTO();
                review.setReviewId(rs.getInt("review_id"));
                review.setMemberId(rs.getString("member_id"));
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

}