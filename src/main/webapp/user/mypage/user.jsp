<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/user/usernavbar/usernavbar.css" rel="stylesheet">
<link href="user.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
   
    <%-- 본문 내용 --%>
   	<div class="user">	
   	  <%-- usernavbar.jsp를 포함 --%>
   	  <jsp:include page="/user/usernavbar/usernavbar.jsp" />
   	  <div class="user-section">
   	  
   	  	<%-- header 부분 --%>
   	    <div class="user-header">
   	       <div class="user-header-left">
   	      
   	       	 <div class="user-header-title-box">
   	       	 	<h2 class="user-header-title">오늘의 목표</h2>
   	       	 </div>
   	       	 
   	       	 <div class="user-header-descript">
   	       	   <p class="user-header-descript">데드리프트 4세트 </p>
   	       	    <p class="user-header-descript"> 암 풀 다운 4세트 </p>
   	       	     <p class="user-header-descript">인클라인 벤치프레스 4세트 </p>
   	       	 </div>
   	 
   	       </div>
   	       
   	        <div class="user-header-center">
   	       <div class="user-header-title-box">
   	       	 	<h2 class="user-header-title">오늘의 일정</h2>
   	       	 </div>
   	       	 
   	       	  <div class="user-header-descript">
   	       	    <p class="user-header-descript">PT 시간: "오후 2:00 PT with Trainer A" </p>
   	       	     <p class="user-header-descript">운동 계획: "오후 3:00 ~ 4:00 하체 운동" </p>
   	       	 </div>
   	       	 
   	       </div>
   	       
   	        <div class="user-header-right">
   	       	<div class="user-header-title-box">
   	       	 	<h2 class="user-header-title">오늘의 식단</h2>
   	       	 </div>
   	       	 
   	       	   <div class="user-header-descript">
   	       	    <p class="user-header-descript">아침: "오트밀, 삶은 달걀 2개" </p>
   	       	     <p class="user-header-descript">점심: "닭가슴살 샐러드" </p>
   	       	     <p class="user-header-descript">저녁: "스테이크, 브로콜리" </p>
   	       	    
   	       	 </div>
   	       </div>
   	    </div>
   	    
   	    <%-- contents 부분 --%>
   	    <div class="user-contents">
   	    	<div class="user-contents-left">
   	    	<canvas id="savingsChart-left" width="400" height="200"></canvas>
   	    	
   	    	</div>
   	    	
   	    	<div class="user-contents-right">
   	    		<h2 class="user-contents-title">랭킹순위</h2>
   	    		<ul class="user-contents-filed">
   	    		 <li>순위</li>
   	    		  <li>이름</li>
   	    		   <li>출석횟수</li>
   	    		    <li>중량</li>
   	    		     <li>횟수</li>
   	    		</ul>
   	    		<ul class="user-contents-data">
   	    		 <li>111</li>
   	    		  <li>user</li>
   	    		   <li>5회</li>
   	    		    <li>150kg</li>
   	    		     <li>5세트</li>
   	    		</ul>
   	    		
   	    		
   	    	</div>
   	    </div>
   	    
   	    
   	    <%-- aside 부분 --%>
   	    <aside class="user-aside">
   	    	<div class="user-aisde-box">
   	    		<canvas id="savingsChart" width="1200" height="400"></canvas>
   	    	</div>
   	    </aside>	
   	  </div>
   		

   	</div>
   	
   	  <script>
        var ctx = document.getElementById('savingsChart-left').getContext('2d');
        var savingsChart = new Chart(ctx, {
            type: 'doughnut', 
            data: {
                labels: ['골격근량', '지방량', '체중량'],
                datasets: [{
                    data: [35, 20, 45], // 예시 데이터: 골격근량, 지방량, 기타 체중 비율
                    backgroundColor: ['#4BC0C0', '#FF6384', '#FFCD56'], 
                    borderWidth: 1,
                  
                }]
            },
            options: {
                responsive: true,
                cutout: '60%', // 도넛의 구멍 크기 설정
                plugins: {
                    legend: {
                        position: 'left', // 범례의 위치 (하단 정렬)
                        labels: {
                            boxWidth: 20, // 범례 상자의 크기 설정
                            padding: 15 // 범례와 텍스트 사이의 여백 설정
                           
                        },
                        align: 'center' // 범례 중앙 정렬
                    },
                    
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw + '%';
                            }
                        }
                    }
                }
            }
        });
        
        var ctx = document.getElementById('savingsChart').getContext('2d');
        var savingsChart = new Chart(ctx, {
            type: 'bar', // 'line', 'bar', 'pie'
            data: {
                labels: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
                datasets: [{
                    label: '운동현황',
                    data: [120, 150, 180, 250, 300, 350, 400],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>