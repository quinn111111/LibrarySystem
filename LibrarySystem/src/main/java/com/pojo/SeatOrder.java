package com.pojo;

public class SeatOrder {

    private int OrderId;
    private String VerifyCode;
    private String Floor;
    private String EndTime;
    private String OrderDate;
    private String BeginTime;
    private String SeatId;
    private int UserId;

    @Override
    public String toString() {
        return "SeatOrder{" +
                "OrderId=" + OrderId +
                ", VerifyCode='" + VerifyCode + '\'' +
                ", Floor='" + Floor + '\'' +
                ", Endtime='" + EndTime + '\'' +
                ", OrderDate='" + OrderDate + '\'' +
                ", BeginTime='" + BeginTime + '\'' +
                ", SeatId='" + SeatId + '\'' +
                ", UserId=" + UserId +
                '}';
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int orderId) {
        OrderId = orderId;
    }

    public String getVerifyCode() {
        return VerifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        VerifyCode = verifyCode;
    }

    public String getFloor() {
        return Floor;
    }

    public void setFloor(String floor) {
        Floor = floor;
    }

    public String getEndTime() {
        return EndTime;
    }

    public void setEndTime(String endTime) {
        EndTime = endTime;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String orderDate) {
        OrderDate = orderDate;
    }

    public String getBeginTime() {
        return BeginTime;
    }

    public void setBeginTime(String beginTime) {
        BeginTime = beginTime;
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
}
