package com.heetae.jspproject.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginpage")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        loginDAO userDAO = new loginDAO();
        boolean isValidUser = userDAO.validateUser(id, password);

        if (isValidUser) {
            response.sendRedirect(request.getContextPath()+"/user/auth/loginpage/loginSuccess.jsp");
        } else {
            response.sendRedirect(request.getContextPath()+"/user/auth/loginpage/loginFailure.jsp");
        }
    }
}
