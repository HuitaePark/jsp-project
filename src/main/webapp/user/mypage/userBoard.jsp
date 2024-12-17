<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드 페이지</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- 사용자 정의 CSS -->
    <link href="<c:url value="/user/usernavbar/usernavbar.css"/>" rel="stylesheet">

    <style>
        /* 파블엑처 스타일 */
        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            overflow-y: scroll; /* 스크롤 추가 */
        }
        .popup-content {
            background-color: #1f2937; /* 다크 배경 */
            color: white;
            padding: 30px;
            border-radius: 12px;
            width: 600px; /* 파블엑 창 너비 확장 */
            text-align: left;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-height: 80vh; /* 최대 높이 설정 */
            overflow-y: auto; /* 내용 넘칠 때 스크롤 */
        }
        .popup-content h3 {
            margin-bottom: 20px;
            font-size: 1.75rem;
        }
        .popup-content ul {
            margin-top: 10px;
        }
        .popup-content ul li {
            margin-bottom: 10px;
        }
        .popup-content button {
            margin-top: 20px;
            width: 100%;
        }

        .flex-wrap {
            display: flex; /* Flexbox로 설정 */
            flex-wrap: wrap; /* 줄버팅 활성화 */
            gap: 1rem; /* 버팅 간 간격 */
            justify-content: space-between; /* 버팅 간 간격 군일화 */
        }

        .category-button {
            flex: 0 1 calc(25% - 1rem); /* 1줄에 4개씩 표시 (25% 너비) */
            padding: 6px 12px; /* 높이와 너비를 줄이기 위한 패딩 */
            font-size: 0.875rem; /* 폰트 크기 조정 */
            border-radius: 6px; /* 들판 모서리 유지 */
            text-align: center; /* 텍스트 가운데 정렬 */
            white-space: nowrap; /* 텍스트 줄버팅 방지 */
            cursor: pointer; /* 카운서 변경 */
            transition: background-color 0.3s ease; /* 부드러운 색상 전환 */
        }

        .category-button.selected {
            background-color: #2c3e50; /* 어두운 색으로 변경 */
            color: white;
        }

        #add-status-btn {
            padding: 4px;
            font-size: 0.875rem;
            width: auto; /* 범위를 제한하여 너비 각장 */
            height: auto; /* 높이를 텍스트와 동일하게 조정 */
            line-height: 1; /* 텍스트와 버튼 크기를 맞추기 위해 라인 높이 설정 */
        }

        .button-container {
            display: flex;
            justify-content: space-between; /* 버튼을 좌우로 정렬 */
            margin-top: 20px; /* 상단 여백 추가 */
        }

    </style>
