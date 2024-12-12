package com.jspproject.mypage;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateMember")
public class UpdateMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트에서 데이터 가져오기
        String memberid = request.getParameter("memberid");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String addr = request.getParameter("addr");
        String password = request.getParameter("password");

        // DTO 생성 및 값 설정
        MemberDTO member = new MemberDTO();
        member.setMemberid(memberid);
        member.setName(name);
        member.setEmail(email);
        member.setTel(tel);
        member.setAddr(addr);
        member.setPassword(password);

        // DAO 호출
        MemberDAO dao = new MemberDAO();
        try {
            dao.updateMember(member);
            request.setAttribute("message", "회원 정보가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            request.setAttribute("message", "회원 정보 수정 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        // JSP로 포워딩
        request.getRequestDispatcher("/user/mypage/updateMember.jsp").forward(request, response);
    }
}