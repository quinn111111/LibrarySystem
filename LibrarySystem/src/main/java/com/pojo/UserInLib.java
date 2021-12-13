package com.pojo;

public class UserInLib {
    private int UserId;
    private String TimeInLib;

    @Override
    public String toString() {
        return "UserInLibMapper{" +
                "UserId=" + UserId +
                ", TimeInLib='" + TimeInLib + '\'' +
                '}';
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String getTimeInLib() {
        return TimeInLib;
    }

    public void setTimeInLib(String timeInLib) {
        TimeInLib = timeInLib;
    }
}
