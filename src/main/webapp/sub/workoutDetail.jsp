<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.jspproject.login.loginDTO" %>
<%@ page import="com.jspproject.sub.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.jspproject.sub.*" %>
<%
    // 요청에서 workoutId 파라미터를 가져옵니다.
//    String workoutIdParam = request.getParameter("workoutId");
      int workoutId = 1;
//    if (workoutIdParam != null) {
//        try {
//            workoutId = Integer.parseInt(workoutIdParam);
//        } catch (NumberFormatException e) {
//            out.println("<h2>잘못된 workoutId 값입니다.</h2>");
//            e.printStackTrace();
//            return;
//        }
//    } else {
//        out.println("<h2>workoutId 파라미터가 없습니다.</h2>");
//        return;
//    }

    // Workout 정보를 가져옵니다.
    WorkoutDAO workoutDAO = new WorkoutDAO();
    WorkoutDTO workout = null;
    try {
        workout = workoutDAO.getWorkoutById(workoutId);
        if (workout == null) {
            out.println("<h2>해당 workoutId에 대한 운동 정보가 없습니다.</h2>");
            return;
        }
    } catch (SQLException e) {
        out.println("<h2>데이터베이스 오류가 발생했습니다.</h2>");
        e.printStackTrace();
        return;
    }

    // Workout Score 정보를 가져옵니다.
    WorkoutScoreDAO workoutScoreDAO = new WorkoutScoreDAO();
    WorkoutScoreDTO workoutScore = null;
    try {
        workoutScore = workoutScoreDAO.getAverageScores(workoutId);
        if (workoutScore == null) {
            out.println("<h2>평균 평점을 계산할 수 없습니다.</h2>");
        }
    } catch (SQLException e) {
        out.println("<h2>평균 평점을 가져오는 중 오류가 발생했습니다.</h2>");
        e.printStackTrace();
        // 에러 발생 시 기본값 설정 또는 에러 처리
        workoutScore = new WorkoutScoreDTO();
        workoutScore.setAveragePumping(0.0);
        workoutScore.setAverageDifficulty(0.0);
        workoutScore.setAverageRarity(0.0);
        workoutScore.setAverageSafety(0.0);
        workoutScore.setAverageWeight(0.0);
    }

    // 리뷰 목록을 가져옵니다.
    ReviewDAO reviewDAO = new ReviewDAO();
    loginDTO user = (loginDTO) session.getAttribute("loginInfo");
    String memberId = null;
    if (user != null) {
        memberId = user.getUsername();
    }
    List<ReviewDTO> reviews = null;
    try {
        reviews = reviewDAO.getReviewsByWorkoutId(memberId, workoutId);
    } catch (SQLException e) {
        out.println("<h2>리뷰를 가져오는 중 오류가 발생했습니다.</h2>");
        e.printStackTrace();
        reviews = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><%= workout.getWorkoutName() %> - 운동정보 사이트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <!-- Google Fonts 추가 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <!-- 외부 CSS 파일 링크 추가 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <!-- contextPath를 JavaScript에서 사용하기 위한 변수 선언 -->
    <style>
        /* 사용자 정의 CSS 파일 */
        .swiper-pagination-vertical.swiper-pagination-bullets,
        .swiper-vertical > .swiper-pagination-bullets {
            top: 20%; /* 원하는 값으로 변경 */
            transform: translate3d(0, -50%, 0);
        }
        /* span 요소에만 굵은 글씨 적용 */
        .swiper-pagination-bullet {
            font-weight: 800;
        }
        /* 전체 배경과 텍스트 색상 설정 */
        body {
            background-color: #000000; /* 검은색 배경 */
            color: #ffffff; /* 흰색 텍스트 */
            font-family: 'Noto Sans KR', sans-serif; /* 한글 폰트 적용 */
        }
        /* 헤더 스타일 */
        header {
            background-color: #000000; /* 검은색 배경 */
        }
        /* 헤더 내의 모든 텍스트 색상 설정 */
        header nav a {
            color: #ffffff; /* 흰색 텍스트 */
        }
        .max-w-custom {
            max-width: 1440px;
        }

        /* 햄버거 메뉴 스타일 */
        .hamburger {
            cursor: pointer;
            width: 30px;
            height: 30px;
        }
        /* 드롭다운 메뉴 스타일 */
        .dropdown-menu {
            display: none;
            position: absolute;
            top: 80px;
            left: 0;
            right: 0;
            background-color: #000000;
            padding: 20px;
            flex-direction: column;
            align-items: center;
            z-index: 9;
        }
        .dropdown-menu a {
            color: #ffffff;
            padding: 10px 0;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s;
        }
        .dropdown-menu a:hover {
            color: #871e9b;
        }
        /* 반응형 디자인: 모바일에서 햄버거 메뉴 보이기 */
        @media (max-width: 768px) {
            .navigation {
                display: none;
            }
            .hamburger {
                display: block;
            }
        }
        /* 네비게이션 링크 스타일 */
        .navigation a {
            background-color: #000000;
            color: #ffffff;
            padding: 12px 24px;
            border: none;
            border-radius: 9999px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
        }
        /* 네비게이션 링크 호버 효과 */
        .navigation a:hover {
            background-color: #871e9b;
            color: #ffffff;
        }
        /* 글꼴 설정 */
        @layer utilities {
            .font-anton {
                font-family: 'Anton', sans-serif;
            }
        }
        /* 콘텐츠 섹션 스타일 추가 */
        .content-section .box {
            background-color: #000000; /* 검은색 배경 */
            border: 1px solid #ffffff; /* 흰색 테두리 */
            padding: 16px;
        }
        .exercise-image-box img {
            width: 100%;
            height: 100%;
            object-fit: contain; /* 박스를 채우도록 이미지 조정 */
        }
    </style>
    <script type="text/javascript">
        var contextPath = '<%= request.getContextPath() %>';
    </script>
</head>
<body class="w-full">
<!-- 헤더 시작 -->
<header class="w-full fixed top-0 left-0 z-50" style="height: 80px;">
    <div class="mx-auto flex items-center justify-between h-full max-w-custom px-4">
        <!-- 햄버거 메뉴 -->
        <img src="<%= request.getContextPath() %>/images/hamburger.png" alt="메뉴" class="hamburger" id="hamburger" style="width:30px; height:30px;">
        <!-- 네비게이션 링크 -->
        <nav class="navigation flex space-x-4 justify-end">
            <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
            <a href="<%= request.getContextPath() %>/workouts.jsp">운동정보</a>
            <a href="<%= request.getContextPath() %>/board.jsp">게시판</a>
            <a href="<%= request.getContextPath() %>/shop.jsp">쇼핑몰</a>
            <a href="<%= request.getContextPath() %>/login.jsp" style="border-radius: 0; background-color: #871e9b;">로그인</a>
        </nav>
    </div>
    <!-- 드롭다운 메뉴 -->
    <div class="dropdown-menu flex flex-col items-center" id="dropdown-menu">
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/workouts.jsp">운동정보</a>
        <a href="<%= request.getContextPath() %>/board.jsp">게시판</a>
        <a href="<%= request.getContextPath() %>/shop.jsp">쇼핑몰</a>
        <a href="<%= request.getContextPath() %>/login.jsp">로그인</a>
    </div>
</header>
<!-- 헤더 끝 -->

<!-- 운동 상세 이미지 시작 -->
<div class="w-full max-w-custom mx-auto mt-20 relative" style="height: 500px; overflow: hidden;">
    <img src="<%= request.getContextPath() %>/sub/image/best-back-machines-in-the-gym.webp" alt="새 이미지" class="w-full h-full object-cover">
    <!-- 운동명 텍스트 추가 -->
    <div class="absolute top-0 left-0 m-4">
        <h1 class="text-white font-bold text-6xl"><%= workout.getWorkoutName() %></h1>
    </div>
</div>
<!-- 운동 상세 이미지 끝 -->

<!-- 운동 상세 섹션 시작 -->
<div class="content-section w-full max-w-custom mx-auto mt-8">
    <div class="grid grid-cols-12 gap-4">
        <!-- 왼쪽 컬럼 -->
        <div class="col-span-5 flex flex-col space-y-4">
            <!-- 운동 이미지 박스 -->
            <div class="exercise-image-box box flex items-center justify-center" style="height: 300px; overflow: hidden;">
                <!-- 운동 이미지 삽입 -->
                <img src="<%= workout.getWorkoutImage() %>" alt="운동 이미지" class="object-fit-contain w-full h-full">
            </div>
            <!-- 운동 설명 박스 -->
            <div class="exercise-description-box box text-white" style="height: 400px;">
                <!-- 운동 설명 삽입 -->
                <p><%= workout.getWorkoutDescription() %></p>
            </div>
        </div>
        <!-- 오른쪽 컬럼 -->
        <div class="col-span-7 flex flex-col space-y-4">
            <!-- 유튜브 콘텐츠 박스 -->
            <div class="youtube-content-box box" style="height: 400px;">
                <!-- 유튜브 콘텐츠 삽입 -->
                <iframe width="100%" height="100%" src="https://www.youtube.com/embed/NUfroxwfFJU?si=OmFGN5LC8eBht_hT" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
            <!-- 차트 박스 -->
            <div class="chart-box box text-white" style="height: 300px; display: flex;">
                <!-- 차트 영역 -->
                <div style="flex: 1;">
                    <!-- Chart.js 오각형 차트 삽입 -->
                    <canvas id="pentagonChart" width="400" height="300"></canvas>
                </div>
                <!-- 평가 항목 문구 -->
                <div style="flex: 1; padding-left: 20px;">
                    <ul>
                        <li><strong>펌핑감</strong>: 목표 부위에 얼마나 타격을 잘 주는지</li>
                        <li><strong>난이도</strong>: 동작이 얼마나 쉬운지</li>
                        <li><strong>희소성</strong>: 헬스장에 얼마나 비치되어 있는지</li>
                        <li><strong>안전성</strong>: 수행하다 부상을 입을 확률이 얼마나 되는지</li>
                        <li><strong>무게감</strong>: 얼만큼의 무게로 수행하면 좋은지</li>
                        <br>
                        <br>
                        <!-- "나도 평가하러 가기" 버튼 부분 수정 -->
                        <button style="background-color: #871e9b;" class="text-white py-2 px-6" id="openModalBtn">나도 평가하러 가기</button>

                        <!-- 모달창 HTML -->
                        <div id="reviewModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
                            <div class="bg-white text-black w-96 p-6 rounded">
                                <h2 class="text-lg font-bold mb-4">운동 평가하기</h2>
                                <form action="<%= request.getContextPath() %>/AddReviewServlet" method="post">
                                    <!-- workout_id, member_id는 숨김 필드나 세션에서 처리 -->
                                    <input type="hidden" name="workout_id" value="<%= workoutId %>">
                                    <%
                                        if (user != null) {
                                    %>
                                    <input type="hidden" name="member_id" value="<%= user.getUsername() %>">
                                    <%
                                        } else {
                                            // 로그인하지 않은 경우 로그인 페이지로 리다이렉트 등의 처리
                                        }
                                    %>

                                    <!-- 각 항목에 대해 1~5점 라디오 버튼 -->
                                    <p class="font-bold mb-2">펌핑감</p>
                                    <div class="flex space-x-4 mb-4">
                                        <label><input type="radio" name="pumping" value="1" required>1</label>
                                        <label><input type="radio" name="pumping" value="2">2</label>
                                        <label><input type="radio" name="pumping" value="3">3</label>
                                        <label><input type="radio" name="pumping" value="4">4</label>
                                        <label><input type="radio" name="pumping" value="5">5</label>
                                    </div>

                                    <p class="font-bold mb-2">난이도</p>
                                    <div class="flex space-x-4 mb-4">
                                        <label><input type="radio" name="difficulty" value="1" required>1</label>
                                        <label><input type="radio" name="difficulty" value="2">2</label>
                                        <label><input type="radio" name="difficulty" value="3">3</label>
                                        <label><input type="radio" name="difficulty" value="4">4</label>
                                        <label><input type="radio" name="difficulty" value="5">5</label>
                                    </div>

                                    <p class="font-bold mb-2">희소성</p>
                                    <div class="flex space-x-4 mb-4">
                                        <label><input type="radio" name="rarity" value="1" required>1</label>
                                        <label><input type="radio" name="rarity" value="2">2</label>
                                        <label><input type="radio" name="rarity" value="3">3</label>
                                        <label><input type="radio" name="rarity" value="4">4</label>
                                        <label><input type="radio" name="rarity" value="5">5</label>
                                    </div>

                                    <p class="font-bold mb-2">안전성</p>
                                    <div class="flex space-x-4 mb-4">
                                        <label><input type="radio" name="safety" value="1" required>1</label>
                                        <label><input type="radio" name="safety" value="2">2</label>
                                        <label><input type="radio" name="safety" value="3">3</label>
                                        <label><input type="radio" name="safety" value="4">4</label>
                                        <label><input type="radio" name="safety" value="5">5</label>
                                    </div>

                                    <p class="font-bold mb-2">무게감</p>
                                    <div class="flex space-x-4 mb-4">
                                        <label><input type="radio" name="weight" value="1" required>1</label>
                                        <label><input type="radio" name="weight" value="2">2</label>
                                        <label><input type="radio" name="weight" value="3">3</label>
                                        <label><input type="radio" name="weight" value="4">4</label>
                                        <label><input type="radio" name="weight" value="5">5</label>
                                    </div>

                                    <!-- 한줄평 -->
                                    <p class="font-bold mb-2">한줄평</p>
                                    <textarea name="comment" class="w-full border border-gray-300 p-2 mb-4" rows="3" required></textarea>

                                    <div class="flex justify-end space-x-2">
                                        <button type="button" class="bg-gray-500 text-white py-1 px-3 rounded" id="closeModalBtn">취소</button>
                                        <button type="submit" class="bg-purple-700 text-white py-1 px-3 rounded">제출</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 운동 상세 섹션 끝 -->

<!-- 유저 한줄평 섹션 시작 -->
<div class="review-section w-full max-w-custom mx-auto mt-8 box border border-white">
    <div class="p-4">
        <a href="#" class="text-blue-400 text-lg font-bold">운동 한줄평 보기</a>
        <ul class="mt-4 space-y-4 text-white">
            <% for (ReviewDTO review : reviews) { %>
            <li class="border-t border-gray-600 pt-4">
                <%= review.getComment() %>
                <div class="flex justify-end mt-2 space-x-4">
                    <!-- 좋아요 버튼 -->
                    <div class="flex items-center space-x-2">
                        <form action="<%= request.getContextPath() %>/likeReview" method="post" style="display:inline;">
                            <input type="hidden" name="review_id" value="<%= review.getReviewId() %>">
                            <input type="hidden" name="action" value="like">
                            <button type="submit" class="text-white <% if (review.isUserLiked()) { %>liked<% } %>">👍</button>
                        </form>
                        <span><%= review.getLikeCount() %></span>
                    </div>
                    <!-- 싫어요 버튼 -->
                    <div class="flex items-center space-x-2">
                        <form action="<%= request.getContextPath() %>/likeReview" method="post" style="display:inline;">
                            <input type="hidden" name="review_id" value="<%= review.getReviewId() %>">
                            <input type="hidden" name="action" value="dislike">
                            <button type="submit" class="text-white <% if (review.isUserDisliked()) { %>disliked<% } %>">👎</button>
                        </form>
                        <span><%= review.getDislikeCount() %></span>
                    </div>
                </div>
            </li>
            <% } %>
        </ul>
    </div>
</div>
<!-- 유저 한줄평 섹션 끝 -->

<!-- 추천/별로 버튼 섹션 시작 -->
<div class="recommend-section w-full max-w-custom mx-auto mt-4 flex justify-center space-x-4">
    <button class="bg-red-500 text-white py-2 px-4 rounded flex items-center space-x-2">
        <span>👍</span>
        <span>이 운동 추천!</span>
        <span>234,567</span>
    </button>
    <button class="bg-blue-500 text-white py-2 px-4 rounded flex items-center space-x-2">
        <span>👎</span>
        <span>별로에요...</span>
        <span>234</span>
    </button>
</div>
<!-- 추천/별로 버튼 섹션 끝 -->

<!-- 두 개의 세로 섹션 시작 -->
<div class="w-full max-w-custom mx-auto mt-8 grid grid-cols-12 gap-4">
    <!-- 왼쪽 섹션 -->
    <div class="col-span-6 box border border-white p-4" style="height: 700px; overflow: auto;">
        <h3 style="color: #871e9b;" class="text-lg font-bold mb-4 text-center">이 운동은 어떠세요?</h3>
        <div class="grid grid-cols-2 gap-4">
            <%
                // WorkoutDAO를 사용하여 다른 운동 추천 목록을 가져옵니다.
                // 예시로 현재 운동과 다른 몇 개의 운동을 가져오는 로직을 추가
                WorkoutDAO otherWorkoutDAO = new WorkoutDAO();
                List<WorkoutDTO> otherWorkouts = otherWorkoutDAO.getOtherWorkouts(workoutId, 4); // 예: 현재 운동 제외, 4개
                for (WorkoutDTO otherWorkout : otherWorkouts) {
            %>
            <div class="flex flex-col items-center justify-center border border-white p-2">
                <a href="<%= request.getContextPath() %>/workoutDetail.jsp?workoutId=<%= otherWorkout.getWorkoutId() %>">
                    <img src="<%= otherWorkout.getWorkoutImage() %>" alt="<%= otherWorkout.getWorkoutName() %> 이미지" class="max-w-48 max-h-48 object-cover">
                    <p class="text-center mt-2 text-white"><%= otherWorkout.getWorkoutName() %></p>
                </a>
            </div>
            <% } %>
        </div>
    </div>
    <!-- 오른쪽 섹션 -->
    <div class="col-span-6 box border border-white p-4" style="height: 700px;">
        <h3 style="color: #871e9b;" class="text-lg font-bold mb-4 text-center">관련 상품 추천</h3>
        <div class="grid grid-cols-2 gap-4">
            <!-- 첫 번째 상품 -->
            <div class="flex flex-col items-center justify-center border border-white p-2 bg-gray-200">
                <img src="${pageContext.request.contextPath}/sub/image/img_1.png" alt="상품 1 설명" class="w-full h-40 object-cover">
                <h4 class="mt-2 text-center text-black">SBD 13mm 레버벨트</h4>
            </div>
            <!-- 두 번째 상품 -->
            <div class="flex flex-col items-center justify-center border border-white p-2 bg-gray-200">
                <img src="${pageContext.request.contextPath}/sub/image/img_1.png" alt="상품 2 설명" class="w-full h-40 object-cover">
                <h4 class="mt-2 text-center text-black">SBD 13mm 레버벨트</h4>
            </div>
            <!-- 세 번째 상품 -->
            <div class="flex flex-col items-center justify-center border border-white p-2 bg-gray-200">
                <img src="${pageContext.request.contextPath}/sub/image/img_1.png" alt="상품 3 설명" class="w-full h-40 object-cover">
                <h4 class="mt-2 text-center text-black">SBD 13mm 레버벨트</h4>
            </div>
            <!-- 네 번째 상품 -->
            <div class="flex flex-col items-center justify-center border border-white p-2 bg-gray-200">
                <img src="${pageContext.request.contextPath}/sub/image/img_1.png" alt="상품 4 설명" class="w-full h-40 object-cover">
                <h4 class="mt-2 text-center text-black">SBD 13mm 레버벨트</h4>
            </div>
        </div>
    </div>
</div>

<!-- 두 개의 세로 섹션 끝 -->

<!-- 푸터 포함 -->
<%@ include file="../footer.jsp" %>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- 햄버거 메뉴 스크립트 -->
<script>
    const hamburger = document.getElementById('hamburger');
    const dropdownMenu = document.getElementById('dropdown-menu');

    hamburger.addEventListener('click', () => {
        dropdownMenu.classList.toggle('flex');
        dropdownMenu.classList.toggle('hidden');
    });
</script>
<!-- Chart.js 오각형 차트 스크립트 -->
<script>
    // 차트 데이터를 동적으로 설정하거나 고정 데이터 사용
    const data = {
        labels: ['펌핑감', '난이도', '희소성', '안전성', '무게'],
        datasets: [{
            label: '운동 메트릭스',
            data: [
                <%= workoutScore.getAveragePumping() %>,
                <%= workoutScore.getAverageDifficulty() %>,
                <%= workoutScore.getAverageRarity() %>,
                <%= workoutScore.getAverageSafety() %>,
                <%= workoutScore.getAverageWeight() %>
            ],
            fill: true,
            backgroundColor: 'rgba(135, 30, 155, 0.2)',
            borderColor: 'rgba(135, 30, 155, 1)',
            pointBackgroundColor: 'rgba(135, 30, 155, 1)',
            pointBorderColor: '#fff',
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: 'rgba(135, 30, 155, 1)'
        }]
    };

    // 차트 옵션을 설정합니다.
    const config = {
        type: 'radar',
        data: data,
        options: {
            elements: {
                line: {
                    borderWidth: 3
                }
            },
            scales: {
                r: {
                    angleLines: {
                        color: '#ffffff'
                    },
                    grid: {
                        color: '#ffffff'
                    },
                    pointLabels: {
                        color: '#ffffff'
                    },
                    ticks: {
                        backdropColor: 'transparent',
                        color: '#ffffff'
                    }
                }
            },
            plugins: {
                legend: {
                    labels: {
                        color: '#ffffff'
                    }
                }
            }
        },
    };

    // 차트를 초기화합니다.
    var pentagonChart = new Chart(
        document.getElementById('pentagonChart'),
        config
    );

</script>

<script>
    const openModalBtn = document.getElementById('openModalBtn');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const reviewModal = document.getElementById('reviewModal');

    openModalBtn.addEventListener('click', () => {
        reviewModal.classList.remove('hidden');
    });

    closeModalBtn.addEventListener('click', () => {
        reviewModal.classList.add('hidden');
    });

    // 모달 바깥 클릭 시 닫기
    window.addEventListener('click', (e) => {
        if (e.target === reviewModal) {
            reviewModal.classList.add('hidden');
        }
    });
</script>
</body>
</html>