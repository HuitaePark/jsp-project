package com.jspproject.sub;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WorkoutDTO {
    private int workoutId;
    private String workoutName;
    private String workoutImage;
    private String workoutDescription;
    private double rating;
    private int targetArea;


    // 필요에 따라 추가 필드
}