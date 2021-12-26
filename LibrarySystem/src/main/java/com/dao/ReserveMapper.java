package com.dao;

import com.pojo.Reserve;

import java.util.List;

public interface ReserveMapper {


    List<Reserve> findAll();

    List<Reserve> findReserveByUserId(int UserId);

    int deleteReserveByUserId(int UserId);


    Reserve findReserveByReserveId(int ReserveId);

    int addReserve(Reserve reserve);

    int updateReserve(Reserve reserve);


    int deleteReserveByReserveId(int ReserveId);

    List<Reserve> findReserveByConditions(Reserve reserve);

    int findOutDateNum(Reserve reserve);

    int deleteOutDate(Reserve reserve);
}
