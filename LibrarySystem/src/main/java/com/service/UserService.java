package com.service;

import com.pojo.User;

import java.util.List;

public interface UserService {

    int addUser(User user);

    int deleteUserByUserId(int UserId);

    int updateUser(User user);

    User queryUserByUserId(int UserId);

    List<User> queryAllUser();

}
