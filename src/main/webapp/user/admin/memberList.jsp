<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.heetae.jspproject.admin.model.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}../usernavbar/usernavbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}user.css" rel="stylesheet">

</head>
<body>
<div class="user">
<jsp:include page="/user/admin/adminNavbar/usernavbar.jsp" />
    <div class="user-section">
<div class="container mx-auto mt-10">
    <h1 class="text-2xl font-bold mb-5">회원 정보 목록</h1>
    <table class="min-w-full bg-white">
        <thead>
        <tr>
            <th class="py-2 px-4 border-b">회원 ID</th>
            <th class="py-2 px-4 border-b">이름</th>
            <th class="py-2 px-4 border-b">이메일</th>
            <th class="py-2 px-4 border-b">전화번호</th>
            <th class="py-2 px-4 border-b">주소</th>
            <th class="py-2 px-4 border-b">성별</th>
            <th class="py-2 px-4 border-b">나이</th>
            <th class="py-2 px-4 border-b">키</th>
            <th class="py-2 px-4 border-b">몸무게</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
            for (MemberDTO member : memberList) {
        %>
        <tr>
            <td class="py-2 px-4 border-b"><%= member.getMemberId() %></td>
            <td class="py-2 px-4 border-b"><%= member.getName() %></td>
            <td class="py-2 px-4 border-b"><%= member.getEmail() %></td>
            <td class="py-2 px-4 border-b"><%= member.getPhoneNumber() %></td>
            <td class="py-2 px-4 border-b"><%= member.getAddress() %></td>
            <td class="py-2 px-4 border-b"><%= member.getGender() %></td>
            <td class="py-2 px-4 border-b"><%= member.getAge() %></td>
            <td class="py-2 px-4 border-b"><%= member.getHeight() %> cm</td>
            <td class="py-2 px-4 border-b"><%= member.getWeight() %> kg</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
        </div>
</div>
</body>
</html>