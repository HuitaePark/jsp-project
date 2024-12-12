package com.jspproject.sub;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class RatingDTO {
    private int scoreId;
    private int workoutId;
    private int memberId;
    private double pumping;
    private double difficulty;
    private double rarity;
    private double safety;
    private double weight;
    private Timestamp createdAt; // 필요하다면
}
