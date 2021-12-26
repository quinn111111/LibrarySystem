package com.controller;

import com.pojo.LibUser;
import com.pojo.User;
import com.service.LibUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/LibUser")
public class LibUserController {
    @Autowired
    @Qualifier("libUserServiceImpl")
    private LibUserService libUserService;

    @RequestMapping("/ManageLibUser")
    public String ManageLibUser(Model model){
        List<LibUser> libUserList = libUserService.queryAllLibUser();
        model.addAttribute("libUserList",libUserList);
        return "ManageLibUser";
    }

    @RequestMapping("AddLibUserPage")
    public String AddLibUserPage(Model model){
        model.addAttribute("flag","add");
        return "UpdateLibUser";
    }

    @RequestMapping("AddLibUser")
    public String AddUserInLib(Model model,LibUser libUser){
        LibUser libUser1 = libUserService.queryLibUserByUserId(libUser.getUserId());
        if(libUser1==null){
            int flag = libUserService.addLibUser(libUser);
        }
        return "redirect:ManageLibUser";
    }

    @RequestMapping("UpdateLibUserPage")
    public String UpdateUserInLibPage(Model model,int UserId){
        LibUser libUser = libUserService.queryLibUserByUserId(UserId);
        model.addAttribute("libUser",libUser);
        model.addAttribute("flag","update");
        return "UpdateLibUser";
    }

    @RequestMapping("UpdateLibUser")
    public String UpdateUserInLibPage(Model model,LibUser libUser){
        System.out.println(libUser);
        int flag = libUserService.updateLibUser(libUser);
        return "redirect:ManageLibUser";
    }

    @RequestMapping("DeleteLibUser")
    public String DeleteUserInLib(Model model,int UserId){
        int flag = libUserService.deleteLibUserByUserId(UserId);
        return "redirect:ManageLibUser";
    }


}
