package com.dao;

import com.pojo.Seat;

import java.util.List;

public interface SeatMapper {

    int addSeat(Seat seat);

    int deleteSeatBySeatId(String SeatId);

    int updateSeat(Seat seat);

    Seat querySeatBySeatId(String SeatId);

    List<Seat> queryAllSeat();

}
