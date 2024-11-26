<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<header class="w-full fixed top-0 left-0 z-50" style="height: 80px;">
    <div class="mx-auto flex items-center justify-between h-full max-w-custom px-4">
        <!-- 햄버거 메뉴 -->
        <img src="<%= request.getContextPath() %>/images/hamburger.png" alt="메뉴" class="hamburger" id="hamburger" style="width:30px; height:30px;">
        <!-- 네비게이션 링크 -->
        <nav class="navigation flex space-x-4 justify-end">
            <a href="#">Home</a>
            <a href="#">운동정보</a>
            <a href="#">게시판</a>
            <a href="#">쇼핑몰</a>
            <a href="#" style="border-radius: 0; background-color: #871e9b;">로그인</a>
        </nav>
    </div>
    <!-- 드롭다운 메뉴 -->
</header>

<script>
    const hamburger = document.getElementById('hamburger');
    const dropdownMenu = document.getElementById('dropdown-menu');

    hamburger.addEventListener('click', () => {
        dropdownMenu.classList.toggle('flex');
        dropdownMenu.classList.toggle('hidden');
    });
</script>