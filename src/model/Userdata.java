package model;

public class UserData {
    private Integer id;
    private String username;
    private String password;

    public UserData(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }


    @Override
    public String toString() {
        return id+" "+username+" "+password;
    }
}
