package com.pojo;

public class User {
    private int UserId;
    private String UserName;
    private String Password;
    private String Permission;
    private String Balance;
    private String BreachNum;

    @Override
    public String toString() {
        return "User{" +
                "UserId=" + UserId +
                ", UserName='" + UserName + '\'' +
                ", Password='" + Password + '\'' +
                ", Permission='" + Permission + '\'' +
                ", Balance='" + Balance + '\'' +
                ", BreachNum='" + BreachNum + '\'' +
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

    public String getPermission() {
        return Permission;
    }

    public void setPermission(String permission) {
        Permission = permission;
    }

    public String getBalance() {
        return Balance;
    }

    public void setBalance(String balance) {
        Balance = balance;
    }

    public String getBreachNum() {
        return BreachNum;
    }

    public void setBreachNum(String breachNum) {
        BreachNum = breachNum;
    }
}
