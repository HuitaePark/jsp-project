<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jspproject.admin.model.DashboardDTO" %>
<%
    DashboardDTO data = (DashboardDTO) request.getAttribute("dashboardData");
%>
<div class="dashboard">
    <div class="box">
        <h2>방문자 수</h2>
        <p><%= data.getVisitorCount() %></p>
    </div>
    <div class="box">
        <h2>회원 수</h2>
        <p><%= data.getMemberCount() %></p>
    </div>
    <div class="box">
        <h2>운동 리뷰 수</h2>
        <p><%= data.getReviewCount() %></p>
    </div>
</div>