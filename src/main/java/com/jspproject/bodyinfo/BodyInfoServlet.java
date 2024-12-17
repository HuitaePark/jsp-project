package com.jspproject.bodyinfo;

import com.jspproject.login.loginDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/saveBodyInfo")
public class BodyInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 세션에서 로그인 정보 가져오기
        HttpSession session = request.getSession();
        loginDTO user = (loginDTO) session.getAttribute("loginInfo");

        // 로그인되지 않은 상태라면 로그인 페이지로 리다이렉트
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/user/auth/loginpage/login.jsp");
            return;
        }

        // loginDTO에서 memberid 추출
        String memberid = user.getUsername();

        // 클라이언트에서 데이터 가져오기
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String bmi = request.getParameter("bmi");

        // DTO 생성 및 값 설정
        BodyInfoDTO bodyInfo = new BodyInfoDTO();
        bodyInfo.setMemberid(memberid);
        bodyInfo.setHeight(height);
        bodyInfo.setWeight(weight);
        bodyInfo.setGender(gender);
        bodyInfo.setAge(age);
        bodyInfo.setBMI(bmi);

        // DAO 호출
        BodyInfoDAO dao = new BodyInfoDAO();

        try {
            dao.saveBodyInfo(bodyInfo);
            request.setAttribute("message", "신체 정보가 저장되었습니다.");
        } catch (Exception e) {
            request.setAttribute("message", "신체 정보 저장 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        // JSP로 포워딩 (경로 수정)
        request.getRequestDispatcher("/user/mypage/memberInfo.jsp").forward(request, response);
    }
}