package com.jspproject.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/loginpage")
public class loginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        loginDAO userDAO = new loginDAO();
        loginDTO user = userDAO.validateUser(id, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginInfo", user);
            response.sendRedirect(request.getContextPath() + "/main/index.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/user/auth/login.jsp");
        }
    }
}