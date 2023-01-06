package database;

import model.UserData;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDB extends Database{

    public UserDB() throws ClassNotFoundException, SQLException {
        link();
    }


    /**
     * 在user表内添加数据
     */
    public void addUser(String username, String password) throws SQLException {
        PreparedStatement prep = connection.prepareStatement("insert into web.user value(null,?,?)");
        prep.setString(1, username);
        prep.setString(2, password);
        prep.execute();
    }

    /**
     * 根据用户名查找用户
     */
    public UserData findUser(String username) throws SQLException {
        PreparedStatement prep = connection.prepareStatement("select * from web.user where username=?");
        prep.setString(1, username);
        prep.execute();
        ResultSet resultSet = prep.executeQuery();
        if (resultSet.next()) {
            int id = resultSet.getInt("id");
            String password = resultSet.getString("password");
            return new UserData(id, username, password);
        }
        else
            return null;
    }

    /**
     * 根据用户名用户看是否重复
     */
    public boolean existUser(String username) throws SQLException {
        PreparedStatement prep = connection.prepareStatement("select * from web.user where username=?");
        prep.setString(1, username);
        prep.execute();
        ResultSet resultSet = prep.executeQuery();
        return resultSet.next();
    }

    /**
     * 检查用户名与给定密码是否匹配，不存在该用户时返回null
     */
    public UserData login(String username, String password) throws SQLException {
        PreparedStatement prep = connection.prepareStatement("select * from web.user where username=?");
        prep.setString(1, username);
        prep.execute();
        ResultSet resultSet = prep.executeQuery();
        if(resultSet.next() && password.equals(resultSet.getString("password")))
            return new UserData(resultSet.getInt("id"), resultSet.getString("username"), resultSet.getString("password"));
        else
            return null;
    }
}
