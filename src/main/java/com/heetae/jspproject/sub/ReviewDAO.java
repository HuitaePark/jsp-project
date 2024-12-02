package com.heetae.jspproject.sub;

import com.heetae.jspproject.admin.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ReviewDAO {
    public List<ReviewDTO> getReviews(String currentUserId) throws SQLException {
        List<ReviewDTO> reviews = new ArrayList<>();
        String sql = "SELECT r.*, " +
                "(SELECT COUNT(*) FROM likes WHERE review_id = r.review_id) AS like_count, " +
                "(SELECT COUNT(*) FROM dislikes WHERE review_id = r.review_id) AS dislike_count, " +
                "(SELECT COUNT(*) FROM likes WHERE review_id = r.review_id AND member_id = ?) AS user_liked, " +
                "(SELECT COUNT(*) FROM dislikes WHERE review_id = r.review_id AND user_id = ?) AS user_disliked " +
                "FROM reviews r";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {



            pstmt.setString(1, currentUserId != null ? currentUserId : "");
            pstmt.setString(2, currentUserId != null ? currentUserId : "");

            ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    ReviewDTO review = new ReviewDTO();
                    review.setReviewId(rs.getInt("review_id"));
                    review.setMemberId(rs.getString("member_id"));
                    review.setComment(rs.getString("comment"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    review.setLikeCount(rs.getInt("like_count"));
                    review.setDislikeCount(rs.getInt("dislike_count"));
                    review.setUserLiked(rs.getInt("user_liked") > 0);
                    review.setUserDisliked(rs.getInt("user_disliked") > 0);

                    reviews.add(review);
            }
        }
        return reviews;
    }
}
