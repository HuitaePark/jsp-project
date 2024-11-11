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
    <!-- 외부 CSS 파일 링크 추가 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

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
            <img src="images/main1.png" alt="팔 운동 1" class="w-full h-full object-cover">
        </div>
        <div class="swiper-slide">
            <img src="images/main2.png" alt="가슴 운동 1" class="w-full h-full object-cover">
        </div>
        <div class="swiper-slide">
            <img src="images/main3.png" alt="하체 운동 1" class="w-full h-full object-cover">
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
    <div id="exercise-container" class="mt-6 grid grid-cols-1 md:grid-cols-3 gap-4 justify-items-center">
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
            { name: '덤벨 컬', image: 'images/dumbbell-curl.png' },
            { name: '바벨 컬', image: 'images/barbell-curl.png' },
            { name: '트라이셉스 익스텐션', image: 'images/triceps-extension.png' },
        ],
        chest: [
            { name: '벤치 프레스', image: 'images/bench-press.png' },
            { name: '푸쉬업', image: 'images/push-up.png' },
            { name: '덤벨 플라이', image: 'images/dumbbell-fly.png' },
        ],
        legs: [
            { name: '스쿼트', image: 'images/squrt.png' },
            { name: '런지', image: 'images/lunge.png' },
            { name: '레그 프레스', image: 'images/leg-press.png' },
        ],
        back: [
            { name: '데드리프트', image: 'images/deadlift.png' },
            { name: '렛 풀다운', image: 'images/latpulldown.png' },
            { name: '바벨 로우', image: 'images/barbell-row.png' },
        ],
        shoulders: [
            { name: '숄더 프레스', image: 'images/shoulder-press.png' },
            { name: '사이드 레터럴 레이즈', image: 'images/sarere.png' },
            { name: '프론트 레이즈', image: 'images/front-raise.png' },
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
                img.classList.add('w-full','object-cover', 'mb-2');

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