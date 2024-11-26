<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="join2.css" rel="stylesheet">
</head>

<body>
<jsp:include page="/header.jsp" />
	<div class="join-section">	
    <div class="join-form">
        <div class="form-title">회원가입</div>
        
        <form action="${pageContext.request.contextPath}/joinpage" method="post">
            <input type="text" name="id" placeholder="아이디" class="form-input">
            <input type="password" name="password" placeholder="비밀번호" class="form-input">
            <input type="text" name="name" placeholder="이름" class="form-input">
            <input type="text" name="tel" placeholder="전화번호" class="form-input">
            <input type="email" name="email" placeholder="이메일" class="form-input">
            
            <div class="button-container">
                <button type="reset" class="form-button">취소</button>
                <button type="submit" class="form-button">가입</button>
            </div>
        </form>
    </div>
    </div>
    <jsp:include page="/footer.jsp" />

</body>
</html>
