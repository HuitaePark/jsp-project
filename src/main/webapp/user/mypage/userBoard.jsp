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
    <link href="${pageContext.request.contextPath}/user/usernavbar/usernavbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/user.css" rel="stylesheet">
    <style>
        /* 팝업창 스타일 */
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
        }
        .popup-content {
            background-color: #1f2937; /* 다크 배경 */
            color: white;
            padding: 30px;
            border-radius: 12px;
            width: 600px; /* 팝업 창 너비 확장 */
            text-align: left;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
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
    </style>
</head>
<body class="bg-gray-900 text-white">
    <!-- 전체 레이아웃 -->
    <div class="flex h-screen">
        <!-- 사이드바 -->
        <jsp:include page="/user/usernavbar/usernavbar.jsp" />

        <!-- 메인 콘텐츠 -->
        <main class="w-3/4 bg-gray-900 p-6">
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
                            <span class="bg-green-500 text-xs px-2 py-1 rounded">체형 안전</span>
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
                    <h2 class="text-xl font-semibold mb-4">운동 진행중 (1)</h2>
                    <div class="bg-gray-700 rounded-lg p-4 card"
                         data-title="런닝머신"
                         data-time="2024년 12월 3일 5:00 PM"
                         data-status="운동 진행중"
                         data-progress="80%">
                        <h3 class="text-lg font-bold">런닝머신</h3>
                        <p class="text-sm text-gray-400">2024년 12월 3일 5:00 PM</p>
                        <div class="flex gap-2 mt-3">
                            <span class="bg-orange-500 text-xs px-2 py-1 rounded">유산소</span>
                            <span class="bg-yellow-500 text-xs px-2 py-1 rounded">체력증진</span>
                        </div>
                    </div>
                     <button class="mt-4 text-green-500 open-popup">+ New</button>
                </div>

                <!-- 완료된 운동 -->
                <div class="bg-gray-800 rounded-lg shadow-lg p-4">
                    <h2 class="text-xl font-semibold mb-4">완료된 운동 (2)</h2>
                    <div class="bg-gray-700 rounded-lg p-4 mb-4 card"
                         data-title="팔 굽혀 펴기"
                         data-time="2024년 12월 2일 6:00 PM"
                         data-status="완료됨"
                         data-progress="100%">
                        <h3 class="text-lg font-bold">팔 굽혀 펴기</h3>
                        <p class="text-sm text-gray-400">2024년 12월 2일 6:00 PM</p>
                        <div class="flex gap-2 mt-3">
                            <span class="bg-pink-500 text-xs px-2 py-1 rounded">Strength</span>
                            <span class="bg-green-500 text-xs px-2 py-1 rounded">Systematic</span>
                        </div>
                    </div>
                     <button class="mt-4 text-green-500 open-popup">+ New</button>
                </div>
            </div>
        </main>
    </div>

    <!-- 팝업 창 -->
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
            <div class="mb-6">
                <p class="text-sm text-gray-400 mb-2">진행 상황:</p>
                <div class="h-2 bg-gray-600 rounded-full">
                    <div id="popup-progress" class="h-2 bg-green-500 rounded-full" style="width: 66%;"></div>
                </div>
            </div>
            <div class="mb-6">
                <h4 class="text-lg font-bold mb-3">할 일:</h4>
                <ul class="list-disc list-inside text-sm text-gray-300 space-y-2">
                    <li>운동 준비 자세 잡기</li>
                    <li>세트 완료하기</li>
                    <li>스트레칭으로 마무리</li>
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
            <form id="new-card-form">
                <div class="mb-5">
                    <label for="title" class="block text-sm font-medium text-gray-400 mb-2">운동 이름</label>
                    <input type="text" id="title" class="w-full px-4 py-2 bg-gray-700 text-white rounded-md focus:ring-2 focus:ring-blue-500" placeholder="운동 이름 입력" required>
                </div>
                <div class="mb-5">
                    <label for="time" class="block text-sm font-medium text-gray-400 mb-2">운동 시간</label>
                    <input type="datetime-local" id="time" class="w-full px-4 py-2 bg-gray-700 text-white rounded-md focus:ring-2 focus:ring-blue-500" required>
                </div>
                <div class="mb-5">
                    <label for="status" class="block text-sm font-medium text-gray-400 mb-2">운동 상태</label>
                    <input type="text" id="status" class="w-full px-4 py-2 bg-gray-700 text-white rounded-md focus:ring-2 focus:ring-blue-500" placeholder="운동 상태 입력" required>
                </div>
                <div class="flex gap-4 mt-6">
                    <button type="submit" class="flex-1 bg-green-600 hover:bg-green-500 text-white font-bold py-2 rounded-md">등록</button>
                    <button type="button" class="flex-1 bg-gray-600 hover:bg-gray-500 text-white font-bold py-2 rounded-md" onclick="closeNewCardPopup()">취소</button>
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

                // 팝업 열기
                document.querySelectorAll('.open-popup').forEach(button => {
                    button.addEventListener('click', () => {
                        newCardPopup.style.display = 'flex';
                    });
                });

                // 팝업 닫기
                function closeNewCardPopup() {
                    newCardPopup.style.display = 'none';
                }

                // 폼 제출 핸들러
                newCardForm.addEventListener('submit', (event) => {
                    event.preventDefault();

                    const title = document.getElementById('title').value;
                    const time = document.getElementById('time').value;
                    const status = document.getElementById('status').value;

                    const newCard = document.createElement('div');
                    newCard.classList.add('bg-gray-700', 'rounded-lg', 'p-4', 'mb-4', 'card');
                    newCard.setAttribute('data-title', title);
                    newCard.setAttribute('data-time', time);
                    newCard.setAttribute('data-status', status);
                    newCard.innerHTML = `
                        <h3 class="text-lg font-bold">${title}</h3>
                        <p class="text-sm text-gray-400">${time}</p>
                        <div class="flex gap-2 mt-3">
                            <span class="bg-gray-500 text-xs px-2 py-1 rounded">${status}</span>
                        </div>
                    `;
                    document.querySelector('.open-popup').parentElement.insertBefore(newCard, document.querySelector('.open-popup'));
                    closeNewCardPopup();
                    newCardForm.reset();
                });
    </script>
</body>
</html>
