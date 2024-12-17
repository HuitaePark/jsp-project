<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.jspproject.bodyinfo.BodyInfoDTO" %>
<%@ page import="com.jspproject.mypage.MemberDTO" %>

<%	//임시로 memberid 넣어둠
	MemberDTO member = new MemberDTO();
	member.setMemberid("user1");
	BodyInfoDTO bmi = new BodyInfoDTO();
	bmi.setMemberid("user1");
	
%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-black text-white">
    <div class="flex">
    	<!-- 사이드바 -->
        <aside class="w-1/4">
            <%@ include file="/user/usernavbar/usernavbar.jsp" %>
        </aside>

        <!-- 메인 콘텐츠 -->
        <main class="flex-1 p-8">
        	<form action="${pageContext.request.contextPath}/updateMember" method="post">
            <h1 class="text-2xl font-bold mb-6">회원정보수정</h1>
            
            <!-- hidden input으로 회원 ID 전달 -->
    		<input type="hidden" name="memberid" value="${member.memberid}" />	<!-- 추후 로그인 기능 연동 시 member 지우기 -->
    		
            <!-- 프로필 섹션 -->
            <div class="flex flex-col items-center mb-10">
                <div class="w-24 h-24 bg-gray-600 rounded-full flex items-center justify-center">
                    <span class="text-3xl">👤</span>
                </div>
                <input type="text" name="name" placeholder="닉네임 입력" value="${name}" required class="text-center bg-black text-white mt-2 text-lg border-b border-gray-500 focus:outline-none">
            </div>

            <!-- 이메일 -->
            <div class="mb-4">
                <label class="block text-sm font-semibold mb-1">이메일</label>
                <div class="flex items-center">
                    <input type="email" name="email" placeholder="예: example@gmail.com" value="${email}" required
               			class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 전화번호 -->
            <div class="mb-4">
                <label class="block text-sm font-semibold mb-1">전화번호</label>
                <div class="flex items-center">
                    <input type="text" name="tel" placeholder="(-제외) 010****1234" value="${tel}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 주소 -->
            <div class="mb-6">
                <label class="block text-sm font-semibold mb-1">주소</label>
                <div class="flex items-center">
                    <input type="text" name="addr" placeholder="**시 **구 **동 123-12" value="${addr}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none resize-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>
            
            <!-- 비번 -->
            <div class="mb-6">
                <label class="block text-sm font-semibold mb-1">비밀번호</label>
                <div class="flex items-center">
                    <input type="text" name="password" placeholder="비밀번호 변경" value="${password}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none resize-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>
			<!-- 버튼 -->
            <div class="flex flex-row-reverse">
                <button type="button" name="bodyInfoButton" id="bodyInfoButton" class="px-4 py-2 bg-gray-800 border border-white rounded-md justify-end items-right">신체정보수정</button>
            	<!-- 확인버튼 -->
                <button type="submit" class="px-4 py-2 bg-gray-800 border border-white rounded-md justify-end items-right">수정완료</button>
            </div>
            </form>
            
            
            <form action="${pageContext.request.contextPath}/saveBodyInfo" method="post">
            <div id="bodyInfoSection">
            
            <!-- hidden input으로 회원 ID 전달 -->
    		<input type="hidden" name="memberid" value="<%= bmi.getMemberid() %>" />	<!-- 추후 로그인 기능 연동 시 bmi 지우기 -->
    		
            <!-- 키 -->
            <div class="mb-4">
                <label class="block text-sm font-semibold mb-1">키</label>
                <div class="flex items-center">
                    <input type="text"  id="height" name="height" placeholder="키 cm" value="${height}" required
               			class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 몸무게 -->
            <div class="mb-4">
                <label class="block text-sm font-semibold mb-1">몸무게</label>
                <div class="flex items-center">
                    <input type="text" id="weight" name="weight" placeholder="몸무게 kg" value="${weight}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 성별 -->
            <div class="mb-6">
                <label class="block text-sm font-semibold mb-1">성별</label>
                <div class="flex items-center">
                    <div class="flex-2 w-full">
	                    <select id="gender" name="gender" class="bg-black text-white border-b border-gray-500 w-full focus:outline-none focus:border-white">
	                        <option value="M">남성</option>
	                        <option value="F">여성</option>
	                        <option value="NoN">선택안함</option>
	                    </select>
               	 	</div>
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>
            
            <!-- 나이 -->
            <div class="mb-6">
                <label class="block text-sm font-semibold mb-1">나이</label>
                <div class="flex items-center">
                    <input type="text" id="age" name="age" placeholder="(만)" value="${age}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none resize-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>
            <div class="flex justify-end">
            <!-- 버튼 -->
	            <div class="flex justify-end space-x-4">
	                <button type="button" id="calculateButton" class="px-4 py-2 bg-gray-800 border border-white rounded-md">입력</button>
	            </div>
		    </div>
		    </div>
            
            <div id="inbodyInsert" class="flex mt-8 text-center flex items-center justify-center hidden">
            <div id="chartContainer" style="position: relative; width: 250px; height: 500px;">
			    <!-- 배경 이미지 -->
			    <img src="<%=request.getContextPath() %>/user/mypage/img/body.png" alt="Human Background" style="width: 80%; height: 80%; position: absolute; top: 0; left: 0; z-index: 0;">
			    <!-- 차트 캔버스 -->
			    <canvas id="radarChart" style="position: absolute; width: 100%; height: 100%; top: -70px; left: -35px; z-index: 1;"></canvas>
			</div>
            <div id="radarChartSection" class="mt-6 hidden">
    			<canvas id="radarChart" style="max-width: 600px; margin: auto;"></canvas>
			</div>
            <div>
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">몸통</label>
                <input type="text" id="body" name="body" placeholder="골격근량을 입력(kg)" value="${body}" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">왼팔</label>
                <input type="text" id="leftArm" name="leftArm" placeholder="골격근량을 입력(kg)" value="${leftArm}" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">오른팔</label>
                <input type="text" id="rightArm" name="rightArm" placeholder="골격근량을 입력(kg)" value="${rightArm}" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">왼다리</label>
                <input type="text" id="leftLeg" name="leftLeg" placeholder="골격근량을 입력(kg)" value="${leftLeg}" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">오른다리</label>
                <input type="text" id="rightLeg" name="rightLeg" placeholder="골격근량을 입력(kg)" value="${rightLeg}" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	<button type="button" id="chart" class="mt-4 px-4 py-2 bg-gray-800 border border-white rounded-md">입력</button>
            	<img src="" alt="티어" class="mx-auto hidden">
            </div>
            
            
            
            </div>
            <div id="bmiResultSection" class="mt-6 flex-1 p-8 hidden">
            	<input type="hidden" id="bmiHidden" name="bmi" value="bmiValue" />
                <p id="bmiResult" class="text-lg font-bold mb-4">BMI지수: <span id="bmiValue"></span></p>
                <div style="width: 100%; max-width: 600px; height: 100px; margin: auto;">
                    <canvas id="bmiChart"></canvas>
                </div>
                <button type="submit" id="saveButton" class="mt-4 px-4 py-2 bg-gray-800 border border-white rounded-md" disabled>저장</button>
        	</div>
            </form>
        </main>
    </div>
    
    
    
    <script>

			    let bmiChart;
			    
			    document.getElementById('bodyInfoButton').addEventListener('click', function () {
		            const bodyInfoSection = document.getElementById('bodyInfoSection');
		            bodyInfoSection.classList.toggle('hidden');
		            const selectedGender = document.getElementById('gender').value;
		            let gender;
		            if (selectedGender === '남성') {
		                gender = 'M';
		            } else if (selectedGender === '여성') {
		                gender = 'F';
		            } else {
		                gender = 'NoN';
		            }
		        });
			    
			    
		        // '입력' 버튼 클릭 이벤트
		        document.getElementById('calculateButton').addEventListener('click', function () {
		        	/*const memberidElement = document.getElementById('memberid');
		        	if (!memberidElement) {
		        	    console.error('memberid 요소를 찾을 수 없습니다.');
		        	    return; // 오류 발생 시 함수 종료
		        	}*/
		        	//const memberid = memberidElement.value;
		            const height = parseFloat(document.getElementById('height').value);
		            const weight = parseFloat(document.getElementById('weight').value);
		            
	
		            if (height && weight) {
		                const bmi = (weight / ((height / 100) ** 2)).toFixed(2); // BMI 계산
		                document.getElementById('bmiValue').textContent = bmi;
		                document.getElementById('bmiHidden').value = bmi;
		                document.getElementById('saveButton').disabled = false;
	
		                // 차트 생성 또는 업데이트
		                const ctx = document.getElementById('bmiChart').getContext('2d');
		                if (bmiChart) {
		                    bmiChart.data.datasets[0].data = [bmi];
		                    bmiChart.update();
		                } else {
		                    bmiChart = new Chart(ctx, {
		                        type: 'bar',
		                        data: {
		                            labels: ['BMI'],
		                            datasets: [
		                            {
		                                label: '저체중', // 0 ~ 18.5
		                                data: [bmi <= 18.5 ? bmi : 0], // 해당 구간에만 데이터 표시
		                                backgroundColor: 'rgba(54, 162, 235, 0.6)', // 파란색
		                            },
		                            {
		                                label: '정상', // 18.5 ~ 24.9
		                                data: [bmi > 18.5 && bmi <= 24.9 ? bmi : 0], // 해당 구간에만 데이터 표시
		                                backgroundColor: 'rgba(75, 192, 192, 0.6)', // 초록색
		                            },
		                            {
		                                label: '과체중', // 25 ~ 29.9
		                                data: [bmi > 24.9 && bmi <= 29.9 ? bmi : 0], // 해당 구간에만 데이터 표시
		                                backgroundColor: 'rgba(255, 159, 64, 0.6)', // 주황색
		                            },
		                            {
		                                label: '비만', // 30 이상
		                                data: [bmi > 29.9 ? bmi : 0], // 해당 구간에만 데이터 표시
		                                backgroundColor: 'rgba(255, 99, 132, 0.6)', // 빨간색
		                            },]
		                        },
		                        options: {
		                            responsive: true,
		                            maintainAspectRatio: false,
		                            indexAxis: 'y',
		                            scales: {
		                                x: {
		                                    beginAtZero: true
		                                }
		                            }
		                        }
		                    });
		                }
		                
					
		             	// 저장 버튼 활성화 및 결과 섹션 표시
		             	const inbodySection = document.getElementById('inbodyInsert');
		             	if (inbodySection.classList.contains('hidden')) {
		             		inbodySection.classList.remove('hidden');
		             	}
		             	
		                const bmiSection = document.getElementById('bmiResultSection');
		                if (bmiSection.classList.contains('hidden')) {
		                    bmiSection.classList.remove('hidden');
		                }
		                document.getElementById('saveButton').disabled = false;
		            } else {
		                alert('키와 몸무게를 입력해주세요.');
		            }
		        });
		        
		     ////////////
		     // Radar Chart 객체를 저장할 변수
		        let radarChart;

		        // '입력' 버튼 클릭 이벤트
		        document.getElementById('chart').addEventListener('click', function () {
		            const body = parseFloat(document.getElementById('body').value);
		            const leftArm = parseFloat(document.getElementById('leftArm').value);
		            const rightArm = parseFloat(document.getElementById('rightArm').value);
		            const leftLeg = parseFloat(document.getElementById('leftLeg').value);
		            const rightLeg = parseFloat(document.getElementById('rightLeg').value);

		            // 입력값 유효성 검사
		            if (isNaN(body) || isNaN(leftArm) || isNaN(rightArm) || isNaN(leftLeg) || isNaN(rightLeg)) {
		                alert("모든 값을 올바르게 입력해주세요.");
		                return;
		            }
		            
		            
		         // 점수 계산
		            const totalScore = body + leftArm + rightArm + leftLeg + rightLeg;
		            console.log('Total Score:', totalScore);

		            // 티어 계산 함수
		            const calculateTier = (score) => {
		                if (score <= 89) return 'bronze';
		                if (score <= 109) return 'silver';
		                if (score <= 139) return 'gold';
		                if (score <= 179) return 'platinum';
		                if (score <= 219) return 'diamond';
		                if (score <= 239) return 'master';
		                return 'grandmaster';
		            };
		            
		            const tierName = calculateTier(totalScore);
		            
		            const tierImage = document.querySelector('img[alt="티어"]');
		            if (tierImage) {
		            	tierImage.src = '/user/mypage/img/tier/' + tierName + '.png';
		            	tierImage.classList.remove('hidden');
		            	console.log('Tier Image Path:', tierImage.src);
		            }
		            

		            // 데이터 배열 생성
		            const radarData = [body, leftArm, rightArm, leftLeg, rightLeg];

		            // Radar Chart 생성
		            const ctx = document.getElementById('radarChart').getContext('2d');
		            if (radarChart) {
		                // 이미 차트가 있으면 데이터 업데이트
		                radarChart.data.datasets[0].data = radarData;
		                radarChart.update();
		            } else {
		                // 새 차트 생성
		                radarChart = new Chart(ctx, {
		                    type: 'radar',
		                    data: {
		                        labels: ['몸통', '왼팔', '오른팔', '왼다리', '오른다리'],
		                        datasets: [
		                            {
		                                label: '신체 데이터',
		                                data: radarData,
		                                backgroundColor: 'rgba(255, 99, 132, 0.5)',
		                                borderColor: 'rgba(255, 99, 132, 1)',
		                                borderWidth: 2,
		                            }
		                        ],
		                    },
		                    options: {
		                        responsive: true,
		                        maintainAspectRatio: false, // 캔버스 크기 유지
		                        scales: {
		                            r: {
		                                beginAtZero: true,
		                                suggestedMin: 0,
		                                suggestedMax: 50,
		                            }
		                        },
		                        plugins: {
		                            legend: {
		                                display: true,
		                                position: 'top',
		                            }
		                        }
		                    }
		                });
		            }
		        });
		        
		        
		        console.log('Tier Image Path:', `/user/mypage/img/tier/${tierName}.png`);

			</script>
</body>
</html>