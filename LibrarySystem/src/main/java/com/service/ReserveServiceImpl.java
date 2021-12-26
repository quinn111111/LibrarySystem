package com.service;

import com.dao.ReserveMapper;
import com.pojo.Reserve;
import com.pojo.Seat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReserveServiceImpl implements ReserveService{

    @Autowired
    private ReserveMapper reserveMapper;

    public ReserveMapper getReserveMapper() {
        return reserveMapper;
    }

    public void setReserveMapper(ReserveMapper reserveMapper) {
        this.reserveMapper = reserveMapper;
    }

    @Override
    public List<Reserve> findAll() {
        return reserveMapper.findAll();
    }

    @Override
    public List<Reserve> findReserveByUserId(int UserId) {
        return reserveMapper.findReserveByUserId(UserId);
    }

    @Override
    public int deleteReserveByUserId(int UserId) {
        return reserveMapper.deleteReserveByUserId(UserId);
    }

    @Override
    public Reserve findReserveByReserveId(int ReserveId) {
        return reserveMapper.findReserveByReserveId(ReserveId);
    }

    @Override
    public int addReserve(Reserve reserve) {
        return reserveMapper.addReserve(reserve);
    }

    @Override
    public int updateReserve(Reserve reserve) {
        return reserveMapper.updateReserve(reserve);
    }

    @Override
    public int deleteReserveByReserveId(int ReserveId) {
        return reserveMapper.deleteReserveByReserveId(ReserveId);
    }

    @Override
    public List<Reserve> findReserveByConditions(Reserve reserve) {
        return reserveMapper.findReserveByConditions(reserve);
    }

    @Override
    public int findOutDateNum(Reserve reserve) {
        return reserveMapper.findOutDateNum(reserve);
    }

    @Override
    public int deleteOutDate(Reserve reserve) {
        return reserveMapper.deleteOutDate(reserve);
    }
}
