<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jspproject.mypage.MemberDTO" %>
<%@ page import="java.util.*" %>

<%
    List<MemberDTO> rankings = (List<MemberDTO>) request.getAttribute("rankings");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실시간 랭킹</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white flex">
    <!-- 사이드바 -->
    <aside class="w-1/4">
        <%@ include file="/user/usernavbar/usernavbar.jsp" %>
    </aside>
    <div class="container mx-auto py-10 px-4">
        <h1 class="text-3xl font-bold text-center mb-8">실시간 랭킹</h1>
        <table class="table-auto w-full text-center border border-gray-600">
            <thead>
                <tr class="bg-gray-800 border-b border-gray-600">
                    <th class="px-4 py-2 text-white font-bold">순위</th>
                    <th class="px-4 py-2 text-white font-bold">이름</th>
                    <th class="px-4 py-2 text-white font-bold">점수</th>
                    <th class="px-4 py-2 text-white font-bold">티어</th>
                </tr>
            </thead>
            <tbody>
                <% if (rankings != null && !rankings.isEmpty()) { 
                    for (int i = 0; i < rankings.size(); i++) { 
                        MemberDTO member = rankings.get(i); %>
                        <tr class="odd:bg-gray-700 even:bg-gray-800 h-12">
                            <td class="px-4 py-2 text-white"><%= i + 1 %></td>
                            <td class="px-4 py-2 text-white"><%= member.getName() %></td>
                            <td class="px-4 py-2 text-white"><%= member.getScore() %></td>
                            <td class="px-4 py-2 text-white"><%= member.getTierid() %></td>
                        </tr>
                <%  } 
                   } else { %>
                    <tr>
                        <td colspan="4" class="px-4 py-2 text-gray-400">랭킹 데이터가 없습니다.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>