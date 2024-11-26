<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.heetae.jspproject.admin.model.DashboardDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>대시보드</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}../usernavbar/usernavbar.css" rel="stylesheet">
    <style>
        .dashboard {
            display: flex;
            justify-content: space-around;
            margin-top: 50px;
        }
        .box {
            width: 200px;
            height: 150px;
            background-color: #f3f3f3;
            text-align: center;
            padding: 20px;
            border-radius: 8px;
        }
        .box h2 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .box p {
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="user">
<!-- 네비게이션 바 포함 -->
<jsp:include page="/user/admin/adminNavbar/usernavbar.jsp" />

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
</div>
</body>
</html>