package com.pojo;

public class LibUser {

    private int UserId;
    private String EntryTime;
    private User user;

    @Override
    public String toString() {
        return "LibUser{" +
                "UserId=" + UserId +
                ", EntryTime='" + EntryTime + '\'' +
                ", user=" + user +
                '}';
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String getEntryTime() {
        return EntryTime;
    }

    public void setEntryTime(String entryTime) {
        EntryTime = entryTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
