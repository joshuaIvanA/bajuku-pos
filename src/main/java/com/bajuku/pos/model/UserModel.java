package com.bajuku.pos.model;

import java.sql.Timestamp;

public class UserModel {
    private int id;
    private String username;
    private String password;
    private String fullname;
    private Timestamp log_time;
    private String user_role;

    public UserModel(){}

    public UserModel(int id, String username, String password, String fullname, Timestamp log_time, String user_role){
        this.id=id;
        this.username=username;
        this.password=password;
        this.fullname=fullname;
        this.log_time=log_time;
        this.user_role=user_role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Timestamp getLog_time() {
        return log_time;
    }

    public void setLog_time(Timestamp log_time) {
        this.log_time = log_time;
    }

    public String getUser_role() {
        return user_role;
    }

    public void setUser_role(String user_role) {
        this.user_role = user_role;
    }
}
