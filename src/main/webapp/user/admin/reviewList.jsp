<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.heetae.jspproject.admin.model.ReviewDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>운동 리뷰 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}../usernavbar/usernavbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}user.css" rel="stylesheet">

</head>
<body>
<div class="user">
<jsp:include page="/user/admin/adminNavbar/usernavbar.jsp" />
    <div class="user-section">
<div class="container mx-auto mt-10">
    <h1 class="text-2xl font-bold mb-5">운동 리뷰 목록</h1>
    <table class="min-w-full bg-white">
        <thead>
        <tr>
            <th class="py-2 px-4 border-b">리뷰 ID</th>
            <th class="py-2 px-4 border-b">회원 이름</th>
            <th class="py-2 px-4 border-b">운동 이름</th>
            <th class="py-2 px-4 border-b">평점</th>
            <th class="py-2 px-4 border-b">코멘트</th>
            <th class="py-2 px-4 border-b">작성일</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<ReviewDTO> reviewList = (List<ReviewDTO>) request.getAttribute("reviewList");
            for (ReviewDTO review : reviewList) {
        %>
        <tr>
            <td class="py-2 px-4 border-b"><%= review.getReviewId() %></td>
            <td class="py-2 px-4 border-b"><%= review.getMemberName() %></td>
            <td class="py-2 px-4 border-b"><%= review.getExerciseName() %></td>
            <td class="py-2 px-4 border-b"><%= review.getRating() %></td>
            <td class="py-2 px-4 border-b"><%= review.getComment() %></td>
            <td class="py-2 px-4 border-b"><%= review.getCreatedAt() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
    </div>
</div>
</body>
</html>