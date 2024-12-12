package com.jspproject.bodyinfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/saveBodyInfo")
public class BodyInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberid = request.getParameter("memberid");
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String bmi = request.getParameter("bmi");

        BodyInfoDTO bodyInfo = new BodyInfoDTO();
        bodyInfo.setMemberid(memberid);
        bodyInfo.setHeight(height);
        bodyInfo.setWeight(weight);
        bodyInfo.setGender(gender);
        bodyInfo.setAge(age);
        bodyInfo.setBMI(bmi);

        BodyInfoDAO dao = new BodyInfoDAO();

        try {
            dao.saveBodyInfo(bodyInfo);
            request.setAttribute("message", "신체 정보가 저장되었습니다.");
        } catch (Exception e) {
            request.setAttribute("message", "신체 정보 저장 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        request.getRequestDispatcher("/user/mypage/SaveBodyInfo.jsp").forward(request, response);
    }
}