</head>
<body class="bg-black-900 text-white">
    <!-- 전체 레이아웃 -->
    <div class="flex h-screen">
        <!-- 사이드바 -->
         <jsp:include page="/user/usernavbar/usernavbar.jsp" />


        <!-- 메인 콘텐츠 -->
        <main class="w-3/4 bg-black-900 p-6">
            <!-- 상단 네비게이션 -->
            <div class="flex items-center justify-between mb-6">
                <div>
                    <h2 class="text-sm text-gray-400">내 운동 대시보드</h2>
                    <h1 class="text-2xl font-bold">대시보드</h1>
                </div>
                <button class="bg-purple-600 hover:bg-purple-500 text-white px-4 py-2 rounded">Share</button>
            </div>

            <!-- Kanban 보드 -->
            <div class="grid grid-cols-3 gap-6">
                <!-- 운동 예정 -->
                <div class="bg-gray-800 rounded-lg shadow-lg p-4">
                    <h2 class="text-xl font-semibold mb-4">운동 예정 (2)</h2>
                    <div class="bg-gray-700 rounded-lg p-4 mb-4 card"
                         data-title="오늘은 등 운동"
                         data-time="2024년 12월 3일 4:05 PM"
                         data-status="운동 준비"
                         data-progress="66%">
                        <h3 class="text-lg font-bold">오늘은 등 운동</h3>
                        <p class="text-sm text-gray-400">2024년 12월 3일 4:05 PM</p>
                        <div class="flex gap-2 mt-3">
                            <span class="bg-yellow-500 text-xs px-2 py-1 rounded">근력강화</span>
                            <span class="bg-blue-500 text-xs px-2 py-1 rounded">근지구력</span>
                            <span class="bg-green-500 text-xs px-2 py-1 rounded">채형 안정</span>
                        </div>
                        <div class="mt-4">
                            <div class="h-2 bg-gray-600 rounded-full">
                                <div class="h-2 bg-green-500 rounded-full" style="width: 66%;"></div>
                            </div>
                        </div>
                    </div>
                    <button class="mt-4 text-green-500 open-popup">+ New</button>
                </div>

                <!-- 운동 진행중 -->
                <div class="bg-gray-800 rounded-lg shadow-lg p-4">
                    <h2 class="text-xl font-semibold mb-4">운동 진행중</h2>
                    <div class="bg-gray-700 rounded-lg p-4 card"
                         data-title="런닝메신"
                         data-time="2024년 12월 3일 5:00 PM"
                         data-status="운동 진행중"
                         data-progress="80%">
                        <h3 class="text-lg font-bold">런닝머신</h3>
                        <p class="text-sm text-gray-400">2024년 12월 3일 5:00 PM</p>
                        <div class="flex gap-2 mt-3">
                            <span class="bg-blue-500 text-xs px-2 py-1 rounded">근지구력</span>
                            <span class="bg-yellow-500 text-xs px-2 py-1 rounded">체력증진</span>
                        </div>

                        <div class="mt-4">
                            <div class="h-2 bg-gray-600 rounded-full">
                                <div class="h-2 bg-green-500 rounded-full" style="width: 66%;"></div>
                            </div>
                        </div>

                    </div>
                    
                </div>

                <!-- 완료된 운동 -->
                <div class="bg-gray-800 rounded-lg shadow-lg p-4">
                    <h2 class="text-xl font-semibold mb-4">완료된 운동</h2>
                    <div class="bg-gray-700 rounded-lg p-4 mb-4 card"
                         data-title="팔 굴향 포기"
                         data-time="2024년 12월 2일 6:00 PM"
                         data-status="완료됨"
                         data-progress="100%">
                        <h3 class="text-lg font-bold">팔 굽혀 펴기</h3>
                        <p class="text-sm text-gray-400">2024년 12월 2일 6:00 PM</p>
                        <div class="flex gap-2 mt-3">
                            <span class="bg-pink-500 text-xs px-2 py-1 rounded">하체운동</span>
                            <span class="bg-green-500 text-xs px-2 py-1 rounded">스트레칭</span>
                        </div>

                        <div class="mt-4">
                            <div class="h-2 bg-gray-600 rounded-full">
                                <div class="h-2 bg-green-500 rounded-full" style="width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </main>
    </div>

    <!-- 파블엑 창 -->
    <div id="popup" class="popup-overlay">
        <div class="popup-content">
            <h3 id="popup-title" class="text-2xl font-bold flex items-center">
                <span class="text-yellow-400 mr-2">💪</span> 운동 상세 정보
            </h3>
            <p class="text-sm text-gray-400 flex items-center mb-4">
                <span class="text-blue-400 mr-2">📅</span> <span id="popup-time">2024년 12월 3일 4:05 PM</span>
            </p>
            <p class="text-sm text-gray-400 flex items-center mb-4">
                <span class="text-red-400 mr-2">📌</span> 상태: <span id="popup-status" class="ml-2 text-white">운동 준비</span>
            </p>
              <div class="flex gap-2 mt-5">
                <span class="bg-yellow-500 text-xs px-2 py-1 rounded">근력강화</span>
                <span class="bg-blue-500 text-xs px-2 py-1 rounded">근지구력</span>
                <span class="bg-green-500 text-xs px-2 py-1 rounded">채형 안정</span>
                </div>
            <div class="mb-6">
                <p class="text-sm text-gray-400 mt-3 mb-2">진행 상황:</p>
                <div class="h-2 bg-gray-600 rounded-full">
                    <div id="popup-progress" class="h-2 bg-green-500 rounded-full" style="width: 66%;"></div>
                </div>
            </div>
            <div class="mb-6">
                <h4 class="text-lg font-bold mb-3">할 일:</h4>
                <ul class="list-disc list-inside text-sm text-gray-300 space-y-2">
                    <li>운동 준비 자세 잡기</li>
                    <li>세트 완료하기</li>
                    <li>스트레치로 마무리</li>
                </ul>
            </div>
            <button class="bg-purple-600 hover:bg-purple-500 text-white px-6 py-2 rounded" onclick="closePopup()">
                닫기
            </button>
        </div>
    </div>

   <div id="new-card-popup" class="popup-overlay">
    <div class="popup-content">
        <h3 class="text-2xl font-bold flex items-center gap-2 mb-6">
            <span class="text-blue-500">📝</span> 일정 등록
        </h3>
        <form id="new-card-form" action="${pageContext.request.contextPath}/userboard" method="post">
            <!-- 운동 이름 -->
            <div class="mb-5">
                <label for="title" class="block text-sm font-medium text-gray-400 mb-2">운동 이름</label>
                <input type="text" id="title" name="name" class="w-full px-4 py-2 bg-gray-700 text-white rounded-md focus:ring-2 focus:ring-blue-500" placeholder="운동 이름 입력" required>
            </div>

            <!-- 카테고리 선택 -->
          <div class="mb-4">
    <label class="block text-sm font-medium text-gray-400 mb-2">카테고리</label>
    <div class="flex flex-wrap gap-4">
        <!-- 운동 부위 (버튼으로 변경) -->
        <button type="button" class="category-button bg-blue-200 text-white px-4 py-2 rounded" data-value="상체 운동">상체 운동</button>
        <button type="button" class="category-button bg-pink-500 text-white px-4 py-2 rounded" data-value="하체 운동">하체 운동</button>
        <button type="button" class="category-button bg-purple-400 text-white px-4 py-2 rounded" data-value="북부 운동">복부 운동</button>
        <button type="button" class="category-button bg-green-400 text-white px-4 py-2 rounded" data-value="등 운동">등 운동</button>
        <button type="button" class="category-button bg-yellow-400 text-white px-4 py-2 rounded" data-value="어게 운동">어께 운동</button>
        <button type="button" class="category-button bg-red-400 text-white px-4 py-2 rounded" data-value="팔 운동">팔 운동</button>
        <button type="button" class="category-button bg-indigo-400 text-white px-4 py-2 rounded" data-value="허리 운동">허리 운동</button>
        <button type="button" class="category-button bg-gray-400 text-white px-4 py-2 rounded" data-value="가승 운동">가슴 운동</button>

        <!-- 운동 목적 -->
        <button type="button" class="category-button bg-blue-200 text-white px-4 py-2 rounded" data-value="근력 강화">근력 강화</button>
        <button type="button" class="category-button bg-pink-500 text-white px-4 py-2 rounded" data-value="근지구력">근지 구력</button>
        <button type="button" class="category-button bg-purple-400 text-white px-4 py-2 rounded" data-value="채형 안정">채형 안정</button>
        <button type="button" class="category-button bg-green-400 text-white px-4 py-2 rounded" data-value="유산소">유산소</button>
        <button type="button" class="category-button bg-yellow-400 text-white px-4 py-2 rounded" data-value="심평 강화">체력 증진</button>
        <button type="button" class="category-button bg-red-400 text-white px-4 py-2 rounded" data-value="스트레치는">스트레칭</button>
        <button type="button" class="category-button bg-indigo-400 text-white px-4 py-2 rounded" data-value="지방 연소">지방 연소</button>
        <button type="button" class="category-button bg-gray-400 text-white px-4 py-2 rounded" data-value="코어 강화">코어 강화</button>
    </div>
    <!-- 선택된 카테고리를 서버로 전송하기 위한 hidden input -->
    <input type="hidden" id="category" name="category" value="">
