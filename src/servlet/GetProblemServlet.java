package servlet;

import database.ProblemDB;
import model.ProblemData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "GetProblemServlet", urlPatterns = "/getProblem")
public class GetProblemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");

        int problemID = Integer.parseInt(req.getParameter("problem"));


        try {
            ProblemDB problemDB = new ProblemDB();
            ProblemData problem = problemDB.getProblem(problemID);
            req.getSession().setAttribute("problem",problem);
            resp.sendRedirect("detail.jsp");
            problemDB.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
