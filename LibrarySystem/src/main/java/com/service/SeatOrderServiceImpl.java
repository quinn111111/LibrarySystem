package com.service;

import com.dao.SeatOrderMapper;
import com.pojo.SeatOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeatOrderServiceImpl implements SeatOrderService{

    @Autowired
    private SeatOrderMapper seatOrderMapper;

    public SeatOrderMapper getSeatOrderMapper() {
        return seatOrderMapper;
    }

    public void setSeatOrderMapper(SeatOrderMapper seatOrderMapper) {
        this.seatOrderMapper = seatOrderMapper;
    }

    @Override
    public int addSeatOrder(SeatOrder seatOrder) {
        return seatOrderMapper.addSeatOrder(seatOrder);
    }

    @Override
    public int deleteSeatOrderByUserId(int UserId) {
        return seatOrderMapper.deleteSeatOrderByUserId(UserId);
    }

    @Override
    public int deleteSeatOrderBySeatId(String SeatId) {
        return seatOrderMapper.deleteSeatOrderBySeatId(SeatId);
    }

    @Override
    public int deleteSeatOrderByOrderId(int OrderId) {
        return seatOrderMapper.deleteSeatOrderByOrderId(OrderId);
    }

    @Override
    public int updateSeatOrder(SeatOrder seatOrder) {
        return seatOrderMapper.updateSeatOrder(seatOrder);
    }

    @Override
    public List<SeatOrder> querySeatOrderByUserId(int UserId) {
        return seatOrderMapper.querySeatOrderByUserId(UserId);
    }

    @Override
    public SeatOrder querySeatOrderBySeatId(String SeatId) {
        return seatOrderMapper.querySeatOrderBySeatId(SeatId);
    }

    @Override
    public List<SeatOrder> queryAllSeatOrder() {
        return seatOrderMapper.queryAllSeatOrder();
    }

    @Override
    public List<SeatOrder> querySeatOrderByConditions(SeatOrder seatOrder) {
        return seatOrderMapper.querySeatOrderByConditions(seatOrder);
    }



}
