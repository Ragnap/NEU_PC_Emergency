import database.ProblemDB;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;

public class test {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ProblemDB problemDB = new ProblemDB();
//        System.out.println(problemDB.searchProblem("蓝屏").get(0).getTime());
        System.out.println(problemDB.getProblem(1).getSolution());
    }
}