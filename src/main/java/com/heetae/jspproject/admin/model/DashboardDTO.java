package com.heetae.jspproject.admin.model;

public class DashboardDTO {
    private int visitorCount;
    private int memberCount;
    private int reviewCount;

    // Getter and Setter
    public int getVisitorCount() {
        return visitorCount;
    }
    public void setVisitorCount(int visitorCount) {
        this.visitorCount = visitorCount;
    }
    public int getMemberCount() {
        return memberCount;
    }
    public void setMemberCount(int memberCount) {
        this.memberCount = memberCount;
    }
    public int getReviewCount() {
        return reviewCount;
    }
    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }
}