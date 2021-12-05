package service;

import Entity.Seat;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SeatService {
    int addSeat(Seat seat);

    int deleteSeatById(String SeatId);

    int updateSeat(Seat seat);

    Seat querySeatById(String SeatId);

    List<Seat> queryAllSeat();
}
