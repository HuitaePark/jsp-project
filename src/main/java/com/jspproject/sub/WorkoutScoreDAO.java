package com.jspproject.sub;

import com.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WorkoutScoreDAO {
    public WorkoutScoreDTO getAverageScores(int workoutId) throws SQLException {
        WorkoutScoreDTO scoreDTO = new WorkoutScoreDTO();
        String sql = "SELECT " +
                "AVG(pumping) AS avg_pumping, " +
                "AVG(difficulty) AS avg_difficulty, " +
                "AVG(rarity) AS avg_rarity, " +
                "AVG(safety) AS avg_safety, " +
                "AVG(weight) AS avg_weight " +
                "FROM workout_score " +
                "WHERE workout_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, workoutId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                scoreDTO.setAveragePumping(rs.getDouble("avg_pumping"));
                scoreDTO.setAverageDifficulty(rs.getDouble("avg_difficulty"));
                scoreDTO.setAverageRarity(rs.getDouble("avg_rarity"));
                scoreDTO.setAverageSafety(rs.getDouble("avg_safety"));
                scoreDTO.setAverageWeight(rs.getDouble("avg_weight"));
            }
        }

        return scoreDTO;
    }
}