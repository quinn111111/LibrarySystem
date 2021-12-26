package com.controller;

import com.pojo.Reserve;
import com.pojo.Seat;
import com.pojo.User;
import com.service.ReserveService;
import com.service.SeatService;
import com.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/Reserve")
public class ReserveController {

    @Autowired
    @Qualifier("reserveServiceImpl")
    private ReserveService reserveService;

    @Autowired
    @Qualifier("seatServiceImpl")
    private SeatService seatService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @RequestMapping("findAll")
    public String findAll(Model model){
        List<Reserve> reserve = reserveService.findAll();
        return null;
    }


    @RequestMapping("/FirstPage")
    public String FirstPage(Model model){
        List<Reserve> reserveList = reserveService.findReserveByUserId(1);
        if(reserveList.isEmpty()){
            model.addAttribute("flag","NoReserve");
        }
        else {
            model.addAttribute("reserve",reserveList.get(0));
            System.out.println(reserveList.get(0));
        }
        return "FirstPage";
    }

    @RequestMapping("/MyReserve")
    private String MyReserve(Model model){
        List<Reserve> reserveList = reserveService.findReserveByUserId(1);
        model.addAttribute("reserveList",reserveList);
        return "MyReserve";
    }

    @RequestMapping("/ManageReserve")
    private String ManageReserve(Model model){
        List<Reserve> reserveList = reserveService.findAll();
        model.addAttribute("reserveList",reserveList);
        return "ManageReserve";
    }


    @RequestMapping("/AddReservePage")
    public String AddReservePage(Model model){
        model.addAttribute("flag","add");
        return "UpdateReserve";
    }

    @RequestMapping("AddReserve")
    public String AddReserve(Model model,Reserve reserve){
        int flag = reserveService.addReserve(reserve);
        return "redirect:ManageReserve";
    }

    @RequestMapping("UpdateReserve")
    public String UpdateReserve(Model model,Reserve reserve){
        int flag = reserveService.updateReserve(reserve);
        return "redirect:ManageReserve";
    }

    @RequestMapping("UpdateReservePage")
    public String UpdateReserve(Model model,int ReserveId){
        Reserve reserve = reserveService.findReserveByReserveId(ReserveId);
        model.addAttribute("reserve",reserve);
        model.addAttribute("flag","update");
        return "UpdateReserve";
    }


    @RequestMapping("DeleteReserve")
    public String DeleteReserve(Model model,int ReserveId){
        int flag = reserveService.deleteReserveByReserveId(ReserveId);
        return "redirect:ManageReserve";
    }

    @Test
    public void test(){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date = format.format(new Date());
        SimpleDateFormat format1 = new SimpleDateFormat("HH:mm:ss");
        String endTime = format1.format(new Date());
        System.out.println(date);
        System.out.println(endTime);
    }
    @RequestMapping("SeatShow")
    public String SeatShow(Model model, Reserve reserve){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date = format.format(new Date());
        SimpleDateFormat format1 = new SimpleDateFormat("HH:mm:ss");
        String endTime = format1.format(new Date());

        Reserve reserve0 = new Reserve();
        reserve0.setReserveDate(date);
        reserve0.setEndTime(endTime);
        reserve0.setUserId(1);
        int outDateNum = reserveService.findOutDateNum(reserve0);
        System.out.println(outDateNum);

        int breachNum = userService.findBreachNum(1);
        System.out.println(breachNum);

        reserveService.deleteOutDate(reserve0);

        if((outDateNum+breachNum)>5){
            model.addAttribute("flag","BreachOutOfLimit");
            return "redirect:FirstPage";
        }

        User user = new User();
        user.setBreachNum(outDateNum+breachNum);
        user.setUserId(1);
        userService.updateUser(user);

        Map<String, String> SeatIdMap = new HashMap<>();
        List<Reserve> reserveList = reserveService.findReserveByConditions(reserve);
        if(reserveList.size()!=0){
            for(Reserve reserve1:reserveList){
                String SeatId = reserve1.getSeatId();
                String SeatId1 = SeatId.substring(1,5);
                SeatIdMap.put(SeatId1,"disabled");
            }
        }
        model.addAttribute("SeatIdMap",SeatIdMap);
        model.addAttribute("reserve",reserve);
        return "SeatShow";
    }

    @RequestMapping("/ReserveConfirm")
    public String OrderConfirm(Model model,Reserve reserve){
        model.addAttribute("reserve",reserve);
        return "ReserveConfirm";
    }

    @RequestMapping("/ReserveSeat")
    public String ReserveSeat(Model model,Reserve reserve){
        reserve.setVerifyCode((int)(Math.random() * 9 + 1) * 100000+"");
        reserve.setSeatId(reserve.getReserveFloor()+reserve.getSeatId());
        reserve.setReserveStatus("未入座");
        reserve.setUserId(1);
        int flag = reserveService.addReserve(reserve);
        return "redirect:FirstPage";
    }

    @RequestMapping("/CancelReserve")
    public String CancelReserve(Model model,int ReserveId){
        int flag = reserveService.deleteReserveByReserveId(ReserveId);
        return "redirect:MyReserve";
    }

    @RequestMapping("/CancelFirstReserve")
    public String CancelFirstReserve(Model model,int ReserveId){
        int flag = reserveService.deleteReserveByReserveId(ReserveId);
        return "redirect:FirstPage";
    }

}
