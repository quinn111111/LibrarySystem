package service;

import Entity.Seat;
import dao.SeatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


public class SeatServiceImpl implements SeatService{

    @Autowired
    private SeatMapper seatMapper;

    public SeatMapper getSeatMapper() {
        return seatMapper;
    }

    public void setSeatMapper(SeatMapper seatMapper) {
        this.seatMapper = seatMapper;
    }

    @Override
    public int addSeat(Seat seat) {
        return seatMapper.addSeat(seat);
    }

    @Override
    public int deleteSeatById(String SeatId) {
        return seatMapper.deleteSeatById(SeatId);
    }

    @Override
    public int updateSeat(Seat seat) {
        return seatMapper.updateSeat(seat);
    }

    @Override
    public Seat querySeatById(String SeatId) {
        return seatMapper.querySeatById(SeatId);
    }

    @Override
    public List<Seat> queryAllSeat() {
        return seatMapper.queryAllSeat();
    }
}
