package com.heetae.jspproject.sub;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewDTO {
    private int reviewId;
    private String memberId;
    private String comment;
    private java.sql.Timestamp createdAt;
    private int likeCount;
    private int dislikeCount;
    private boolean userLiked;
    private boolean userDisliked;

}