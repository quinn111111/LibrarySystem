package Entity;

public class Seat {
    String SeatId;
    String SeatPosition;
    String SeatStatus;

    @Override
    public String toString() {
        return "Seat{" +
                "SeatId='" + SeatId + '\'' +
                ", SeatPosition='" + SeatPosition + '\'' +
                ", SeatStatus='" + SeatStatus + '\'' +
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
}
