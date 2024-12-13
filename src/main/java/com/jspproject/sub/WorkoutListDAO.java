package com.jspproject.sub;

import com.jspproject.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class WorkoutListDAO {
    private static final String SELECT_WORKOUTS_BY_TARGET = "SELECT * FROM workouts WHERE target_area = ?";

    public List<WorkoutDTO> getWorkoutsByTargetArea(int targetArea) {
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
