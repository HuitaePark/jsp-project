package com.jspproject.sub;

import com.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RatingDAO {
    public void insertWorkoutScore(RatingDTO score) throws SQLException {
        String sql = "INSERT INTO workout_score (workout_id, member_id, pumping, difficulty, rarity, safety, weight) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, score.getWorkoutId());
            pstmt.setInt(2, score.getMemberId());
            pstmt.setDouble(3, score.getPumping());
            pstmt.setDouble(4, score.getDifficulty());
            pstmt.setDouble(5, score.getRarity());
            pstmt.setDouble(6, score.getSafety());
            pstmt.setDouble(7, score.getWeight());
            pstmt.executeUpdate();
        }
    }

}
