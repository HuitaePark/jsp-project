package com.jspproject.sub;

import com.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ReviewDAO {

    // 리뷰 조회
    public List<ReviewDTO> getReviewsByWorkoutId(String currentUserId, int workoutId) throws SQLException {
        List<ReviewDTO> reviews = new ArrayList<>();
        String sql = "SELECT r.*, " +
                "(SELECT COUNT(*) FROM likes WHERE review_id = r.review_id) AS like_count, " +
                "(SELECT COUNT(*) FROM dislikes WHERE review_id = r.review_id) AS dislike_count, " +
                "(SELECT COUNT(*) FROM likes WHERE review_id = r.review_id AND member_id = ?) AS user_liked, " +
                "(SELECT COUNT(*) FROM dislikes WHERE review_id = r.review_id AND member_id = ?) AS user_disliked " +
                "FROM reviews r WHERE r.workout_id = ? ORDER BY r.created_at DESC";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, currentUserId != null ? currentUserId : "");
            pstmt.setString(2, currentUserId != null ? currentUserId : "");
            pstmt.setInt(3, workoutId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ReviewDTO review = new ReviewDTO();
                    review.setReviewId(rs.getInt("review_id"));
                    review.setMemberId(rs.getString("member_id"));
                    review.setExerciseName(rs.getString("exercise_name")); // exercise_name 세팅
                    review.setRating(rs.getInt("rating")); // rating 세팅
                    review.setComment(rs.getString("comment"));
                    review.setWorkoutId(rs.getInt("workout_id")); // workout_id 세팅
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    review.setLikeCount(rs.getInt("like_count"));
                    review.setDislikeCount(rs.getInt("dislike_count"));
                    review.setUserLiked(rs.getInt("user_liked") > 0);
                    review.setUserDisliked(rs.getInt("user_disliked") > 0);

                    reviews.add(review);
                }
            }
        }
        return reviews;
    }

    // 리뷰 등록 메서드 추가
    public void insertReview(ReviewDTO review) throws SQLException {
        String sql = "INSERT INTO reviews (member_id, exercise_name, rating, comment, workout_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, review.getMemberId());
            pstmt.setString(2, review.getExerciseName());
            pstmt.setInt(3, review.getRating());
            pstmt.setString(4, review.getComment());
            pstmt.setInt(5, review.getWorkoutId());

            pstmt.executeUpdate();
        }
    }
}