<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>운동 게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <script>
        function openWritePopup() {
            document.getElementById('writePopup').classList.remove('hidden');
        }

        function closeWritePopup() {
            document.getElementById('writePopup').classList.add('hidden');
        }
    </script>

    <style>
        body {
            background-color: #000000; /* 완전 검정 배경 */
            color: #ffffff; /* 흰색 텍스트 */
            font-family: 'Arial', sans-serif;
        }
        .header {

            font-size: 2.5rem;
            font-weight: bold;
            margin-top: 2rem;
        }
        .subhead {
            margin-top: 0.5rem;
            color: #aaaaaa; /* 연한 회색 */
        }

        .search-bar {
            display: inline-flex;
            align-items: center;
            margin-top: 2rem;
            padding: 5px 10px;
            border: 1px solid #ffffff;
            border-radius: 5px;
        }
        .search-bar select,
        .search-bar input {
            border: none;
            outline: none;
            background-color: transparent;
            color: white;
            padding: 5px 10px;
        }
        .search-bar select {
            border-right: 1px solid #ffffff; /* 구분선 */
        }
        .search-bar button {
            border: none;
            background-color: transparent;
            color: white;
            padding: 5px 10px;
            cursor: pointer;
        }
        .search-bar button:hover {
            color: #aaaaaa; /* 버튼 호버 효과 */
        }
        table {
            margin: 2rem auto;
            width: 80%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
        }
        th {
            background-color: #333333;
        }
        td {
            background-color: #1a1a1a;
        }
        tr:hover td {
            background-color: #444444; /* 행 호버 효과 */
        }
        .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            color: white;
            border: 1px solid #555555;
            border-radius: 5px;
            text-decoration: none;
        }
        .pagination a:hover {
            background-color: #555555;
        }
        .pagination a.active {
            background-color: #ff6f61;
            font-weight: bold;
        }

    </style>
</head>
<body class="flex flex-col items-center">
    <!-- 헤더 -->
 <jsp:include page="/header.jsp" />
    <header>
        <h1 class="header">운동 게시판</h1>
        <p class="subhead">궁금한 모든 것을 확인해보세요</p>
    </header>



    <!-- 검색 바 -->
    <div class="search-bar mt-4 flex w-1/3">
        <select class="bg-transparent text-white outline-none pr-4 border-r border-white">
            <option>제목</option>
        </select>
        <input type="text" class="bg-transparent text-white outline-none px-4 flex-grow" placeholder="검색어를 입력해주세요">
        <button class="bg-transparent text-white px-4 hover:text-gray-400 ml-auto">🔍</button>
    </div>

     <!-- 글쓰기 버튼 추가 -->
      <button class="write-button bg-blsue-600 text-white px-4 py-2 rounded ml-4" onclick="openWritePopup()">글쓰기</button>



    <!-- 글쓰기 팝업창 -->
    <div id="writePopup" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center hidden">
        <div class="bg-white text-black w-1/3 p-8 rounded-lg">
            <h2 class="text-2xl mb-4">글쓰기</h2>
            <form>
                <div class="mb-4">
                    <label class="block text-sm mb-1">제목</label>
                    <input type="text" class="w-full border border-gray-300 p-2 rounded">
                </div>
                <div class="mb-4">
                    <label class="block text-sm mb-1">내용</label>
                    <textarea class="w-full border border-gray-300 p-2 rounded" rows="5"></textarea>
                </div>
                <div class="flex justify-end">
                    <button type="button" class="bg-gray-600 text-white px-4 py-2 rounded mr-2" onclick="closeWritePopup()">취소</button>
                    <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded">등록</button>
                </div>
            </form>
        </div>
    </div>



    <!-- 테이블 -->
    <table class="table-auto text-center text-white mt-8">
        <thead>
            <tr>
                <th class="py-3 border-b border-gray-700 w-1/6">번호</th>
                <th class="py-3 border-b border-gray-700">제목</th>
                <th class="py-3 border-b border-gray-700 w-1/6">등록일</th>
            </tr>
        </thead>
        <tbody>
            <%
                String[][] boardData = {
                    {"1", "헬스를 처음 하는 사람은 어떤 운동을 하는게 좋을까요?", "2024-10-14"},
                    {"2", "헬스를 처음 하는 사람은 어떤 운동을 하는게 좋을까요?", "2024-10-14"},
                    {"3", "헬스를 처음 하는 사람은 어떤 운동을 하는게 좋을까요?", "2024-10-14"},
                    {"4", "헬스를 처음 하는 사람은 어떤 운동을 하는게 좋을까요?", "2024-10-14"}
                };

                for (String[] row : boardData) {
            %>
            <tr>
                <td class="py-3 border-b border-gray-700"><%= row[0] %></td>
                <td class="py-3 border-b border-gray-700"><%= row[1] %></td>
                <td class="py-3 border-b border-gray-700"><%= row[2] %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <!-- 페이지네이션 -->
    <div class="pagination flex mt-6" style="margin-bottom: 10rem;">
        <a href="#" class="px-3 py-2 border border-gray-600 text-white hover:bg-gray-700">1</a>
        <a href="#" class="px-3 py-2 border border-gray-600 text-white hover:bg-gray-700">2</a>
        <a href="#" class="px-3 py-2 border border-gray-600 text-white hover:bg-gray-700">3</a>
    </div>

    <jsp:include page="/footer.jsp" />
</body>
</html>
