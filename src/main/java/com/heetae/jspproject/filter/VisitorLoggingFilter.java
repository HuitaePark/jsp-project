package com.heetae.jspproject.filter;

import com.heetae.jspproject.admin.util.DatabaseUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebFilter("/*")
public class VisitorLoggingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 초기화 작업이 필요한 경우 구현
    }

    @Override
    public void destroy() {
        // 리소스 해제가 필요한 경우 구현
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // 요청 처리 전 작업

        chain.doFilter(request, response);

        // 요청 처리 후 작업: 방문자 정보 기록
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String ipAddress = request.getRemoteAddr();
        String userAgent = httpRequest.getHeader("User-Agent");
        HttpSession session = httpRequest.getSession(false);
        Integer memberId = null;

        if (session != null) {
            // 로그인 시 세션에 "memberId"를 저장했다고 가정
            Object memberIdObj = session.getAttribute("memberId");
            if (memberIdObj != null) {
                memberId = (Integer) memberIdObj;
            }
        }

        // 방문자 정보 데이터베이스에 저장
        String sql = "INSERT INTO visitors (ip_address, user_agent, member_id) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, ipAddress);
            pstmt.setString(2, userAgent);
            if (memberId != null) {
                pstmt.setInt(3, memberId);
            } else {
                pstmt.setNull(3, java.sql.Types.INTEGER);
            }
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}