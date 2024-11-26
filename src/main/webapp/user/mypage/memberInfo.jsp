<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.heetae.jspproject.mypage.MemberDTO" %>
<%
	MemberDTO member = new MemberDTO();
	member.setMemberid("user01");
	member.setName("홍길동");
	member.setEmail("testuser@example.com");
	member.setTel("01012345678");
	member.setAddr("서울시 강남구 삼성동");
	member.setPassword("testpassword");
	
	session.setAttribute("member", member);
	
    //MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white">
    <div class="flex">
    	<!-- 사이드바 -->
        <aside class="w-1/4">
            <%@ include file="/user/usernavbar/usernavbar.jsp" %>
        </aside>

        <!-- 메인 콘텐츠 -->
        <main class="flex-1 p-8">
        	<form action="${pageContext.request.contextPath}/updateMember" method="post">
            <h1 class="text-2xl font-bold mb-6">회원정보수정</h1>
            
            <!-- hidden input으로 회원 ID 전달 -->
    		<input type="hidden" name="memberid" value="${member.memberid}" />
    		
            <!-- 프로필 섹션 -->
            <div class="flex flex-col items-center mb-10">
                <div class="w-24 h-24 bg-gray-600 rounded-full flex items-center justify-center">
                    <span class="text-3xl">👤</span>
                </div>
                <input type="text" name="name" placeholder="닉네임 입력" value="${member.name}" required class="text-center bg-black text-white mt-2 text-lg border-b border-gray-500 focus:outline-none">
            </div>

            <!-- 이메일 -->
            <div class="mb-4">
                <label class="block text-sm font-semibold mb-1">이메일</label>
                <div class="flex items-center">
                    <input type="email" name="email" placeholder="예: example@gmail.com" value="${member.email}" required
               			class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 전화번호 -->
            <div class="mb-4">
                <label class="block text-sm font-semibold mb-1">전화번호</label>
                <div class="flex items-center">
                    <input type="text" name="tel" placeholder="(-제외) 010****1234" value="${member.tel}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 주소 -->
            <div class="mb-6">
                <label class="block text-sm font-semibold mb-1">주소</label>
                <div class="flex items-center">
                    <input type="text" name="addr" placeholder="**시 **구 **동 123-12" value="${member.addr}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none resize-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>
            
            <!-- 비번 -->
            <div class="mb-6">
                <label class="block text-sm font-semibold mb-1">비밀번호</label>
                <div class="flex items-center">
                    <input type="text" name="password" placeholder="비밀번호 변경" value="${member.password}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none resize-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 버튼 -->
            <div class="flex justify-center space-x-4">
                <button class="px-4 py-2 bg-gray-800 border border-white rounded-md">신체정보수정</button>
            </div>
            <!-- 확인버튼 -->
            <div class="flex justify-center space-x-4">
                <button class="px-4 py-2 bg-gray-800 border border-white rounded-md">수정완료</button>
            </div>
            </form>
        </main>
    </div>
</body>
</html>