package database;

import java.sql.*;

public class Database {
    Connection connection = null;

    public Database() throws SQLException, ClassNotFoundException {
        link();
    }

    /**
     * 连接数据库
     */
    protected void link() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");// 注册驱动
        this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?serverTimezone=GMT%2B8", "root", "123456");// sql数据库链接
    }
    /**
     * 关闭数据库链接
     */
    public void close() throws SQLException {
        connection.close();
    }
}
