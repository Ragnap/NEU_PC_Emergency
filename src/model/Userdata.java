package model;

public class Userdata {
    private Integer id;
    private String username;
    private String password;

    public Userdata(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public Userdata(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return id+" "+username+" "+password;
    }
}