<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>운동정보 사이트</title>
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
        /* 슬라이더 스타일 시작 */
        .swiper-container {
            height: 500px;
            overflow: hidden;
            position: relative;
        }
        /* 내비게이션 버튼 스타일 수정 */
        .swiper-button-next,
        .swiper-button-prev {
            background-color: transparent;
            width: auto;
            height: auto;
            color: #ffffff;
            font-size: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 10;
            cursor: pointer;
        }
        .swiper-button-next {
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
        }
        .swiper-button-prev {
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
        }
        /* 슬라이더 슬라이드 이미지 스타일 */
        .swiper-slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        /* 숫자 페이지네이션 스타일 */
        .swiper-pagination {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            position: absolute;
            top: 0;
            right: 10px;
            transform: translateY(0);
            z-index: 20;
        }
        .swiper-pagination .swiper-pagination-bullet {
            width: auto;
            height: auto;
            padding: 5px 10px;
            margin: 5px 0;
            background: none;
            color: #ffffff;
            border-radius: 9999px;
            font-size: 16px;
            cursor: pointer;
            transition: color 0.3s;
            font-weight: bold;
        }
        .swiper-pagination .swiper-pagination-bullet-active {
            color: #871e9b;
            font-weight: bold;
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
            <a href="#">Home</a>
            <a href="#">운동정보</a>
            <a href="#">게시판</a>
            <a href="#">쇼핑몰</a>
            <a href="#" style="border-radius: 0; background-color: #871e9b;">로그인</a>
        </nav>
    </div>
    <!-- 드롭다운 메뉴 -->
    <div class="dropdown-menu flex flex-col items-center" id="dropdown-menu">
        <a href="#">Home</a>
        <a href="#">운동정보</a>
        <a href="#">게시판</a>
        <a href="#">쇼핑몰</a>
        <a href="#">로그인</a>
    </div>
</header>
<!-- 헤더 끝 -->

<!-- 슬라이더 시작 -->
<div class="swiper-container w-full max-w-custom mx-auto mt-20">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <img src="<%= request.getContextPath() %>/images/new-image1.png" alt="새 이미지 1" class="w-full h-full object-cover">
        </div>
        <div class="swiper-slide">
            <img src="<%= request.getContextPath() %>/images/new-image2.png" alt="새 이미지 2" class="w-full h-full object-cover">
        </div>
        <div class="swiper-slide">
            <img src="<%= request.getContextPath() %>/images/new-image3.png" alt="새 이미지 3" class="w-full h-full object-cover">
        </div>
        <!-- 추가 슬라이드 -->
    </div>
    <!-- 내비게이션 버튼 -->
    <button class="swiper-button-prev" aria-label="이전 슬라이드"></button>
    <button class="swiper-button-next" aria-label="다음 슬라이드"></button>
    <!-- 페이지네이션 -->
    <div class="swiper-pagination"></div>
</div>
<!-- 슬라이더 끝 -->

<!-- 콘텐츠 섹션 시작 -->
<div class="content-section w-full max-w-custom mx-auto mt-8">
    <div class="grid grid-cols-12 gap-4">
        <!-- 왼쪽 컬럼 -->
        <div class="col-span-5 flex flex-col space-y-4">
            <!-- 운동 이미지 박스 -->
            <div class="exercise-image-box box flex items-center justify-center" style="height: 300px;">
                <!-- 운동 이미지 삽입 -->
                <img src="<%= request.getContextPath() %>/images/exercise-image.png" alt="운동 이미지" class="w-full h-full object-cover">
            </div>
            <!-- 운동 설명 박스 -->
            <div class="exercise-description-box box text-white" style="height: 400px;">
                <!-- 운동 설명 삽입 -->
                <p>운동 설명이 여기에 들어갑니다.</p>
            </div>
        </div>
        <!-- 오른쪽 컬럼 -->
        <div class="col-span-7 flex flex-col space-y-4">
            <!-- 유튜브 콘텐츠 박스 -->
            <div class="youtube-content-box box" style="height: 400px;">
                <!-- 유튜브 콘텐츠 삽입 -->
                <iframe width="100%" height="100%" src="https://www.youtube.com/embed/영상_ID" frameborder="0" allowfullscreen></iframe>
            </div>
            <!-- 차트 박스 -->
            <div class="chart-box box text-white" style="height: 300px;">
                <!-- Chart.js 오각형 차트 삽입 -->
                <canvas id="pentagonChart" width="400" height="300"></canvas>
            </div>
        </div>
    </div>
</div>
<!-- 콘텐츠 섹션 끝 -->
<!-- 유저 한줄평 섹션 시작 -->
<div class="review-section w-full max-w-custom mx-auto mt-8 box border border-white">
    <div class="p-4">
        <a href="#" class="text-blue-400 text-lg font-bold">전체 운동 한줄평/추천 보기</a>
        <ul class="mt-4 space-y-4 text-white">
            <li class="border-t border-gray-600 pt-4">
                앞으로 차지만 않으면 대퇴사두에 매우 좋은 운동
                <div class="flex justify-end mt-2 space-x-4">
                    <div class="flex items-center space-x-2">
                        <button class="text-white">👍</button>
                        <span>20</span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <button class="text-white">👎</button>
                        <span>20</span>
                    </div>
                </div>
            </li>
            <li class="border-t border-gray-600 pt-4">
                여러분 무릎 조심하세요 ㅠㅠ
                <div class="flex justify-end mt-2 space-x-4">
                    <div class="flex items-center space-x-2">
                        <button class="text-white">👍</button>
                        <span>20</span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <button class="text-white">👎</button>
                        <span>20</span>
                    </div>
                </div>
            </li>
            <li class="border-t border-gray-600 pt-4">
                대체 이거 무게 어깨 올리는거임 ;;
                <div class="flex justify-end mt-2 space-x-4">
                    <div class="flex items-center space-x-2">
                        <button class="text-white">👍</button>
                        <span>20</span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <button class="text-white">👎</button>
                        <span>20</span>
                    </div>
                </div>
            </li>
            <li class="border-t border-gray-600 pt-4">
                박재훈식으로 하니까 자극 지림
                <div class="flex justify-end mt-2 space-x-4">
                    <div class="flex items-center space-x-2">
                        <button class="text-white">👍</button>
                        <span>20</span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <button class="text-white">👎</button>
                        <span>20</span>
                    </div>
                </div>
            </li>
        </ul>
        <div class="mt-4 text-center">
            <button class="bg-purple-600 text-white py-2 px-6 rounded-full">한줄평 입력</button>
        </div>
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
    <div class="col-span-6 box border border-white p-4" style="height: 700px;">
        <h3 class="text-purple-500 text-lg font-bold mb-4 text-center">이 운동은 어떠세요?</h3>
        <div class="grid grid-cols-2 gap-4">
            <div class="flex flex-col items-center justify-center border border-white p-2">
                <img src="<%= request.getContextPath() %>/images/exercise1.png" alt="운동 이미지 1" class="w-full h-auto">
                <p class="text-center mt-2 text-white">레그익스텐션</p>
            </div>
            <div class="flex flex-col items-center justify-center border border-white p-2">
                <img src="<%= request.getContextPath() %>/images/exercise1.png" alt="운동 이미지 2" class="w-full h-auto">
                <p class="text-center mt-2 text-white">레그익스텐션</p>
            </div>
            <div class="flex flex-col items-center justify-center border border-white p-2">
                <img src="<%= request.getContextPath() %>/images/exercise1.png" alt="운동 이미지 3" class="w-full h-auto">
                <p class="text-center mt-2 text-white">레그익스텐션</p>
            </div>
            <div class="flex flex-col items-center justify-center border border-white p-2">
                <img src="<%= request.getContextPath() %>/images/exercise1.png" alt="운동 이미지 4" class="w-full h-auto">
                <p class="text-center mt-2 text-white">레그익스텐션</p>
            </div>
        </div>
    </div>
    <!-- 오른쪽 섹션 -->
    <div class="col-span-6 box border border-white p-4" style="height: 700px;">
        <h3 class="text-purple-500 text-lg font-bold mb-4 text-center">관련 상품 추천</h3>
        <div class="grid grid-cols-2 gap-4">
            <div class="flex flex-col items-center justify-center border border-white p-2 bg-gray-200">
                <div class="w-full h-40 bg-gray-400"></div> <!-- 상품 이미지 자리 -->
            </div>
            <div class="flex flex-col items-center justify-center border border-white p-2 bg-gray-200">
                <div class="w-full h-40 bg-gray-400"></div> <!-- 상품 이미지 자리 -->
            </div>
            <div class="flex flex-col items-center justify-center border border-white p-2 bg-gray-200">
                <div class="w-full h-40 bg-gray-400"></div> <!-- 상품 이미지 자리 -->
            </div>
            <div class="flex flex-col items-center justify-center border border-white p-2 bg-gray-200">
                <div class="w-full h-40 bg-gray-400"></div> <!-- 상품 이미지 자리 -->
            </div>
        </div>
        <div class="text-center mt-4">
            <button class="bg-purple-600 text-white py-2 px-6 rounded-full">스토어 더보기</button>
        </div>
    </div>
</div>
<!-- 두 개의 세로 섹션 끝 -->
<!-- 두 개의 세로 섹션 끝 -->
<!-- 푸터 포함 -->
<%@ include file="../footer.jsp" %>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- 슬라이더 초기화 -->
<script>
    var swiper = new Swiper('.swiper-container', {
        direction: 'vertical',
        loop: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
            renderBullet: function (index, className) {
                return '<span class="' + className + '">' + (index + 1) + '</span>';
            },
        },
    });
</script>
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
    // 차트 데이터를 정의합니다.
    const data = {
        labels: ['힘', '속도', '민첩성', '지구력', '유연성'],
        datasets: [{
            label: '운동 메트릭스',
            data: [80, 90, 70, 85, 75], // 실제 데이터로 교체하세요.
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
</body>
</html>