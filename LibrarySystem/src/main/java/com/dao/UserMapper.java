package com.dao;

import com.pojo.User;

import java.util.List;

public interface UserMapper {

    int addUser(User user);

    int deleteUserByUserId(int UserId);

    int updateUser(User user);

    User queryUserByUserId(int UserId);

    List<User> queryAllUser();

}
