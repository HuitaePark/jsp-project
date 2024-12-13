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
        int targetArea = 1; // Default category (Arms)

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
                    targetArea = 1;
            }
        }

        List<WorkoutDTO> workouts = dao.getWorkoutsByTargetArea(targetArea);
        request.setAttribute("workouts", workouts);
        request.setAttribute("selectedCategory", category != null ? category : "arms"); // To highlight active button

        RequestDispatcher dispatcher = request.getRequestDispatcher("/sub/workoutList.jsp");
        dispatcher.forward(request, response);
    }
}
