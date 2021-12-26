package com.controller;

import com.pojo.LibUser;
import com.pojo.User;
import com.service.LibUserService;
import com.service.ReserveService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/User")
public class UserController {
    @Autowired
    @Qualifier("userServiceImpl")
    public UserService userService;

    @Autowired
    @Qualifier("reserveServiceImpl")
    public ReserveService reserveService;

    @Autowired
    @Qualifier("libUserServiceImpl")
    public LibUserService libUserService;

    @RequestMapping("/ManageUser")
    public String ManageUser(Model model){
        List<User> userList = userService.findAllUser();
        model.addAttribute("userList",userList);
        return "ManageUser";
    }

    @RequestMapping("/AddUserPage")
    public String AddUserPage(Model model){
        model.addAttribute("flag","add");
        return "UpdateUser";
    }

    @RequestMapping("AddUser")
    public String AddUser(Model model,User user){
        int flag = userService.addUser(user);
        return "redirect:ManageUser";
    }


    @RequestMapping("UpdateUserPage")
    public String UpdateUserPage(Model model,int UserId){
        User user = userService.findUserByUserId(UserId);
        model.addAttribute("user",user);
        model.addAttribute("flag","update");
        return "UpdateUser";
    }

    @RequestMapping("UpdateUser")
    public String UpdateUser(Model model,User user){
        int flag = userService.updateUser(user);
        return "redirect:ManageUser";
    }

    @RequestMapping("DeleteUser")
    public String DeleteUser(Model model,int UserId){
        int flag = libUserService.deleteLibUserByUserId(UserId);
        flag = reserveService.deleteReserveByUserId(UserId);
        flag = userService.deleteUserByUserId(UserId);
        return "redirect:ManageUser";
    }
}
