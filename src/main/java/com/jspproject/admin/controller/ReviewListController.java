package com.jspproject.admin.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.jspproject.admin.model.ReviewDAO;
import com.jspproject.admin.model.ReviewDTO;

@WebServlet("/admin/reviews")
public class ReviewListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ReviewDAO dao = new ReviewDAO();
        List<ReviewDTO> reviewList = dao.getAllReviews();

        request.setAttribute("reviewList", reviewList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/admin/reviewList.jsp");
        dispatcher.forward(request, response);
    }
}