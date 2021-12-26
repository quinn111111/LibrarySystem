package com.pojo;

import java.util.List;

public class Seat {

    private String SeatId;
    private String SeatPosition;
    private String SeatFloor;
    private String SeatStatus;
    private List<Reserve> reserves;

    @Override
    public String toString() {
        return "Seat{" +
                "SeatId='" + SeatId + '\'' +
                ", SeatPosition='" + SeatPosition + '\'' +
                ", SeatFloor='" + SeatFloor + '\'' +
                ", SeatStatus='" + SeatStatus + '\'' +
                ", reserves=" + reserves +
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

    public String getSeatFloor() {
        return SeatFloor;
    }

    public void setSeatFloor(String seatFloor) {
        SeatFloor = seatFloor;
    }

    public String getSeatStatus() {
        return SeatStatus;
    }

    public void setSeatStatus(String seatStatus) {
        SeatStatus = seatStatus;
    }

    public List<Reserve> getReserves() {
        return reserves;
    }

    public void setReserves(List<Reserve> reserves) {
        this.reserves = reserves;
    }
}


