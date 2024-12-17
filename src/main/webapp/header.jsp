<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<style>
    /* 헤더 스타일 */
    header {
        background-color: rgba(0, 0, 0, 0.8); /* 투명한 검은색 배경 */
        color: white;
        padding: 1rem 2rem;
        display: flex;
        justify-content: space-between; /* 양 끝으로 정렬 */
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);
    }

    /* 로고 스타일 */
    .logo {
        font-size: 1.5rem;
        font-weight: bold;
        margin: 0;
        flex: 1; /* 로고 부분이 차지하는 공간 */
    }

    /* 네비게이션 메뉴 스타일 */
    nav {
        flex: 2; /* 네비게이션 부분이 차지하는 공간 */
        display: flex;
        justify-content: center; /* 가운데 정렬 */
        gap: 4rem; /* 링크 사이 간격 조정 */
    }

    nav a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        font-size: 1.2rem;
        padding: 0.3rem 0;
        transition: color 0.3s ease, transform 0.2s;
    }

    nav a:hover {
        color: #ccc; /* 마우스 호버 시 색상 변경 */
        transform: scale(1.05);
    }

    /* 로그인 버튼 스타일 */
    .nav-right {
        flex: 1; /* 로그인 버튼이 차지하는 공간 */
        display: flex;
        justify-content: flex-end; /* 오른쪽 정렬 */
        align-items: center; /* 수직 정렬 */
        gap: 1rem; /* 아이콘과 버튼 사이 간격 */
    }

    .nav-right img {
        width: 30px; /* 아이콘 크기 조정 */
        height: 30px;
    }

    .login-button {
        background-color: #871e9b;
        color: white;
        padding: 0.5rem 1.5rem;
        border-radius: 8px;
        text-decoration: none;
        font-size: 1rem;
        transition: background-color 0.3s ease;
    }

    .login-button:hover {
        background-color: #6d157b;
    }
</style>

<header>
    <div class="logo">GYMRAT</div>
    <nav>
        <a href="<c:url value="/main/index.jsp"/>">Home</a>
        <a href="<c:url value="/sub/workoutList.jsp"/>">운동정보</a>
        <c:choose>
            <c:when test="${not empty sessionScope.loginInfo}">
                <a href="<c:url value="/user/mypage/memberInfo.jsp"/>">내정보</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="/user/auth/loginpage/login.jsp"/>">내정보</a>
            </c:otherwise>
        </c:choose>

    </nav>

    <div class="nav-right">

        <c:choose>
            <c:when test="${not empty sessionScope.loginInfo}">
                <a href="<c:url value="/user/mypage/memberInfo.jsp"/>">
                    <img alt="유저" src="<c:url value="/main/images/usericon.png"/>">
                </a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="/user/auth/loginpage/login.jsp"/>">
                    <img alt="유저" src="<c:url value="/main/images/usericon.png"/>">
                </a>
            </c:otherwise>
        </c:choose>
        <c:if test="${not empty sessionScope.loginInfo}">
            <a href="<c:url value="/user/admin/admin.jsp"/>" class="login-button">어드민 페이지</a>
        </c:if>

        <!-- 로그인 상태인지 확인하여 버튼 변경 -->
        <c:if test="${not empty sessionScope.loginInfo}">
            <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
                <button type="submit" class="login-button" style="background-color:#e74c3c;">로그아웃</button>
            </form>
        </c:if>
        <c:if test="${empty sessionScope.loginInfo}">
            <a href="<c:url value="/user/auth/loginpage/login.jsp"/>" class="login-button">로그인</a>
        </c:if>
    </div>
</header>