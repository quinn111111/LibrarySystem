package com.pojo;


public class Seat {

    private String SeatId;
    private String SeatPosition;
    private String SeatStatus;
    private String Floor;

    @Override
    public String toString() {
        return "Seat{" +
                "SeatId='" + SeatId + '\'' +
                ", SeatPosition='" + SeatPosition + '\'' +
                ", SeatStatus='" + SeatStatus + '\'' +
                ", Floor='" + Floor + '\'' +
                '}';
    }

    public String getSeatId() {
        return SeatId;
    }

    public void setSeatId(String seatId) {
        SeatId = seatId;
    }

    public String getSeatPosition() {
        return SeatPosition;
    }

    public void setSeatPosition(String seatPosition) {
        SeatPosition = seatPosition;
    }

    public String getSeatStatus() {
        return SeatStatus;
    }

    public void setSeatStatus(String seatStatus) {
        SeatStatus = seatStatus;
    }

    public String getFloor() {
        return Floor;
    }

    public void setFloor(String floor) {
        Floor = floor;
    }
}
