package com.jspproject.sub;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/workouts")
public class WorkoutListController extends HttpServlet {
    private WorkoutListDAO dao;

    @Override
    public void init() {
        dao = new WorkoutListDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");
        String search = request.getParameter("search"); // 검색어 파라미터
        int targetArea = -1; // 기본값: 전체

        if (category != null) {
            switch (category.toLowerCase()) {
                case "arms":
                    targetArea = 1;
                    break;
                case "chest":
                    targetArea = 2;
                    break;
                case "legs":
                    targetArea = 3;
                    break;
                case "back":
                    targetArea = 4;
                    break;
                case "shoulders":
                    targetArea = 5;
                    break;
                default:
                    targetArea = -1; // 유효하지 않은 카테고리일 경우 전체
            }
        }

        List<WorkoutDTO> workouts;

        if (search != null && !search.trim().isEmpty()) {
            workouts = dao.getWorkouts(targetArea, search.trim());
        } else {
            workouts = dao.getWorkoutsByTargetArea(targetArea);
        }

        request.setAttribute("workouts", workouts);
        request.setAttribute("selectedCategory", category != null ? category : "arms"); // 활성화된 카테고리 유지
        request.setAttribute("search", search != null ? search : ""); // 검색어 유지

        RequestDispatcher dispatcher = request.getRequestDispatcher("/sub/workoutList.jsp");
        dispatcher.forward(request, response);
    }
}