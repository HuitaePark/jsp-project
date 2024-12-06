<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.heetae.jspproject.bodyinfo.BodyInfoDTO" %>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신체정보 입력</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .chart-container {
            border: 1px solid #00f;
            padding: 16px;
            margin: 16px;
            height: 70px;
        }
        #bmiChart {
		    width: 100% !important; /* 캔버스 너비 */
		    height: 100% !important; /* 캔버스 높이 */
		}
    </style>
</head>
<body class="bg-black text-white">
    <div class="flex">
    	<!-- 사이드바 -->
        <aside class="w-1/4">
            <%@ include file="/user/usernavbar/usernavbar.jsp" %>
        </aside>

        <!-- 메인 콘텐츠 -->
        <main class="flex-1 p-8">
        <form id="bmiForm">
            
            <!-- hidden input으로 회원 ID 전달 -->
    		<input type="hidden" id="memberid" name="memberid" value="user01" /> <!-- 회원 ID는 임의로 설정 -->

            <!-- 키 -->
            <div class="mb-4">
                <label class="block text-sm font-semibold mb-1">키</label>
                <div class="flex items-center">
                    <input type="text"  id="height" name="height" placeholder="키 cm" value="${member.height}" required
               			class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 몸무게 -->
            <div class="mb-4">
                <label class="block text-sm font-semibold mb-1">몸무게</label>
                <div class="flex items-center">
                    <input type="text" id="weight" name="weight" placeholder="몸무게 kg" value="${member.weight}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>

            <!-- 성별 -->
            <div class="mb-6">
                <label class="block text-sm font-semibold mb-1">성별</label>
                <div class="flex items-center">
                    <div class="flex-2 w-full">
	                    <select id="gender" name="gender" class="bg-black text-white border-b border-gray-500 w-full focus:outline-none focus:border-white">
	                        <option value="남성">남성</option>
	                        <option value="여성">여성</option>
	                        <option value="선택안함">선택안함</option>
	                    </select>
               	 	</div>
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>
            
            <!-- 나이 -->
            <div class="mb-6">
                <label class="block text-sm font-semibold mb-1">나이</label>
                <div class="flex items-center">
                    <input type="text" id="age" name="age" placeholder="(만)" value="${member.age}" required class="flex-1 bg-black text-white border-b border-gray-500 focus:outline-none resize-none">
                    <button class="ml-2 text-sm text-gray-400">✏️</button>
                </div>
            </div>
            
            <div class="flex justify-end">
	            <div class="flex">
		            <!-- 개인정보 동의 -->
		            <div class="flex items-center justify-start px-4">
		                <input type="checkbox" id="agreement" name="agreement" class="mr-2">
		                <label for="agreement" class="text-sm py-2">개인정보 수집 및 이용에 대한 동의</label>
		            </div>
		        </div>
		        
		        <!-- 버튼 -->
	            <div class="flex justify-end space-x-4">
	                <button type="button" id="calculateButton" class="px-4 py-2 bg-gray-800 border border-white rounded-md">입력</button>
	            </div>
		    </div>
			</form>
			<div id="bmiResultSection" class="mt-6 hidden">
                <p id="bmiResult" class="text-lg font-bold mb-4">BMI지수: <span id="bmiValue"></span></p>
                <div style="width: 100%; max-width: 600px; height: 100px; margin: auto;">
                    <canvas id="bmiChart"></canvas>
                </div>
                <button id="saveButton" class="mt-4 px-4 py-2 bg-gray-800 border border-white rounded-md" disabled>저장</button>
            </div>
		    <script>

			    let bmiChart;
	
		        // '입력' 버튼 클릭 이벤트
		        document.getElementById('calculateButton').addEventListener('click', function () {
		        	const memberidElement = document.getElementById('memberid');
		        	if (!memberidElement) {
		        	    console.error('memberid 요소를 찾을 수 없습니다.');
		        	    return; // 오류 발생 시 함수 종료
		        	}
		        	const memberid = memberidElement.value;
		            const height = parseFloat(document.getElementById('height').value);
		            const weight = parseFloat(document.getElementById('weight').value);
		            
	
		            if (height && weight) {
		                const bmi = (weight / ((height / 100) ** 2)).toFixed(2); // BMI 계산
		                document.getElementById('bmiValue').textContent = bmi;
	
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
		                const bmiSection = document.getElementById('bmiResultSection');
		                if (bmiSection.classList.contains('hidden')) {
		                    bmiSection.classList.remove('hidden');
		                }
		                document.getElementById('saveButton').disabled = false;
		            } else {
		                alert('키와 몸무게를 입력해주세요.');
		            }
		        });
	
		        // '저장' 버튼 클릭 이벤트
		        document.getElementById('saveButton').addEventListener('click', function () {
		        	const memberid = document.getElementById('memberid').value;
		            const height = document.getElementById('height').value;
		            const weight = document.getElementById('weight').value;
		            const age = document.getElementById('age').value;
		            const bmi = (weight / ((height / 100) ** 2)).toFixed(2); // 다시 BMI 계산
		            
		            const genderSelect = document.getElementById('gender');
		            const selectedGender = genderSelect.value;
		            let gender;
		            if (selectedGender === '남성') {
		                gender = 'M';
		            } else if (selectedGender === '여성') {
		                gender = 'F';
		            } else {
		                gender = 'NoN';
		            }
		            
		            const formData = new URLSearchParams();
		            formData.append('memberid', memberid);
		            formData.append('height', height);
		            formData.append('weight', weight);
		            formData.append('gender', gender);
		            formData.append('age', age);
		            formData.append('bmi', bmi);
	
		            // AJAX 요청으로 데이터 저장
		            fetch('${pageContext.request.contextPath}/saveBodyInfo', {
		                method: 'POST',
		                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		                body: formData.toString(),
		            })
		                .then(response => {
		                    if (response.ok) {
		                        return response.text();
		                    } else {
		                        throw new Error('서버 응답이 올바르지 않습니다.');
		                    }
		                })
		                .then(data => {
		                    alert('데이터가 성공적으로 저장되었습니다.');
		                    // 성공 메시지를 표시하거나, DOM 업데이트
		                    const successMessage = document.createElement('p');
		                    successMessage.textContent = '데이터가 성공적으로 저장되었습니다.';
		                    successMessage.classList.add('text-green-500', 'mt-4');
		                    document.body.appendChild(successMessage); // 메시지를 페이지에 추가
		                })
		                .catch(error => {
		                    console.error('저장 중 오류 발생:', error);
		                    alert('데이터 저장 중 오류가 발생했습니다.');
		                });
		        });

			</script>

        </main>
    </div>
</body>
</html>
