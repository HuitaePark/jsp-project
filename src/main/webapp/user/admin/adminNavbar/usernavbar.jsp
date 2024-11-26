<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="usernavbar">
    <ul class="navbar-ul">
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/admin/members">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/profile.png" alt="프로필 아이콘" class="icon">
                <span>회원정보관리</span>
            </a>
        </li>
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/admin/reviews">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/traninglist.png" alt="운동기록 아이콘" class="icon">
                <span>통계보기</span>
            </a>
        </li>
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/admin/dashboard">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/dashboard.png" alt="대시보드 아이콘" class="icon">
                <span>대시보드</span>
            </a>
        </li>
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/logout">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/logout.png" alt="로그아웃 아이콘" class="icon">
                <span>로그아웃</span>
            </a>
        </li>
    </ul>
</div>