<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>운동정보 사이트</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <!-- Google Fonts 추가 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <!-- 커스텀 스타일 -->
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
        @layer utilities {
            .font-anton {
                font-family: 'Anton', sans-serif;
            }
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

        .swiper-container {
            height: 500px;
            overflow: hidden;
            position: relative;
        }

        /* 내비게이션 버튼 스타일 수정 */
        .swiper-button-next,
        .swiper-button-prev {
            /* 배경색 제거 */
            background-color: transparent;
            /* 버튼 크기 조정 */
            width: auto;
            height: auto;
            /* 색상 흰색으로 설정 */
            color: #ffffff;
            /* 폰트 크기 크게 설정 */
            font-size: 50px;
            /* 정렬 및 배치 */
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 10;
            /* 커서 포인터 */
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
        /* 숫자 페이지네이션 */
        /* 숫자 페이징 스타일 - 상단으로 이동 */
        .swiper-pagination {
            display: flex;
            flex-direction: column; /* 수직 정렬 */
            justify-content: flex-start; /* 위쪽 정렬 */
            align-items: center;
            position: absolute;
            top: 0; /* 슬라이더 상단에서 5% 위치 */
            right: 10px;
            transform: translateY(0); /* 기존 translateY 제거 */
            z-index: 20; /* 다른 요소들보다 위에 표시 */
        }

        .swiper-pagination .swiper-pagination-bullet {
            width: auto;
            height: auto;
            padding: 5px 10px;
            margin: 5px 0;
            background: none;
            color: #ffffff; /* 기본 숫자 색상: 흰색 */
            border-radius: 9999px;
            font-size: 16px;
            cursor: pointer;
            transition: color 0.3s;
            font-weight: bold;

        }

        .swiper-pagination .swiper-pagination-bullet-active {
            color: #871e9b; /* 활성화된 숫자 색상: 보라색 */
            font-weight: bold;
        }

        /* 카테고리 버튼 스타일 */
        .category-btn,
        #more-button {
            padding: 12px 24px; /* 패딩을 늘려 버튼 길이 증가 */
            background-color: #000000; /* 검은색 배경 */
            border: 2px solid #871e9b; /* 보라색 테두리 */
            border-radius: 9999px; /* 모서리를 완전히 둥글게 */
            cursor: pointer;
            font-size: 16px;
            color: #ffffff; /* 흰색 텍스트 */
            transition: background-color 0.3s, color 0.3s;
        }

        /* 카테고리 버튼 및 더보기 버튼 호버 효과 */
        .category-btn:hover,
        .category-btn:focus,
        .category-btn.active,
        #more-button:hover,
        #more-button:focus {
            background-color: #871e9b; /* 보라색 배경 */
            color: #ffffff; /* 흰색 텍스트 */
        }

        /* 햄버거 메뉴 스타일 */
        .hamburger {
            cursor: pointer;
            width: 30px;
            height: 30px;
        }

        /* 드롭다운 메뉴 스타일 */
        .dropdown-menu {
            display: none; /* 기본적으로 숨김 */
            position: absolute;
            top: 80px; /* 헤더 높이와 일치 */
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
            color: #871e9b; /* 보라색 텍스트 */
        }

        /* 반응형 디자인: 모바일에서 햄버거 메뉴 보이기 */
        @media (max-width: 768px) {
            .navigation {
                display: none; /* 모바일에서는 네비게이션 숨김 */
            }
            .hamburger {
                display: block; /* 모바일에서 햄버거 메뉴 보이기 */
            }
        }

        /* 네비게이션 링크 스타일 */
        .navigation a {
            background-color: #000000; /* 검은색 배경 */
            color: #ffffff; /* 흰색 텍스트 */
            padding: 12px 24px;
            border: none; /* 테두리 제거 */
            border-radius: 9999px; /* 모서리를 완전히 둥글게 */
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
        }

        /* 네비게이션 링크 호버 효과 */
        .navigation a:hover {
            background-color: #871e9b; /* 보라색 배경 */
            color: #ffffff; /* 흰색 텍스트 */
        }
    </style>
</head>
<body class="w-full">
<!-- 헤더 시작 -->
<header class="w-full fixed top-0 left-0 z-50" style="height: 80px;">
    <div class="mx-auto flex items-center justify-between h-full max-w-custom px-4">
        <!-- 햄버거 메뉴: 이미지로 교체 -->
        <!-- 사용자가 직접 제공하는 이미지 경로로 src를 변경하세요 -->
        <img src="${pageContext.request.contextPath}/images/hamburger.png" alt="메뉴" class="hamburger" id="hamburger" style="width:30px; height:30px;">

        <!-- 네비게이션 링크 (오른쪽 정렬) -->
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
<div class="swiper-container w-full max-w-custom mx-auto mt-20" style="height: 500px; overflow: hidden; position: relative;">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <img src="https://i.namu.wiki/i/86W9sP6fWmmwusq26vlZHvND3KcPgH2uWtYQ2go-uzqxhVPhlW3feh2F0VLk2OZ4h7tlfD-WODj8RSQxZkenuA.webp" alt="팔 운동 1" class="w-full h-full object-cover">
        </div>
        <div class="swiper-slide">
            <img src="https://i.ytimg.com/vi/qlb27fneP8w/maxresdefault.jpg" alt="가슴 운동 1" class="w-full h-full object-cover">
        </div>
        <div class="swiper-slide">
            <img src="https://i.ytimg.com/vi/-gBA_HA9sV0/maxresdefault.jpg" alt="하체 운동 1" class="w-full h-full object-cover">
        </div>
        <!-- 추가 슬라이드 -->
    </div>
    <!-- 내비게이션 버튼 -->
    <button class="swiper-button-prev" aria-label="이전 슬라이드">

    </button>
    <button class="swiper-button-next" aria-label="다음 슬라이드">

    </button>
    <!-- 페이지네이션 -->
    <div class="swiper-pagination"></div>
