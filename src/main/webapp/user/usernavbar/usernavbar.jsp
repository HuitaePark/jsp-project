<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/user/usernavbar/usernavbar.css" rel="stylesheet">


</head>
<body>
 <div class="usernavbar">
 	 <ul class="navbar-ul">
        <li class="navbar-item">
            <img src="${pageContext.request.contextPath}/user/auth/image/icon/profile.png" alt="프로필 아이콘" class="icon">
            <span>프로필</span>
        </li>
        <li class="navbar-item">
            <img src="${pageContext.request.contextPath}/user/auth/image/icon/traninglist.png" alt="운동기록 아이콘" class="icon">
            <span>운동기록</span>
        </li>
        <li class="navbar-item">
            <img src="${pageContext.request.contextPath}/user/auth/image/icon/traningrank.png" alt="운동랭킹 아이콘" class="icon">
            <span>운동랭킹</span>
        </li>
        <li class="navbar-item">
             <img src="${pageContext.request.contextPath}/user/auth/image/icon/dashboard.png" alt="대시보드 아이콘" class="icon">
            <span>대시보드</span>
        </li>
          <li class="navbar-item">
             <img src="${pageContext.request.contextPath}/user/auth/image/icon/food.png" alt="식단관리 아이콘" class="icon">
            <span>식단관리</span>
        </li>
          <li class="navbar-item">
             <img src="${pageContext.request.contextPath}/user/auth/image/icon/profile.png" alt="로그아웃 아이콘" class="icon">
            <span>로그아웃</span>
        </li>
    </ul>
 	</div>
 	
</body>
</html>