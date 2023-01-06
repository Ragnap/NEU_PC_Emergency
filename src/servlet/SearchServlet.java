package servlet;

import database.ProblemDB;
import database.UserDB;
import model.ProblemData;
import model.UserData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");

        String keyword = req.getParameter("keyword");

        try {
            ProblemDB problemDB = new ProblemDB();
            ArrayList<ProblemData> problems = problemDB.searchProblem(keyword);
            req.getSession().setAttribute("problems", problems);
            req.getSession().setAttribute("keyword", keyword);
            resp.sendRedirect("result.jsp");
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