</div>


            <!-- 운동 시간 -->
            <div class="mb-5">
                <label for="time" class="block text-sm font-medium text-gray-400 mb-2">운동 시간</label>
                <input type="datetime-local" id="time" name="time" class="w-full px-4 py-2 bg-gray-700 text-white rounded-md focus:ring-2 focus:ring-blue-500" required>
            </div>

            <!-- 운동 상태 -->
           <div class="mb-5">
    <label for="status" class="block text-sm font-medium text-gray-400 mb-2">운동 상태</label>
    <div id="status-container">
        <input type="text" id="status" name="status" class="w-full px-4 py-2 bg-gray-700 text-white rounded-md focus:ring-2 focus:ring-blue-500" placeholder="추가 상태 입력">
    </div>
    <input type="hidden" id="final-status" name="final-status" value="">
    <button type="button" id="add-status-btn" class="mt-2 bg-gray-600 hover:bg-gray-500 text-white px-4 py-2 rounded-md">+ 상태 추가</button>
</div>

            <!-- 등록 및 취소 버튼 -->
            <div class="button-container">
                <button type="button" class="bg-gray-600 hover:bg-gray-500 text-white font-bold py-2 px-4 rounded-md" onclick="closeNewCardPopup()">취소</button>
                <button type="submit" class="bg-purple-600 hover:bg-purple-500 text-white font-bold py-2 px-4 rounded-md">등록</button>
            </div>
        </form>
    </div>
