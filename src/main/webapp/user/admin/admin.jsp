<%@ page import="com.jspproject.admin.model.DashboardDTO" %>
<%@ page import="com.jspproject.admin.model.DashboardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	DashboardDAO dao = new DashboardDAO();
	DashboardDTO dto = dao.getDashboardData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="../usernavbar/usernavbar.css" rel="stylesheet">
<link href="user.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<style>
		body{
			color:black;
		}
		h1{
			color: white;
		}
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
    <%-- 본문 내용 --%>
   	<div class="user">
   	  <%-- usernavbar.jsp를 포함 --%>
   	  <jsp:include page="/user/admin/adminNavbar/usernavbar.jsp" />
		  <div class="user-section">
			  <h1 class="text-4xl font-bold mb-5">어드민 페이지 입니다.</h1>
			  <div class="dashboard">
			  <div class="box">
				  <h2>방문자 수</h2>
				  <p><%= dto.getVisitorCount() %></p>
			  </div>
			  <div class="box">
				  <h2>회원 수</h2>
				  <p><%= dto.getMemberCount() %></p>
			  </div>
			  <div class="box">
				  <h2>운동 리뷰 수</h2>
				  <p><%= dto.getReviewCount() %></p>
			  </div>
		  </div>
	</div>

</body>
</html>