package com.heetae.jspproject.admin.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.heetae.jspproject.admin.model.MemberDAO;
import com.heetae.jspproject.admin.model.MemberDTO;

@WebServlet("/admin/members")
public class MemberListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MemberDAO dao = new MemberDAO();
        List<MemberDTO> memberList = dao.getAllMembers();

        request.setAttribute("memberList", memberList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/admin/memberList.jsp");
        dispatcher.forward(request, response);
    }
}