</div>



    <!-- JavaScript -->
    <script>
        const cards = document.querySelectorAll('.card');
        const popup = document.getElementById('popup');
        const popupTitle = document.getElementById('popup-title');
        const popupTime = document.getElementById('popup-time');
        const popupStatus = document.getElementById('popup-status');
        const popupProgress = document.getElementById('popup-progress');

        
        
        cards.forEach(card => {
            card.addEventListener('click', () => {
                popupTitle.textContent = card.getAttribute('data-title');
                popupTime.textContent = card.getAttribute('data-time');
                popupStatus.textContent = card.getAttribute('data-status');
                popupProgress.style.width = card.getAttribute('data-progress');
                popup.style.display = 'flex';
            });
        });

        function closePopup() {
            popup.style.display = 'none';
        }

        const newCardPopup = document.getElementById('new-card-popup');
        const newCardForm = document.getElementById('new-card-form');

        // 파블엑 열기
        document.querySelectorAll('.open-popup').forEach(button => {
            button.addEventListener('click', () => {
                newCardPopup.style.display = 'flex';
            });
        });

        // 파블엑 닫기
        function closeNewCardPopup() {
            newCardPopup.style.display = 'none';
        }

        // 카테고리 버튼 클릭 시 색상 변경 및 선택 상태 토글
      const categoryButtons = document.querySelectorAll('.category-button');
const categoryInput = document.getElementById('category');

categoryButtons.forEach(button => {
    button.addEventListener('click', () => {
        categoryInput.value = button.getAttribute('data-value');
        categoryButtons.forEach(btn => btn.classList.remove('selected'));
        button.classList.add('selected');
    });
});


      

        // + 버튼 클릭 시 추가 입력 필드 생성
        const addStatusBtn = document.getElementById('add-status-btn');
        const additionalStatusContainer = document.getElementById('additional-status-container');

       

        newCardForm.addEventListener('submit', (event) => {
            event.preventDefault();
            console.log("제출 데이터:", new FormData(newCardForm));
            newCardForm.submit();
            
            
            const title = document.getElementById('title').value;
            const time = document.getElementById('time').value;
            const category = selectedCategoryInput.value;

            const newCard = document.createElement('div');
            newCard.classList.add('bg-gray-700', 'p-4', 'rounded-lg', 'shadow-md', 'mb-4');
            newCard.innerHTML = `
                <h3 class="text-lg font-bold">${title}</h3>
                <p class="text-sm text-gray-400">${time}</p>
                <div class="flex gap-2 mt-3">
                    <span class="bg-blue-500 text-xs px-2 py-1 rounded">${category}</span>
                </div>
                <div class="mt-4">
                    <div class="h-2 bg-gray-600 rounded-full">
                        <div class="h-2 bg-green-500 rounded-full" style="width: ${progress}%;"></div>
                    </div>
                </div>
            `;

            // 카드 추가
            cardContainer.appendChild(newCard);

            // 폼 초기화 및 팝업 닫기
            newCardForm.reset();
            popup.style.display = 'none';
            selectedCategoryInput.value = '';
            categoryButtons.forEach(btn => btn.classList.remove('selected'));
        });
    </script>
</body>
</html>