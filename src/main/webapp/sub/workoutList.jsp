<%@ page import="com.jspproject.sub.WorkoutDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>운동 정보</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <style>
        .exercise-image-box {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px; /* 이미지와 컨테이너 간의 여백 */
            box-sizing: border-box; /* 패딩을 포함한 전체 크기 계산 */
            height: 200px; /* 고정 높이 설정 */
        }

        .exercise-image-box img {
            max-height: 180px; /* 컨테이너 높이보다 작게 설정하여 여백 유지 */
            width: auto; /* 이미지 비율 유지 */
            background-color: #ffffff; /* 흰색 배경 */
        }


        /* 활성화된 카테고리 버튼 스타일 */
        .category-btn.active {
            background-color: #871e9b;
            color: #ffffff;
        }
    </style>
</head>
<body class="w-full">

<jsp:include page="/header.jsp" />

<div class="w-full max-w-custom mx-auto mt-20 relative" style="height: 500px; overflow: hidden;">
    <img src="<%= request.getContextPath() %>/sub/image/best-back-machines-in-the-gym.webp" alt="새 이미지" class="w-full h-full object-cover">
    <!-- 운동명 텍스트 추가 -->
    <div class="absolute top-0 left-0 m-4">
        <h1 class="text-white font-bold text-6xl">상세보기</h1>
    </div>
</div>
<!-- 메인 콘텐츠 -->
<div class="w-full max-w-custom mx-auto mt-24 px-4"> <!-- Adjusted top margin to avoid overlap with fixed header -->
    <!-- 검색 폼 -->
    <form action="<%= request.getContextPath() %>/workouts" method="get" class="flex justify-center mb-6">
        <input
                type="text"
                name="search"
                placeholder="운동을 검색하세요..."
                value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
                class="w-full text-black max-w-md px-4 py-2 border border-gray-300 rounded-l-md focus:outline-none focus:ring-2 focus:ring-purple-600"
        >
        <button
                type="submit"
                class="px-4 py-2 text-white rounded-r-md hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-600"
                style="background-color: #871e9b"
        >
            검색
        </button>
    </form>

    <!-- 카테고리 버튼들 -->
    <div class="flex justify-center space-x-4 mb-6">
        <a href="<%= request.getContextPath() %>/workouts?category=arms&search=<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" class="category-btn <% if("arms".equals(request.getAttribute("selectedCategory"))) { %>active<% } %> px-4 py-2 rounded-md">
            가슴
        </a>
        <a href="<%= request.getContextPath() %>/workouts?category=chest&search=<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" class="category-btn <% if("chest".equals(request.getAttribute("selectedCategory"))) { %>active<% } %> px-4 py-2 rounded-md">
            등
        </a>
        <a href="<%= request.getContextPath() %>/workouts?category=legs&search=<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" class="category-btn <% if("legs".equals(request.getAttribute("selectedCategory"))) { %>active<% } %> px-4 py-2 rounded-md">
            어깨
        </a>
        <a href="<%= request.getContextPath() %>/workouts?category=back&search=<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" class="category-btn <% if("back".equals(request.getAttribute("selectedCategory"))) { %>active<% } %> px-4 py-2 rounded-md">
            하체
        </a>
        <a href="<%= request.getContextPath() %>/workouts?category=shoulders&search=<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" class="category-btn <% if("shoulders".equals(request.getAttribute("selectedCategory"))) { %>active<% } %> px-4 py-2 rounded-md">
            팔
        </a>
    </div>
    <!-- 운동 아이템들 -->
    <div id="exercise-container" class="mt-6 grid grid-cols-1 md:grid-cols-3 gap-4 justify-items-center h-auto ">
        <%
            List<WorkoutDTO> workouts = (List<WorkoutDTO>) request.getAttribute("workouts");
            if (workouts != null && !workouts.isEmpty()) {
                for (WorkoutDTO workout : workouts) {
        %>
        <div class="box w-full max-w-sm bg-black border border-white rounded-lg shadow-md overflow-hidden">
            <a href="<%= request.getContextPath() %>/sub/workoutDetail.jsp?workoutId=<%= workout.getWorkoutId() %>" class="block">
                <div class="exercise-image-box">
                    <img src="<%= request.getContextPath() + (workout.getWorkoutImage().startsWith("/") ? "" : "/") + workout.getWorkoutImage() %>" alt="<%= workout.getWorkoutName() %>">
                </div>
                <div class="p-4">
                    <h2 class="text-xl font-anton mb-2"><%= workout.getWorkoutName() %></h2>
                    <p class="text-yellow-500">평점: <%= workout.getRating() %></p>
                </div>
            </a>
        </div>
        <%
            }
        } else {
        %>
        <p>선택한 카테고리에 해당하는 운동이 없거나 검색 결과가 없습니다.</p>
        <%
            }
        %>
    </div>
</div>
<!-- 푸터 포함 -->
<%@ include file="/footer.jsp" %>

<!-- JavaScript for Hamburger Menu (Optional) -->
<script>
    const hamburger = document.getElementById('hamburger');
    const dropdownMenu = document.getElementById('dropdown-menu');

    hamburger.addEventListener('click', () => {
        if (dropdownMenu.style.display === 'flex') {
            dropdownMenu.style.display = 'none';
        } else {
            dropdownMenu.style.display = 'flex';
        }
    });
</script>
</body>
</html>