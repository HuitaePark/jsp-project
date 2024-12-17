<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사이드바</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/usernavbar/usernavbar.css" rel="stylesheet">
</head>
<body>
<div class="usernavbar">
    <ul class="navbar-ul">
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/user/mypage/memberInfo.jsp">
                <img src="${pageContext.request.contextPath}/user/auth/image/icon/profile.png" alt="프로필 아이콘" class="icon">
                <span>프로필</span>
            </a>
        </li>
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/rank">
                <img src="${pageContext.request.contextPath}/user/auth/image/icon/traningrank.png" alt="운동랭킹 아이콘" class="icon">
                <span>운동랭킹</span>
            </a>
        </li>
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/user/mypage/userboard.jsp">
                <img src="${pageContext.request.contextPath}/user/auth/image/icon/dashboard.png" alt="대시보드 아이콘" class="icon">
                <span>대시보드</span>
            </a>
        </li>
        <li class="navbar-item">
            <!-- 로그아웃은 POST 요청을 해야 하므로 form 유지 -->
            <form action="${pageContext.request.contextPath}/logout" method="post">
                <button type="submit" style="background:none; border:none; cursor:pointer;">
                    <img src="${pageContext.request.contextPath}/user/admin/image/icon/logout.png" alt="로그아웃 아이콘" class="icon">
                    <span>로그아웃</span>
                </button>
            </form>
        </li>
    </ul>
</div>
</body>
</html>