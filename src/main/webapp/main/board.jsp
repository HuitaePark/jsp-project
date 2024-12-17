<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 테이블 -->
<table class="table-auto text-sm text-white border-t border-gray-600">
    <thead>
    <tr class="bg-gray-800 text-gray-300">
        <th class="py-3 border-b border-gray-700">번호</th>
        <th class="py-3 border-b border-gray-700">제목</th>
        <th class="py-3 border-b border-gray-700">등록일</th>
    </tr>
    </thead>
    <tbody>
    <%
        String[][] boardData = {
                {"1", "초보자를 위한 1주일 운동 루틴 추천", "2024-10-15"},
                {"2", "체지방 감량을 위한 유산소 운동 방법", "2024-10-14"},
                {"3", "근력 강화를 위한 상체 운동 루틴", "2024-10-14"},
                {"4", "홈트레이닝과 헬스장 운동, 뭐가 더 좋을까?", "2024-10-14"},
                {"5", "운동 전에 꼭 해야 할 스트레칭 5가지", "2024-10-13"}
        };
        for (String[] row : boardData) {
    %>
    <tr class="border-b border-gray-700 hover:bg-gray-700 transition">
        <td class="py-3 px-4"><%= row[0] %></td>
        <td class="py-3 px-4"><%= row[1] %></td>
        <td class="py-3 px-4"><%= row[2] %></td>
    </tr>
    <% } %>
    </tbody>
</table>