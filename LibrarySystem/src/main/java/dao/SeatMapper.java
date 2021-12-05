package dao;

import Entity.Seat;

import java.util.List;

public interface SeatMapper {

    int addSeat(Seat seat);

    int deleteSeatById(String SeatId);

    int updateSeat(Seat seat);

    Seat querySeatById(String SeatId);

    List<Seat> queryAllSeat();

}
