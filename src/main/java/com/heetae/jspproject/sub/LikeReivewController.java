package com.heetae.jspproject.sub;

import com.heetae.jspproject.util.DatabaseUtil;
import com.heetae.jspproject.login.loginDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeReivewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 로그인된 사용자 정보를 가져옵니다.
        HttpSession session = request.getSession();
        loginDTO user = (loginDTO) session.getAttribute("loginInfo");

        if (user == null) {
            // 로그인이 되어 있지 않은 경우 로그인 페이지로 리디렉션
            response.sendRedirect(request.getContextPath() + "/user/auth/loginpage/login.jsp");
            return;
        }

        String memberId = user.getUsername();
        int reviewId = Integer.parseInt(request.getParameter("review_id"));
        String action = request.getParameter("action"); // "like" 또는 "dislike"

        try (Connection conn = DatabaseUtil.getConnection();) {
            if ("like".equals(action)) {
                // 좋아요 처리
                handleLikeDislike(conn, reviewId, memberId, "like");
            } else if ("dislike".equals(action)) {
                // 싫어요 처리
                handleLikeDislike(conn, reviewId, memberId, "dislike");
            }

            // 처리 후 원래 페이지로 리디렉션
            response.sendRedirect(request.getHeader("Referer"));
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getHeader("Referer"));
        }

    }
    private void handleLikeDislike(Connection conn, int reviewId, String userId, String type) throws SQLException {
        String checkSql, insertSql, deleteSql, oppositeDeleteSql;
        if ("like".equals(type)) {
            checkSql = "SELECT * FROM likes WHERE review_id = ? AND user_id = ?";
            insertSql = "INSERT INTO likes (review_id, user_id) VALUES (?, ?)";
            deleteSql = "DELETE FROM likes WHERE review_id = ? AND user_id = ?";
            oppositeDeleteSql = "DELETE FROM dislikes WHERE review_id = ? AND user_id = ?";
        } else {
            checkSql = "SELECT * FROM dislikes WHERE review_id = ? AND user_id = ?";
            insertSql = "INSERT INTO dislikes (review_id, user_id) VALUES (?, ?)";
            deleteSql = "DELETE FROM dislikes WHERE review_id = ? AND user_id = ?";
            oppositeDeleteSql = "DELETE FROM likes WHERE review_id = ? AND user_id = ?";
        }

        // 반대 액션 삭제 (예: 좋아요를 누르면 싫어요 삭제)
        PreparedStatement oppositeDeleteStmt = conn.prepareStatement(oppositeDeleteSql);
        oppositeDeleteStmt.setInt(1, reviewId);
        oppositeDeleteStmt.setString(2, userId);
        oppositeDeleteStmt.executeUpdate();

        // 현재 액션 체크
        PreparedStatement checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setInt(1, reviewId);
        checkStmt.setString(2, userId);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
            // 이미 눌렀으므로 취소 (삭제)
            PreparedStatement deleteStmt = conn.prepareStatement(deleteSql);
            deleteStmt.setInt(1, reviewId);
            deleteStmt.setString(2, userId);
            deleteStmt.executeUpdate();
        } else {
            // 추가
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setInt(1, reviewId);
            insertStmt.setString(2, userId);
            insertStmt.executeUpdate();
        }
    }

}
