package com.heetae.jspproject.join;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.heetae.jspproject.join.joinDAO;
import com.heetae.jspproject.join.joinDTO;
import jakarta.servlet.http.HttpSession;

@WebServlet("/joinpage")

public class JoinController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void init() throws ServletException {
        System.out.println("JoinController initialized");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");	
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");

     
        joinDTO user = new joinDTO();
        user.setId(id);
        user.setPassword(password);
        user.setName(name);
        user.setTel(tel);
        user.setEmail(email);

       
        joinDAO userDAO = new joinDAO();
        int result = userDAO.registerUser(user);


        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/user/auth/joinpage/joinSuccess.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/user/auth/joinpage/joinSuccess.jsp");
        }
    }
}
