package com.jspproject.admin.model;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class ReviewDTO {
    private int reviewId;
    private String memberId;
    private String exerciseName;
    private int rating;
    private String comment;
    private Timestamp createdAt;
}