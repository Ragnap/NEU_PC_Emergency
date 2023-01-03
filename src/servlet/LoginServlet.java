package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "LoginServlet",urlPatterns = "/sign_in")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("content-type","text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");

        String username = "1账号为"+req.getParameter("username");
        String password = "2密码为"+req.getParameter("password");
        PrintWriter out = resp.getWriter();
        out.println(username);
        out.println(password);
        out.println(req.getCharacterEncoding());
    }

}
