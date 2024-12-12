package com.jspproject.sub;

import com.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class WorkoutDAO {
    public WorkoutDTO getWorkoutById(int workoutId) throws SQLException {
        WorkoutDTO workout = null;
        String sql = "SELECT * FROM workouts WHERE workout_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, workoutId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                workout = new WorkoutDTO();
                workout.setWorkoutId(rs.getInt("workout_id"));
                workout.setWorkoutName(rs.getString("workout_name"));
                workout.setWorkoutImage(rs.getString("workout_image"));
                workout.setWorkoutDescription(rs.getString("workout_description"));
                workout.setTargetArea(rs.getString("target_area"));
                workout.setRating(rs.getDouble("rating"));
                // 필요에 따라 추가 컬럼 설정
            }
        }
        return workout;
    }

    public List<WorkoutDTO> getOtherWorkouts(int currentWorkoutId, int limit) throws SQLException {
        List<WorkoutDTO> workouts = new ArrayList<>();
        String sql = "SELECT * FROM workouts WHERE workout_id != ? ORDER BY RAND() LIMIT ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, currentWorkoutId);
            pstmt.setInt(2, limit);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                WorkoutDTO workout = new WorkoutDTO();
                workout.setWorkoutId(rs.getInt("workout_id"));
                workout.setWorkoutName(rs.getString("workout_name"));
                workout.setWorkoutImage(rs.getString("workout_image"));
                workout.setWorkoutDescription(rs.getString("workout_description"));
                workout.setTargetArea(rs.getString("target_area"));
                workout.setRating(rs.getDouble("rating"));
                // 필요에 따라 추가 컬럼 설정

                workouts.add(workout);
            }
        }
        return workouts;
    }

    public List<WorkoutDTO> getAllWorkouts() throws SQLException {
        List<WorkoutDTO> workouts = new ArrayList<>();
        String sql = "SELECT * FROM workouts";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                WorkoutDTO workout = new WorkoutDTO();
                workout.setWorkoutId(rs.getInt("workout_id"));
                workout.setWorkoutName(rs.getString("workout_name"));
                workout.setWorkoutImage(rs.getString("workout_image"));
                workout.setWorkoutDescription(rs.getString("workout_description"));
                workout.setTargetArea(rs.getString("target_area"));
                workout.setRating(rs.getDouble("rating"));
                // 필요에 따라 추가 컬럼 설정

                workouts.add(workout);
            }
        }
        return workouts;
    }
}