package com.service;

import com.dao.SeatMapper;
import com.pojo.Seat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeatServiceImpl implements SeatService{


    @Autowired
    private SeatMapper seatMapper;
    @Override
    public int addSeat(Seat seat) {
        return seatMapper.addSeat(seat);
    }

    @Override
    public int deleteSeatBySeatId(String SeatId) {
        return seatMapper.deleteSeatBySeatId(SeatId);
    }

    @Override
    public int updateSeat(Seat seat) {
        return seatMapper.updateSeat(seat);
    }

    @Override
    public List<Seat> queryAllSeat() {
        return seatMapper.queryAllSeat();
    }

    @Override
    public Seat querySeatBySeatId(String SeatId) {
        return seatMapper.querySeatBySeatId(SeatId);
    }
}
