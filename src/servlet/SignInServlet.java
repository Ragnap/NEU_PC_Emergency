package servlet;

import database.UserDB;
import model.UserData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


@WebServlet(name = "SignInServlet", urlPatterns = "/sign_in")
public class SignInServlet extends HttpServlet {
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
            UserData userdata = userDB.login(username, password);
            if (userdata == null) {
                //如果存在该用户则密码错误
                if(userDB.existUser(username))
                    req.getSession().setAttribute("user_message", "密码错误!");
                else
                    req.getSession().setAttribute("user_message", "不存在该用户名！");
                resp.sendRedirect("login.jsp");
//                out.println("<a href=\"javascript:history.back(-1)\">返回登录</a>");
            } else {
                req.getSession().setAttribute("current_user", userdata);
                resp.sendRedirect("index.jsp");
//                req.getRequestDispatcher("homepage.html").forward(req, resp);
            }
            userDB.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
