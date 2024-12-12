package com.jspproject.sub;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WorkoutDTO {
    private int workoutId;
    private String workoutName;
    private String workoutImage;
    private String workoutDescription;
    private String targetArea;
    private double rating;
    // 필요에 따라 추가 필드
}