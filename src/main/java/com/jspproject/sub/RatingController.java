package com.jspproject.sub;

import com.jspproject.login.loginDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddReviewServlet")
public class RatingController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        loginDTO user = (loginDTO) session.getAttribute("loginInfo");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/user/auth/loginpage/login.jsp");
            return;
        }

        // 여기서 member_id(int)를 가져와야 함. loginDTO에 없으면 DB 조회 필요
        Integer memberIdInt = (Integer) session.getAttribute("memberId");
        if (memberIdInt == null) {
            // memberId를 DB에서 username으로 조회하는 로직 필요
            // 예:
            // memberIdInt = new MemberDAO().getMemberIdByUsername(user.getUsername());
            // session.setAttribute("memberId", memberIdInt);
            // 여기서는 가상의 값:
            memberIdInt = 1; // 실제 로직 필요
        }

        String comment = request.getParameter("comment");
        String workoutIdStr = request.getParameter("workout_id");
        int workoutId = Integer.parseInt(workoutIdStr);

        // 각 항목 점수 받기
        double pumping = Double.parseDouble(request.getParameter("pumping"));
        double difficulty = Double.parseDouble(request.getParameter("difficulty"));
        double rarity = Double.parseDouble(request.getParameter("rarity"));
        double safety = Double.parseDouble(request.getParameter("safety"));
        double weight = Double.parseDouble(request.getParameter("weight"));

        // exercise_name 조회
        WorkoutDAO workoutDAO = new WorkoutDAO();
        String exerciseName = null;
        try {
            WorkoutDTO workout = workoutDAO.getWorkoutById(workoutId);
            if (workout != null) {
                exerciseName = workout.getWorkoutName();
            } else {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }

        // Review Insert
        // rating은 5개 항목의 평균점수나 하나를 대표로 쓸 수 있음(기존 rating 컬럼 사용여부에 따라)
        // 여기서는 pumping을 대표점수로 사용한다던지, 또는 평균점수를 rating으로 넣을 수도 있음.
        double averageRating = (pumping + difficulty + rarity + safety + weight) / 5.0;
        int rating = (int) Math.round(averageRating);

        ReviewDTO review = new ReviewDTO();
        review.setMemberId(user.getUsername()); // review 테이블의 member_id는 varchar임
        review.setComment(comment);
        // review 테이블에 exercise_name, workout_id, rating 넣는 로직 추가 필요
        // ReviewDTO 정의 다시 필요할 수 있음. 여기서는 exercise_name 필드가 없으므로 필요하다면 추가
        // 또는 review 테이블 구조 변경 필요
        // 가정: review 테이블에 exercise_name, workout_id, rating 컬럼이 있다고 가정
         review.setExerciseName(exerciseName); // 만약 ReviewDTO에 있다면
         review.setWorkoutId(workoutId); // 있다면
         review.setRating(rating); // 있다면

        ReviewDAO reviewDAO = new ReviewDAO();
        try {
            // reviewDAO에 insertReview 메서드 작성 필요
            reviewDAO.insertReview(review);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }

        // Workout Score Insert
        RatingDTO dto = new RatingDTO();
        dto.setWorkoutId(workoutId);
        dto.setMemberId(memberIdInt);
        dto.setPumping(pumping);
        dto.setDifficulty(difficulty);
        dto.setRarity(rarity);
        dto.setSafety(safety);
        dto.setWeight(weight);

        RatingDAO dao = new RatingDAO();
        try {
            dao.insertWorkoutScore(dto);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }

        // 완료 후 리다이렉트
        response.sendRedirect(request.getContextPath() + "/sub/workoutDetail.jsp?workoutId=" + workoutId);
    }
}