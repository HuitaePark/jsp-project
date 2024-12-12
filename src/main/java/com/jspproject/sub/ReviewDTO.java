package com.jspproject.sub;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class ReviewDTO {
    private int reviewId;
    private String memberId;
    private String exerciseName; // 추가
    private int rating; // 추가
    private String comment;
    private Timestamp createdAt;
    private int workoutId; // 추가
    private int likeCount;
    private int dislikeCount;
    private boolean userLiked;
    private boolean userDisliked;
}
