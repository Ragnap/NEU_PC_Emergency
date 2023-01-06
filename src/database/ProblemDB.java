package database;

import model.ProblemData;
import model.UserData;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ProblemDB extends Database{
    public ProblemDB() throws SQLException, ClassNotFoundException {
        link();
    }

    /**
     * 在problem表内添加数据
     */
    public void addProblem(String username, String describe, String model, String system,String solution) throws SQLException {
        PreparedStatement prep = connection.prepareStatement("insert into web.problem value(null,?,?,?,?,?,?)");
        prep.setString(1, username);
        prep.setDate(2, new java.sql.Date(new java.util.Date().getTime()));
        prep.setString(3,describe);
        prep.setString(4,model);
        prep.setString(5,system);
        prep.setString(6,solution);
        prep.execute();
    }

    public ArrayList<ProblemData> searchProblem(String keyword) throws SQLException {
        ArrayList<ProblemData> problems = new ArrayList<>();
        keyword = "%" + keyword + "%";
        PreparedStatement prep = connection.prepareStatement("select * from web.problem where problem.describe like ?");
        prep.setString(1, keyword);
        prep.execute();
        ResultSet resultSet = prep.executeQuery();
        while(resultSet.next()){
            int id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            Date time = resultSet.getDate("time");
            String describe = resultSet.getString("describe");
            String model = resultSet.getString("model");
            String system = resultSet.getString("system");
            String solution = resultSet.getString("solution");
            problems.add(new ProblemData(id,username,time,describe,model,system,solution));
        }
        return problems;
    }
}
