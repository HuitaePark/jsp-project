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
        /* 슬라이더 이미지 스타일 */
        #brand-slider img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        /* 슬라이더 네비게이션 버튼 스타일 */
        #prev, #next {
            font-size: 24px;
            cursor: pointer;
        }
        /* 슬라이더 인디케이터 스타일 */
        .flex.space-x-1 span {
            background-color: #ffffff;
        }
        section{
            margin: 100px;
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
            <a href="#">내정보</a>
            <a href="#" style="border-radius: 0; background-color: #871e9b;">로그인</a>
        </nav>
    </div>
    <!-- 드롭다운 메뉴 -->
    <div class="dropdown-menu flex flex-col items-center" id="dropdown-menu">
        <a href="#">Home</a>
        <a href="#">운동정보</a>
        <a href="#">내정보</a>
        <a href="#">로그인</a>
    </div>
</header>
<!-- 헤더 끝 -->

<!-- 슬라이더 시작 -->
<div class="swiper-container w-full max-w-custom mx-auto mt-20" style="height: 500px; overflow: hidden; position: relative;">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <img src="<%= request.getContextPath() %>/images/main1.png" alt="팔 운동 1" class="w-full h-full object-cover">
        </div>
        <div class="swiper-slide">
            <img src="<%= request.getContextPath() %>/images/main2.png" alt="가슴 운동 1" class="w-full h-full object-cover">
        </div>
        <div class="swiper-slide">
            <img src="<%= request.getContextPath() %>/images/main3.png" alt="하체 운동 1" class="w-full h-full object-cover">
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

<!-- 추가된 컨텐츠 시작 -->
<div class="content">
    <div class="content-one">
        <div class="content-first-title">
            <h2>당신의 피트니스 여정을 함께 합시다.</h2>
        </div>
        <div class="content-first-imgbox">
            <img src="<%= request.getContextPath() %>/images/image39.png" class="content-first-img1"/>
        </div>
    </div>

    <div class="content-two">
        <div class="content-left">
            <img src="<%= request.getContextPath() %>/images/img3.jpg" class="content-two-img"/>
            <img src="<%= request.getContextPath() %>/images/img4.jpg" class="content-two-img"/>
        </div>
        <div class="content-right">
            <img src="<%= request.getContextPath() %>/images/img5.jpg" class="content-two-right-img"/>
            <img src="<%= request.getContextPath() %>/images/img6.jpg" class="content-two-right-img"/>
        </div>
    </div>

    <div class="content-three">
        <div class="content-three-left">
            <div class="content-three-left-title">
                <div class="font-anton text-4xl">
                <h2>Store</h2>
                </div>
                <p>당신의 피트니스 여정을 함께합니다</p>
            </div>
            <div class="content-three-arrow">
                <img src="<%= request.getContextPath() %>/images/left-arrow.png" class="content-three-left-arrow"/>
                <img src="<%= request.getContextPath() %>/images/right-arrow.png" class="content-three-right-arrow"/>
            </div>
            <div class="content-three-left-img">
                <img src="<%= request.getContextPath() %>/images/image39.png"/>
            </div>
        </div>

        <div class="content-three-right">
            <div class="content-three-right-img">
                <img src="<%= request.getContextPath() %>/images/image39.png"/>
            </div>
            <div class="content-three-right-title font-anton">
                <p>LOCATION</p>
            </div>
        </div>
    </div>
</div>
<!-- 추가된 컨텐츠 끝 -->
<!-- 공지사항 섹션 -->
<section class="flex mt-8 text-center">
    <h2 class="transform -rotate-90 text-4xl font-bold whitespace-nowrap">INFORMATION</h2>
    <ul class="mt-4 space-y-2">
        <li><a href="#" class="hover:underline text-2xl">공지사항 1</a></li>
        <li><a href="#" class="hover:underline text-2xl">공지사항 2</a></li>
        <li><a href="#" class="hover:underline text-2xl">공지사항 3</a></li>
        <li><a href="#" class="hover:underline text-2xl">공지사항 4</a></li>
    </ul>
</section>
<!-- 브랜드 섹션 -->
<section class="mt-8 px-4 max-w-[1440px] mx-auto text-center">
    <!-- 브랜드 설명과 버튼 -->
    <div class="flex flex-col items-center space-y-4">
        <h2 class="text-lg font-semibold">BRAND</h2>
        <p class="text-sm">운동복 및 액세서리 브랜드</p>
        <button class="px-4 py-2 bg-purple-600 rounded text-white">더보기</button>
    </div>

    <!-- 브랜드 슬라이더 -->
    <div class="relative w-full max-w-lg mx-auto mt-4">
        <!-- 슬라이더 내용 -->
        <div id="brand-slider" class="flex transition-transform duration-500">
            <!-- 슬라이드 그룹 (각 그룹에 6개의 이미지) -->
            <div class="grid grid-cols-3 grid-rows-2 gap-4">
                <div><img src="<%= request.getContextPath() %>/images/nike.png" alt="Brand 1" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/adidas.png" alt="Brand 2" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/nike.png" alt="Brand 3" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/adidas.png" alt="Brand 4" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/nike.png" alt="Brand 5" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/adidas.png" alt="Brand 6" class="w-full h-24 object-cover"></div>
            </div>
            <!-- 추가 슬라이드 그룹 -->
            <div class="grid grid-cols-3 grid-rows-2 gap-4">
                <div><img src="<%= request.getContextPath() %>/images/nike.png" alt="Brand 7" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/adidas.png" alt="Brand 8" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/nike.png" alt="Brand 9" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/adidas.png" alt="Brand 10" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/nike.png" alt="Brand 11" class="w-full h-24 object-cover"></div>
                <div><img src="<%= request.getContextPath() %>/images/adidas.png" alt="Brand 12" class="w-full h-24 object-cover"></div>
            </div>
        </div>

        <!-- 네비게이션 버튼과 인디케이터 -->
        <div class="flex justify-center items-center mt-4 space-x-2">
            <button id="prev" class="text-white">❮</button>
            <div class="flex space-x-1">
                <!-- 슬라이드 인디케이터 -->
                <span class="w-2 h-2 bg-white rounded-full inline-block"></span>
                <span class="w-2 h-2 bg-white rounded-full inline-block"></span>
            </div>
            <button id="next" class="text-white">❯</button>
        </div>
    </div>
</section>

<!-- 푸터 포함 -->
<%@ include file="../footer.jsp" %>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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

<!-- 운동 카테고리 스크립트 -->
<script>
    const exercises = {
        arms: [
            { name: '덤벨 컬', image: contextPath + '/images/dumbbell-curl.png' },
            { name: '바벨 컬', image: contextPath + '/images/barbell-curl.png' },
            { name: '트라이셉스 익스텐션', image: contextPath + '/images/triceps-extension.png' },
        ],
        chest: [
            { name: '벤치 프레스', image: contextPath + '/images/bench-press.png' },
            { name: '푸쉬업', image: contextPath + '/images/push-up.png' },
            { name: '덤벨 플라이', image: contextPath + '/images/dumbbell-fly.png' },
        ],
        legs: [
            { name: '스쿼트', image: contextPath + '/images/squrt.png' },
            { name: '런지', image: contextPath + '/images/lunge.png' },
            { name: '레그 프레스', image: contextPath + '/images/leg-press.png' },
        ],
        back: [
            { name: '데드리프트', image: contextPath + '/images/deadlift.png' },
            { name: '렛 풀다운', image: contextPath + '/images/latpulldown.png' },
            { name: '바벨 로우', image: contextPath + '/images/barbell-row.png' },
        ],
        shoulders: [
            { name: '숄더 프레스', image: contextPath + '/images/shoulder-press.png' },
            { name: '사이드 레터럴 레이즈', image: contextPath + '/images/sarere.png' },
            { name: '프론트 레이즈', image: contextPath + '/images/front-raise.png' },
        ],
    };

    const categoryButtons = document.querySelectorAll('.category-btn');
    const exerciseContainer = document.getElementById('exercise-container');
    const moreButton = document.getElementById('more-button');

    categoryButtons.forEach(button => {
        button.addEventListener('click', () => {
            categoryButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            const category = button.getAttribute('data-category');
            const selectedExercises = exercises[category];

            exerciseContainer.innerHTML = '';
            selectedExercises.forEach(exercise => {
                const exerciseItem = document.createElement('div');
                exerciseItem.classList.add('exercise-item', 'border', 'p-4', 'rounded');

                const img = document.createElement('img');
                img.src = exercise.image;
                img.alt = exercise.name;
                img.classList.add('w-full', 'object-cover', 'mb-2');

                const name = document.createElement('h3');
                name.textContent = exercise.name;
                name.classList.add('text-lg', 'font-bold', 'text-center');

                exerciseItem.appendChild(img);
                exerciseItem.appendChild(name);

                exerciseContainer.appendChild(exerciseItem);
            });

            moreButton.classList.remove('hidden');
        });
    });

    window.addEventListener('DOMContentLoaded', () => {
        const defaultButton = document.querySelector('.category-btn[data-category="arms"]');
        if (defaultButton) {
            defaultButton.click();
        }
    });

    moreButton.addEventListener('click', () => {
        alert('더 많은 운동을 보려면 로그인하세요!');
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
<!-- 브랜드 슬라이더 스크립트 추가 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        let currentSlide = 0;
        const slides = document.querySelectorAll("#brand-slider > div"); // 슬라이드 그룹 선택
        const totalSlides = slides.length;

        function updateSlidePosition() {
            const slider = document.getElementById("brand-slider");
            slider.style.transform = `translateX(-${currentSlide * 100}%)`;
        }

        // 다음 슬라이드 버튼 이벤트
        document.getElementById("next").addEventListener("click", function() {
            currentSlide = (currentSlide + 1) % totalSlides;
            updateSlidePosition();
        });

        // 이전 슬라이드 버튼 이벤트
        document.getElementById("prev").addEventListener("click", function() {
            currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
            updateSlidePosition();
        });
    });
</script>
</body>
</html>x