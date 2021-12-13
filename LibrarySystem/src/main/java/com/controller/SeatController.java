package com.controller;


import com.pojo.Seat;
import com.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/seat")
public class SeatController {


    @Autowired
    @Qualifier("seatServiceImpl")
    private SeatService seatService;

    @RequestMapping("/ManageSeat")
    public String ManageSeat(Model model){
        List<Seat> seatList = seatService.queryAllSeat();
        model.addAttribute("seatList",seatList);
        return "ManageSeat";
    }

    @RequestMapping("UpdateSeatPage")
    public String UpdateSeatPage(Model model,String SeatId){
        Seat seat = seatService.querySeatBySeatId(SeatId);
        model.addAttribute("seat",seat);
        return "UpdateSeat";
    }

    @RequestMapping("UpdateSeat")
    public String UpdateSeat(Model model,Seat seat){
        int flag = seatService.updateSeat(seat);
        return "redirect:ManageSeat";
    }



}
