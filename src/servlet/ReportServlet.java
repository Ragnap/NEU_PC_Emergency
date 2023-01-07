package servlet;

import database.ProblemDB;
import model.ProblemData;
import model.UserData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ReportServlet", urlPatterns = "/report")
public class ReportServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");

        String describe = req.getParameter("describe");
        String solution = req.getParameter("solution");
        String model = req.getParameter("model");
        String system = req.getParameter("system");
        String username = ((UserData) req.getSession().getAttribute("current_user")).getUsername();
        try {
            ProblemDB problemDB = new ProblemDB();
            problemDB.addProblem(username,describe,model,system,solution);
            resp.sendRedirect("report.jsp");
            problemDB.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
