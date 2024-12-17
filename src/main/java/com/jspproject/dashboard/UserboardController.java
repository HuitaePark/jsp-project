package com.jspproject.dashboard;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/userboard")
public class UserboardController extends HttpServlet {
    private UserboardDAO userBoardDAO = new UserboardDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String time = request.getParameter("time");
            String status = request.getParameter("status");

            System.out.println("name: " + name);
            System.out.println("category: " + category);
            System.out.println("time: " + time);
            System.out.println("status: " + status);

            if (name == null || category == null || time == null || status == null) {
                System.out.println("요청 데이터가 누락되었습니다.");
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "요청 데이터 누락");
                return;
            }

            UserboardDTO board = new UserboardDTO();
            board.setName(name);
            board.setCategory(category);
            board.setTime(time);
            board.setStatus(status);

            userBoardDAO.insertBoard(board);
            System.out.println("데이터가 성공적으로 DB에 저장되었습니다.");
            response.sendRedirect(request.getContextPath() + "/user/mypage/userboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터 처리 중 오류 발생");
        }
    }
}
