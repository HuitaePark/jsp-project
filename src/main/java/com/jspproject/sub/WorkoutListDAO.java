package com.jspproject.sub;

import com.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class WorkoutListDAO {
    private static final String SELECT_WORKOUTS_BY_TARGET = "SELECT * FROM workouts WHERE target_area = ?";
    private static final String SELECT_WORKOUTS_BY_TARGET_AND_SEARCH = "SELECT * FROM workouts WHERE target_area = ? AND workout_name LIKE ?";
    private static final String SELECT_WORKOUTS_BY_SEARCH = "SELECT * FROM workouts WHERE workout_name LIKE ?";

    /**
     * 특정 타겟 영역과 검색어에 맞는 운동 목록을 가져옵니다.
     *
     * @param targetArea 타겟 영역 (전체를 원하면 -1)
     * @param search 검색어
     * @return 필터링된 운동 목록
     */
    public List<WorkoutDTO> getWorkouts(int targetArea, String search) {
        List<WorkoutDTO> workouts = new ArrayList<>();
        String sql;

        if (targetArea > 0) {
            sql = SELECT_WORKOUTS_BY_TARGET_AND_SEARCH;
        } else {
            sql = SELECT_WORKOUTS_BY_SEARCH;
        }

        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            if (targetArea > 0) {
                preparedStatement.setInt(1, targetArea);
                preparedStatement.setString(2, "%" + search + "%");
            } else {
                preparedStatement.setString(1, "%" + search + "%");
            }

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("workout_id");
                String name = rs.getString("workout_name");
                String image = rs.getString("workout_image");
                String description = rs.getString("workout_description");
                double rating = rs.getDouble("rating");
                int area = rs.getInt("target_area");
                workouts.add(new WorkoutDTO(id, name, image, description, rating, area));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return workouts;
    }

    /**
     * 특정 타겟 영역에 해당하는 운동 목록을 가져옵니다.
     *
     * @param targetArea 타겟 영역
     * @return 필터링된 운동 목록
     */
    public List<WorkoutDTO> getWorkoutsByTargetArea(int targetArea) {
        if (targetArea == -1) {
            // 모든 타겟 영역의 운동을 가져옵니다.
            String sql = "SELECT * FROM workouts";
            List<WorkoutDTO> workouts = new ArrayList<>();
            try (Connection connection = DatabaseUtil.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("workout_id");
                    String name = rs.getString("workout_name");
                    String image = rs.getString("workout_image");
                    String description = rs.getString("workout_description");
                    double rating = rs.getDouble("rating");
                    int area = rs.getInt("target_area");
                    workouts.add(new WorkoutDTO(id, name, image, description, rating, area));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return workouts;
        } else {
            // 기존 로직 유지
            List<WorkoutDTO> workouts = new ArrayList<>();
            try (Connection connection = DatabaseUtil.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_WORKOUTS_BY_TARGET)) {
                preparedStatement.setInt(1, targetArea);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("workout_id");
                    String name = rs.getString("workout_name");
                    String image = rs.getString("workout_image");
                    String description = rs.getString("workout_description");
                    double rating = rs.getDouble("rating");
                    int area = rs.getInt("target_area");
                    workouts.add(new WorkoutDTO(id, name, image, description, rating, area));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return workouts;
        }
    }
}