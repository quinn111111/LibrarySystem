package com.pojo;

public class Reserve {

    private int ReserveId;
    private String ReserveDate;
    private String BeginTime;
    private String EndTime;
    private String VerifyCode;
    private String SeatId;
    private int UserId;
    private String ReserveStatus;
    private String ReserveFloor;
    private User user;
    private Seat seat;

    @Override
    public String toString() {
        return "Reserve{" +
                "ReserveId=" + ReserveId +
                ", ReserveDate='" + ReserveDate + '\'' +
                ", BeginTime='" + BeginTime + '\'' +
                ", EndTime='" + EndTime + '\'' +
                ", VerifyCode='" + VerifyCode + '\'' +
                ", SeatId='" + SeatId + '\'' +
                ", UserId=" + UserId +
                ", ReserveStatus='" + ReserveStatus + '\'' +
                ", ReserveFloor='" + ReserveFloor + '\'' +
                ", user=" + user +
                ", seat=" + seat +
                '}';
    }

    public String getReserveFloor() {
        return ReserveFloor;
    }

    public void setReserveFloor(String reserveFloor) {
        ReserveFloor = reserveFloor;
    }

    public int getReserveId() {
        return ReserveId;
    }

    public void setReserveId(int reserveId) {
        ReserveId = reserveId;
    }

    public String getReserveDate() {
        return ReserveDate;
    }

    public void setReserveDate(String reserveDate) {
        ReserveDate = reserveDate;
    }

    public String getBeginTime() {
        return BeginTime;
    }

    public void setBeginTime(String beginTime) {
        BeginTime = beginTime;
    }

    public String getEndTime() {
        return EndTime;
    }

    public void setEndTime(String endTime) {
        EndTime = endTime;
    }

    public String getVerifyCode() {
        return VerifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        VerifyCode = verifyCode;
    }

    public String getSeatId() {
        return SeatId;
    }

    public void setSeatId(String seatId) {
        SeatId = seatId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String getReserveStatus() {
        return ReserveStatus;
    }

    public void setReserveStatus(String reserveStatus) {
        ReserveStatus = reserveStatus;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }
}
