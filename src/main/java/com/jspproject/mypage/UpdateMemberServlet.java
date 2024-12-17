package com.jspproject.mypage;

import java.io.IOException;

import com.jspproject.login.loginDTO; // loginDTO 클래스 임포트 필요

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateMember")
public class UpdateMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 세션에 저장된 로그인 정보(loginDTO 타입)를 가져옴
        loginDTO user = (loginDTO) session.getAttribute("loginInfo");

        // 로그인되지 않은 상태라면 로그인 페이지로 리다이렉트
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/user/auth/loginpage/login.jsp");
            return;
        }

        // loginDTO에서 memberid 추출 (loginDTO 안에 getMemberid() 메서드가 있어야 함)
        String memberid = user.getUsername ();

        // 클라이언트에서 데이터 가져오기
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String addr = request.getParameter("addr");
        String password = request.getParameter("password");
        String tierid = request.getParameter("tierid");
        String score = request.getParameter("score");

        // DTO 생성 및 값 설정
        MemberDTO member = new MemberDTO();
        member.setMemberid(memberid);
        member.setName(name);
        member.setEmail(email);
        member.setTel(tel);
        member.setAddr(addr);
        member.setPassword(password);
        member.setTierid(tierid);
        member.setScore(score);

        // DAO 호출
        MemberDAO dao = new MemberDAO();
        try {
            dao.updateMember(member);
            request.setAttribute("message", "회원 정보가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            request.setAttribute("message", "회원 정보 수정 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        // 정보 수정 후 updateMember.jsp로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/user/mypage/updateMember.jsp");
    }
}