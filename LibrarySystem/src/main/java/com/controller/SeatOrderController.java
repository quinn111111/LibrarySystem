package com.controller;


import com.pojo.Seat;
import com.pojo.SeatOrder;
import com.service.SeatOrderService;
import com.service.SeatService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class SeatOrderController {

    @Autowired
    @Qualifier("seatOrderServiceImpl")
    private SeatOrderService seatOrderService;

    @Autowired
    @Qualifier("seatServiceImpl")
    private SeatService seatService;

    @RequestMapping("/FirstPage")
    public String FirstPage(Model model){
        List<SeatOrder> seatOrderList= seatOrderService.querySeatOrderByUserId(1);
        if(!seatOrderList.isEmpty()){
            SeatOrder seatOrder = seatOrderList.get(0);
            Seat seat = seatService.querySeatBySeatId(seatOrder.getSeatId());
            model.addAttribute("seatOrder",seatOrder);
            model.addAttribute("seat",seat);
        }
        return "FirstPage";
    }

    @RequestMapping("/SeatShow")
    public String SeatShow(Model model,SeatOrder seatOrder){
        Map<String, String> SeatIdMap = new HashMap<>();

        List<SeatOrder> seatOrderList = seatOrderService.querySeatOrderByConditions(seatOrder);
        if(seatOrderList.size()!=0){
            for(SeatOrder order:seatOrderList){
                String SeatId = order.getSeatId();
                String SeatId1 = SeatId.substring(1,5);
                SeatIdMap.put(SeatId1,"disabled");
            }
        }
        model.addAttribute("SeatIdMap",SeatIdMap);
        model.addAttribute("seatOrder",seatOrder);
        return "SeatShow";
    }

    @RequestMapping("/OrderConfirm")
    public String OrderConfirm(Model model,SeatOrder seatOrder){
        model.addAttribute("seatOrder",seatOrder);
        return "OrderConfirm";
    }

    @RequestMapping("SeatOrder")
    public String SeatOrder(Model model,SeatOrder seatOrder){
        seatOrder.setSeatId(seatOrder.getFloor()+seatOrder.getSeatId());
        seatOrder.setUserId(1);
        seatOrder.setVerifyCode(Integer.toString((int)((Math.random()*9+1)*100000)));
        int flag = seatOrderService.addSeatOrder(seatOrder);
        return "redirect:/order/FirstPage";
    }

    @RequestMapping("Rules")
    public String Rules(Model model){
        return "Rules";
    }

    @RequestMapping("MyOrder")
    public String MyOrder(Model model){
        return "MyOrder";
    }

}
