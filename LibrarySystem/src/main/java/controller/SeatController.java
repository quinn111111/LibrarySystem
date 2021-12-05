package controller;

import Entity.Seat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.SeatService;

import java.util.List;

@Controller
@RequestMapping("/seat")
public class SeatController {
//调service层
    @Autowired
    @Qualifier("seatServiceImpl")
    private SeatService seatService;

//    查询
    @RequestMapping("/allSeat")
    public String list(Model model){
        List<Seat> seatList = seatService.queryAllSeat();
        model.addAttribute("list",seatList);
        System.out.println("11111");
        return "allSeat";
    }

}
