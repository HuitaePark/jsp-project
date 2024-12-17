<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        .section {
            padding: 20px;
            margin: 0 auto;
            max-width: 1500px;
            margin-top: 500px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #444;
            padding-bottom: 10px;
        }

        .section-header h2 {
            font-size: 24px;
            font-weight: bold;
        }

        .section-header a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            display: flex;
            align-items: center;
        }

        .section-header a:hover {
            text-decoration: underline;
        }

        .section-header a svg {
            margin-left: 5px;
            width: 16px;
            height: 16px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .product-card {
            background-color: #222;
            border-radius: 8px;
            overflow: hidden;
            padding: 20px;
            text-align: center;
        }

        .product-card img {
            width: 100%;
            height: 350px;
            margin-bottom: 15px;
            border-radius: 8px;
        }

        .product-card h3 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-card .manufacturer {
            font-size: 14px;
            color: #aaa;
            margin-bottom: 10px;
        }

        .product-card .price {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 16px;
        }

        .product-card .price .original {
            text-decoration: line-through;
            color: #888;
            margin-right: 10px;
        }

        .product-card .price .discounted {
            font-size: 18px;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        var contextPath = '<%= request.getContextPath() %>';
    </script>
</head>
<body class="w-full">
<jsp:include page="/header.jsp" />
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
    <h1>Your Fitness Review Site!</h1>
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
    <br>
    <!-- 더보기 버튼 -->
    <div id="more-button-container" class="mt-4 text-center">
        <a href="${pageContext.request.contextPath}/sub/workoutList.jsp">
            <button id="more-button" class="hidden">더보기</button>
        </a>
    </div>


<div class="flex justify-center" style="margin-top: 500px;">
    <jsp:include page="/main/board.jsp" />
</div>


    <section class="section">
        <!-- 헤더 -->
        <div class="section-header">
            <h2>스토어 카테고리</h2>
            <a href="#">
                구매하러 가기
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"></path>
                </svg>
            </a>
        </div>

        <!-- 제품 카드 그리드 -->
        <div class="product-grid">
            <!-- 반복되는 상품 카드 -->
            <div class="product-card">
                <img src="<%= request.getContextPath() %>/main/images/product1.png" alt="상품 이미지">
                <h3>스타우트 프로틴</h3>
                <p class="manufacturer">제조사: 베이커브랜드</p>
                <div class="price">
                    <span class="original">₩80,000</span>
                    <span class="discounted">₩49,000</span>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath() %>/main/images/product2.png" alt="상품 이미지">
                <h3>스타우트 프로틴</h3>
                <p class="manufacturer">제조사: 파워쉐이크</p>
                <div class="price">
                    <span class="original">₩80,000</span>
                    <span class="discounted">₩49,000</span>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath() %>/main/images/product3.jpg" alt="상품 이미지">
                <h3>얼티밋 골드</h3>
                <p class="manufacturer">제조사: 피트밀</p>
                <div class="price">
                    <span class="original">₩97,400</span>
                    <span class="discounted">₩93,504</span>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath() %>/main/images/product4.png" alt="상품 이미지">
                <h3>퍼스널 벌크 포뮬러</h3>
                <p class="manufacturer">제조사: 프로틴라이프</p>
                <div class="price">
                    <span class="original">₩45,000</span>
                    <span class="discounted">₩37,000</span>
                </div>
            </div>
        </div>
    </section>

<!-- 공지사항 섹션 -->
<section class="justify-center items-center" style="margin-top: 500px; height: 700px; padding: 20px;">
    <!-- 세로 글자 -->
    <h2 class="transform -rotate-90 font-bold mr-12" style=" font-size: 80px; color: white; text-transform: uppercase; letter-spacing: 5px;">
        Information
    </h2>

    <!-- 공지사항 리스트 -->
    <ul style="line-height: 2.5; color: white; font-size: 24px; text-align: left; list-style-type: none; padding-left: 0;">
        <li><a href="#" class="hover:underline">올바른 스쿼트 자세 꿀팁 공개</a></li>
        <li><a href="#" class="hover:underline">30일 플랭크 챌린지 - 도전하고 상품 받기</a></li>
        <li><a href="#" class="hover:underline">헬스장 1월 프로모션 - 이용권 최대 20% 할인</a></li>
        <li><a href="#" class="hover:underline">최신 운동 트렌드 정보</a></li>
    </ul>
</section>
<!-- 푸터 포함 -->
<jsp:include page="/footer.jsp" />
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
            { id: 7, name: '덤벨 컬', image: contextPath + '/images/dumbbell-curl.png' },
            { id: 8, name: '바벨 컬', image: contextPath + '/images/barbell-curl.png' },
            { id: 9, name: '트라이셉스 익스텐션', image: contextPath + '/images/triceps-extension.png' },
        ],
        chest: [
            { id: 4, name: '벤치 프레스', image: contextPath + '/images/bench-press.png' },
            { id: 2, name: '푸쉬업', image: contextPath + '/images/push-up.png' },
            { id: 10, name: '덤벨 플라이', image: contextPath + '/images/dumbbell-fly.png' },
        ],
        legs: [
            { id: 1, name: '스쿼트', image: contextPath + '/images/squrt.png' },
            { id: 5, name: '런지', image: contextPath + '/images/lunge.png' },
            { id: 11, name: '레그 프레스', image: contextPath + '/images/leg-press.png' },
        ],
        back: [
            { id: 12, name: '데드리프트', image: contextPath + '/images/deadlift.png' },
            { id: 13, name: '렛 풀다운', image: contextPath + '/images/latpulldown.png' },
            { id: 6, name: '바벨 로우', image: contextPath + '/images/barbell-row.png' },
        ],
        shoulders: [
            { id: 3, name: '숄더 프레스', image: contextPath + '/images/shoulder-press.png' },
            { id: 14, name: '사이드 레터럴 레이즈', image: contextPath + '/images/sarere.png' },
            { id: 15, name: '프론트 레이즈', image: contextPath + '/images/front-raise.png' },
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

                // 운동 디테일 페이지로 이동할 수 있는 링크 생성
                const link = document.createElement('a');
                link.href = contextPath + '/sub/workoutDetail.jsp?workoutId=' + exercise.id;
                link.classList.add('block');

                const img = document.createElement('img');
                img.src = exercise.image;
                img.alt = exercise.name;
                img.classList.add('w-full', 'object-cover', 'mb-2');

                const name = document.createElement('h3');
                name.textContent = exercise.name;
                name.classList.add('text-lg', 'font-bold', 'text-center');

                link.appendChild(img);
                link.appendChild(name);
                exerciseItem.appendChild(link);

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
</html>