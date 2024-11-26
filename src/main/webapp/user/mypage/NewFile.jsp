<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI 입력 페이지</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white">
    <div class="max-w-lg mx-auto p-4">
        <form action="bmiResult.jsp" method="post" class="space-y-6 max-w-[1440px] mx-auto p-4">
            <!-- 키 입력 -->
            <div class="flex items-center">
                <div class="flex-1 text-right pr-4">
                    <label for="height">키</label>
                </div>
                <div class="flex-2 w-full justify-between">

                    <input type="text" id="height" name="height" placeholder="cm" class="bg-black text-white border-b border-gray-500 w-full focus:outline-none focus:border-white">

                </div>
            </div>

            <!-- 몸무게 입력 -->
            <div class="flex items-center">
                <div class="flex-1 text-right pr-4">
                    <label for="weight">몸무게</label>
                </div>
                <div class="flex-2 w-full">
                    <input type="text" id="weight" name="weight" placeholder="kg" class="bg-black text-white border-b border-gray-500 w-full focus:outline-none focus:border-white">
                </div>
            </div>

            <!-- 성별 입력 -->
            <div class="flex items-center">
                <div class="flex-1 text-right pr-4">
                    <label for="gender">성별</label>
                </div>
                <div class="flex-2 w-full">
                    <select id="gender" name="gender" class="bg-black text-white border-b border-gray-500 w-full focus:outline-none focus:border-white">
                        <option value="남성">남성</option>
                        <option value="여성">여성</option>
                        <option value="선택안함">선택안함</option>
                    </select>
                </div>
            </div>

            <!-- 나이 입력 -->
            <div class="flex items-center">
                <div class="flex-1 text-right pr-4">
                    <label for="age">나이</label>
                </div>
                <div class="flex-2 w-full">
                    <input type="text" id="age" name="age" placeholder="만 세" class="bg-black text-white border-b border-gray-500 w-full focus:outline-none focus:border-white">
                </div>
            </div>
			<div class="flex">
	            <!-- 개인정보 동의 -->
	            <div class="flex items-center justify-center">
	                <input type="checkbox" id="agreement" name="agreement" class="mr-2">
	                <label for="agreement" class="text-sm py-2">개인정보 수집 및 이용에 대한 동의</label>
	            </div>
	            
	        </div>
	        <!-- 입력 버튼 -->
	        <div class="flex justify-end">
	            <button type="submit" class="bg-orange-500 text-black px-4 py-1 rounded-full ">입력</button>
	        </div>
        </form>

        <!-- 날짜 선택 -->
        <div class="flex justify-center items-center mt-8">
            <button class="px-4">&lt;</button>
            <div class="px-4">24.11.11 (월)</div>
            <button class="px-4">&gt;</button>
        </div>
        
        <!-- BMI 결과 -->
        <div class="mt-8 text-center flex items-center">
            <div id="sidebar" class="mb-4">
                <img src="image/hum.png" alt="체형 그래프" class="mx-auto">
            </div>
            <div>
                <div class="flex items-center">
                <label for="age" class="flex-1 text-right pr-4">당신의 BMI지수는...</label>
                <input type="text" id="age" name="age" placeholder="" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">몸통</label>
                <input type="text" id="weight" name="weight" placeholder="" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">왼팔</label>
                <input type="text" id="weight" name="weight" placeholder="kg" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">오른팔</label>
                <input type="text" id="weight" name="weight" placeholder="kg" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">왼다리</label>
                <input type="text" id="weight" name="weight" placeholder="kg" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
            	<div class="flex items-center">
                <label for="weight" class="flex-1 text-right pr-4">오른다리</label>
                <input type="text" id="weight" name="weight" placeholder="kg" class="flex-2 bg-black text-white border-b border-gray-500 focus:outline-none focus:border-white">
            	</div>
            	
                
            </div>
        </div>
        
        <!-- 체형 테마 -->
        <div class="mt-8 text-center">
            <div>
                <img src="theme_placeholder.png" alt="체성분 균형에 따른 CID 유형" class="mx-auto">
            </div>
            <div class="mt-4">
                <p>체중</p>
                <div class="bg-gray-800 h-2 rounded-full w-full mb-2">
                    <div class="bg-purple-500 h-full rounded-full" style="width: 50%;"></div>
                </div>
                <p>과체중</p>
                <div class="bg-gray-800 h-2 rounded-full w-full mb-2">
                    <div class="bg-purple-500 h-full rounded-full" style="width: 30%;"></div>
                </div>
                <p>저지방량</p>
                <div class="bg-gray-800 h-2 rounded-full w-full">
                    <div class="bg-purple-500 h-full rounded-full" style="width: 20%;"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>