package servlet;

import database.UserDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "SignUpServlet",urlPatterns = "/sign_up")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        PrintWriter out = resp.getWriter();

        try {
            UserDB userDB = new UserDB();

            if (userDB.existUser(username)) {
                req.getSession().setAttribute("user_message", "已存在相同的用户名！");
                req.getSession().setAttribute("user_action", "signUp");
                resp.sendRedirect("login.jsp");

            } else {
                userDB.addUser(username,password);
                req.getSession().setAttribute("user_message", "注册成功!");
                req.getSession().setAttribute("User", userDB.findUser(username));
                resp.sendRedirect("index.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }


    }

}
