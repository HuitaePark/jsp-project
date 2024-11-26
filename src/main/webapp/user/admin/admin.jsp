<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="../usernavbar/usernavbar.css" rel="stylesheet">
<link href="user.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
   
    <%-- 본문 내용 --%>
   	<div class="user">	
   	  <%-- usernavbar.jsp를 포함 --%>
   	  <jsp:include page="/user/admin/adminNavbar/usernavbar.jsp" />
   	  <div class="user-section">
	  </div>
	</div>

</body>
</html>