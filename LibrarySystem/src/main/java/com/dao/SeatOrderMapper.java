package com.dao;


import com.pojo.Seat;
import com.pojo.SeatOrder;

import java.util.List;

public interface SeatOrderMapper {

    int addSeatOrder(SeatOrder seatOrder);

    int deleteSeatOrderByUserId(int UserId);

    int deleteSeatOrderBySeatId(String SeatId);

    int deleteSeatOrderByOrderId(int OrderId);

    int updateSeatOrder(SeatOrder seatOrder);

    List<SeatOrder> querySeatOrderByUserId(int UserId);

    SeatOrder querySeatOrderBySeatId(String SeatId);

    List<SeatOrder> queryAllSeatOrder();

    List<SeatOrder> querySeatOrderByConditions(SeatOrder seatOrder);

}
