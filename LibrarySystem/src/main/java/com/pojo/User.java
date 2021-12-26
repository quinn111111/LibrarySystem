package com.pojo;

import java.util.List;

public class User {

    private int UserId;
    private String UserName;
    private String Password;
    private int BreachNum;
    private String Permission;
    private LibUser libUser;
    private List<Reserve> reserveList;


    @Override
    public String toString() {
        return "User{" +
                "UserId=" + UserId +
                ", UserName='" + UserName + '\'' +
                ", Password='" + Password + '\'' +
                ", BreachNum=" + BreachNum +
                ", Permission='" + Permission + '\'' +
                ", libUser=" + libUser +
                ", reserveList=" + reserveList +
                '}';
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public int getBreachNum() {
        return BreachNum;
    }

    public void setBreachNum(int breachNum) {
        BreachNum = breachNum;
    }

    public String getPermission() {
        return Permission;
    }

    public void setPermission(String permission) {
        Permission = permission;
    }

    public LibUser getLibUser() {
        return libUser;
    }

    public void setLibUser(LibUser libUser) {
        this.libUser = libUser;
    }

    public List<Reserve> getReserveList() {
        return reserveList;
    }

    public void setReserveList(List<Reserve> reserveList) {
        this.reserveList = reserveList;
    }
}
