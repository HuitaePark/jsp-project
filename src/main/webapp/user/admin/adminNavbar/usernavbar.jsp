<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="usernavbar">
    <ul class="navbar-ul">
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/user/admin/admin.jsp">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/home.jpg" alt="프로필 아이콘" class="icon">
                <span>어드민 홈</span>
            </a>
        </li>
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/admin/members">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/profile.png" alt="프로필 아이콘" class="icon">
                <span>회원 정보 관리</span>
            </a>
        </li>
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/admin/reviews">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/traninglist.png" alt="운동기록 아이콘" class="icon">
                <span>통계 보기</span>
            </a>
        </li>
        <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/admin/dashboard">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/dashboard.png" alt="대시보드 아이콘" class="icon">
                <span>현황판</span>
            </a>
        </li>
        <li class="navbar-item">
        <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
            <button type="submit" style="background:none; border:none; cursor:pointer;">
                <img src="${pageContext.request.contextPath}/user/admin/image/icon/logout.png" alt="로그아웃 아이콘" class="icon"><span>로그아웃</span>
            </button>
        </form>
    </li>
    </ul>
</div>