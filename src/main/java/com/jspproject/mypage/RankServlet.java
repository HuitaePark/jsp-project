package com.jspproject.mypage;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/rank")
public class RankServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 세션에서 로그인된 사용자 ID 가져오기
        HttpSession session = request.getSession();
        String memberid = (String) session.getAttribute("memberid");
        // 디버깅용 - 테스트를 위해 memberid 강제 설정
        if (memberid == null) {
            memberid = "user1";
            session.setAttribute("memberid", memberid);
        }

        // DAO 호출하여 랭킹 데이터 가져오기
        MemberDAO dao = new MemberDAO();
        List<MemberDTO> rankings = dao.getRankings(memberid);

        if (rankings == null) {
            System.out.println("RankServlet: rankings is null.");
        } else if (rankings.isEmpty()) {
            System.out.println("RankServlet: rankings is empty.");
        } else {
            System.out.println("RankServlet: Retrieved rankings - " + rankings);
        }

        // 요청 속성에 랭킹 데이터 설정
        request.setAttribute("rankings", rankings);

        // JSP로 포워딩
        request.getRequestDispatcher("/user/mypage/Rank.jsp").forward(request, response);
    }
}