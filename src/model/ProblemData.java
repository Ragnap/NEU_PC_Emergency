package model;

import java.sql.Date;

public class ProblemData {
    private Integer id;
    private String username;
    private Date time;
    private String describe;
    private String model;
    private String system;
    private String solution;

    public ProblemData(Integer id, String username, Date time, String describe, String model, String system, String solution) {
        this.id = id;
        this.username = username;
        this.time = time;
        this.describe = describe;
        this.model = model;
        this.system = system;
        this.solution = solution;
    }

    public Integer getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public Date getTime() {
        return time;
    }

    public String getDescribe() {
        return describe;
    }

    public String getModel() {
        return model;
    }

    public String getSystem() {
        return system;
    }

    public String getSolution() {
        return solution;
    }
}
