<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link href="login.css" rel="stylesheet">
</head>
<body>
 <jsp:include page="/header.jsp" />
    <div class="login-container">
        <h2>로그인</h2>
        <form action="${pageContext.request.contextPath}/loginpage" method="post">
            <input type="text" name="id" class="input-field" placeholder="아이디">
            <input type="password" name="password" class="input-field" placeholder="비밀번호">
            <div class="login-search">
                <a href="#">아이디 찾기 / 비밀번호 찾기</a>
            </div>
            <div class="login-buttons">
                <button type="submit">로그인</button>
                <button type="button" onclick="location.href='/user/auth/joinpage/join2/join2.jsp'">회원가입</button>
            </div>
        </form>
			<div class="sns-login">
            <p>SNS 계정으로 로그인</p>
        </div>
        <div class="sns-login-icons">
            <img src="${pageContext.request.contextPath}/user/auth/image/icon/google.png" alt="Google Login">
            <img src="${pageContext.request.contextPath}/user/auth/image/icon/google.png" alt="Google Login">
            <img src="${pageContext.request.contextPath}/user/auth/image/icon/google.png" alt="Google Login">
        </div>    
       </div>	
</body>
</html>
