package com.controller;

import com.pojo.UserInLib;
import com.service.UserInLibService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/userInLib")
public class UserInLibController {
    @Autowired
    @Qualifier("userInLibServiceImpl")
    private UserInLibService userInLibService;

    public UserInLibService getUserInLibService() {
        return userInLibService;
    }

    public void setUserInLibService(UserInLibService userInLibService) {
        this.userInLibService = userInLibService;
    }


    @RequestMapping("ManageUserInLib")
    public String ManageUserInLib(Model model){

        List<UserInLib> userInLibList = userInLibService.queryAllUserInLib();
        model.addAttribute("userInLibList",userInLibList);
        return "ManageUserInLib";
    }

    @RequestMapping("AddUserInLibPage")
    public String AddUserInLib(Model model){
        model.addAttribute("flag","add");
        return "UpdateUserInLib";
    }

    @RequestMapping("AddUserInLib")
    public String AddUserInLib(Model model,UserInLib userInLib){
        UserInLib userInLib1 = userInLibService.queryUserInLibByUserId(userInLib.getUserId());
        if(userInLib==null){
            int flag = userInLibService.addUserInLib(userInLib);
        }
        return "redirect:ManageUserInLib";
    }

    @RequestMapping("UpdateUserInLibPage")
    public String UpdateUserInLibPage(Model model,int UserId){
        UserInLib userInLib = userInLibService.queryUserInLibByUserId(UserId);
        model.addAttribute("userInLib",userInLib);
        model.addAttribute("flag","update");
        return "UpdateUserInLib";
    }

    @RequestMapping("UpdateUserInLib")
    public String UpdateUserInLibPage(Model model,UserInLib userInLib){
        int flag = userInLibService.updateUserInLib(userInLib);
        return "redirect:ManageUserInLib";
    }

    @RequestMapping("DeleteUserInLib")
    public String DeleteUserInLib(Model model,int UserId){
        int flag = userInLibService.deleteUserInLibByUserId(UserId);
        return "redirect:ManageUserInLib";
    }

}
