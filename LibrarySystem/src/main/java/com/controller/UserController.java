package com.controller;

import com.pojo.User;
import com.service.SeatOrderService;
import com.service.UserInLibService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("userServiceImpl")
    public UserService userService;

    @Autowired
    @Qualifier("seatOrderServiceImpl")
    public SeatOrderService seatOrderService;

    @Autowired
    @Qualifier("userInLibServiceImpl")
    public UserInLibService userInLibService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("ManageUser")
    public String ManageUser(Model model){
        List<User> userList = userService.queryAllUser();
        model.addAttribute("userList",userList);
        return "ManageUser";
    }

    @RequestMapping("UpdateUserPage")
    public String UpdateUserPage(Model model,int UserId){
        User user = userService.queryUserByUserId(UserId);
        model.addAttribute("flag","update");
        model.addAttribute("user",user);
        return "UpdateUser";
    }

    @RequestMapping("UpdateUser")
    public String UpdateUser(Model model,User user){
        int flag = userService.updateUser(user);
        return "redirect:ManageUser";
    }


    @RequestMapping("DeleteUser")
    public String DeleteUser(Model model,int UserId){
        int flag = seatOrderService.deleteSeatOrderByUserId(UserId);
        flag = userService.deleteUserByUserId(UserId);
        flag = userInLibService.deleteUserInLibByUserId(UserId);
        return "redirect:ManageUser";
    }

    @RequestMapping("AddUserPage")
    public String UpdateUser(Model model){
        model.addAttribute("flag","add");
        return "UpdateUser";
    }

    @RequestMapping("AddUser")
    public String DeleteUser(Model model,User user){
        int flag = userService.addUser(user);
        return "redirect:ManageUser";
    }

}
