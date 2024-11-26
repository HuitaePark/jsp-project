package com.heetae.jspproject.admin.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.heetae.jspproject.admin.model.DashboardDAO;
import com.heetae.jspproject.admin.model.DashboardDTO;

@WebServlet("/admin/dashboard")
public class DashboardController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DashboardDAO dao = new DashboardDAO();
        DashboardDTO data = dao.getDashboardData();

        // 요청 속성에 데이터 설정
        request.setAttribute("dashboardData", data);

        // JSP로 포워드
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/admin/dashboard.jsp");
        dispatcher.forward(request, response);
    }
}