</div>
<!-- 슬라이더 끝 -->
<div class="flex justify-center items-center text-6xl margin-8 mt-5 border-black p-4 font-anton">
    <h1>Your Fitness Web Site!</h1>
</div>

<!-- 카테고리 섹션 시작 -->
<div class="w-full max-w-custom mx-auto mt-8">
    <!-- 카테고리 버튼들 -->
    <div class="flex justify-center space-x-4">
        <button class="category-btn active" data-category="arms">팔</button>
        <button class="category-btn" data-category="chest">가슴</button>
        <button class="category-btn" data-category="legs">하체</button>
        <button class="category-btn" data-category="back">등</button>
        <button class="category-btn" data-category="shoulders">어깨</button>
    </div>

    <!-- 운동 아이템들 -->
    <div id="exercise-container" class="mt-6 grid grid-cols-1 md:grid-cols-3 gap-4">
        <!-- 운동 아이템들이 여기에 표시됩니다 -->
    </div>

    <!-- 더보기 버튼 -->
    <div id="more-button-container" class="mt-4 text-center">
        <button id="more-button" class="hidden">더보기</button>
    </div>
</div>
<!-- 카테고리 섹션 끝 -->

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- 슬라이더 초기화 -->
<script>
    var swiper = new Swiper('.swiper-container', {
        direction: 'vertical', // 슬라이더 방향을 수직으로 설정
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

<!-- 운동 카테고리 스크립트 -->
<script>
    // 운동 데이터 예시
    const exercises = {
        arms: [
            { name: '덤벨 컬', image: 'images/Dumbbell-Curl.gif' },
            { name: '바벨 컬', image: 'images/arms2.jpg' },
            { name: '트라이셉스 익스텐션', image: 'images/arms3.jpg' },
        ],
        chest: [
            { name: '벤치 프레스', image: 'images/chest1.jpg' },
            { name: '푸쉬업', image: 'images/chest2.jpg' },
            { name: '덤벨 플라이', image: 'images/chest3.jpg' },
        ],
        legs: [
            { name: '스쿼트', image: 'images/legs1.jpg' },
            { name: '런지', image: 'images/legs2.jpg' },
            { name: '레그 프레스', image: 'images/legs3.jpg' },
        ],
        back: [
            { name: '데드리프트', image: 'images/back1.jpg' },
            { name: '렛 풀다운', image: 'images/back2.jpg' },
            { name: '바벨 로우', image: 'images/back3.jpg' },
        ],
        shoulders: [
            { name: '숄더 프레스', image: 'images/shoulders1.jpg' },
            { name: '사이드 레터럴 레이즈', image: 'images/shoulders2.jpg' },
            { name: '프론트 레이즈', image: 'images/shoulders3.jpg' },
        ],
    };

    const categoryButtons = document.querySelectorAll('.category-btn');
    const exerciseContainer = document.getElementById('exercise-container');
    const moreButton = document.getElementById('more-button');

    // 카테고리 버튼 클릭 이벤트 설정
    categoryButtons.forEach(button => {
        button.addEventListener('click', () => {
            // 모든 버튼에서 active 클래스 제거
            categoryButtons.forEach(btn => btn.classList.remove('active'));
            // 클릭된 버튼에 active 클래스 추가
            button.classList.add('active');

            const category = button.getAttribute('data-category');
            const selectedExercises = exercises[category];

            // 운동 아이템들 렌더링
            exerciseContainer.innerHTML = '';
            selectedExercises.forEach(exercise => {
                const exerciseItem = document.createElement('div');
                exerciseItem.classList.add('exercise-item', 'border', 'p-4', 'rounded');

                const img = document.createElement('img');
                img.src = exercise.image;
                img.alt = exercise.name;
                img.classList.add('w-full', 'h-48', 'object-cover', 'mb-2');

                const name = document.createElement('h3');
                name.textContent = exercise.name;
                name.classList.add('text-lg', 'font-bold', 'text-center');

                exerciseItem.appendChild(img);
                exerciseItem.appendChild(name);

                exerciseContainer.appendChild(exerciseItem);
            });

            // 더보기 버튼 표시
            moreButton.classList.remove('hidden');
        });
    });

    // 페이지 로드 시 '팔' 카테고리의 운동을 표시
    window.addEventListener('DOMContentLoaded', () => {
        // '팔' 카테고리 버튼을 가져옵니다.
        const defaultButton = document.querySelector('.category-btn[data-category="arms"]');
        if (defaultButton) {
            // '팔' 버튼의 클릭 이벤트를 트리거합니다.
            defaultButton.click();
        }
    });

    // 더보기 버튼 클릭 이벤트
    moreButton.addEventListener('click', () => {
        alert('더 많은 운동을 보려면 로그인하세요!');
        // 또는 원하는 동작을 추가하세요
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
</body>
</html>