package com.dao;

import com.pojo.Reserve;
import com.pojo.User;

import java.util.List;

public interface UserMapper {

    List<User> findAllUser();

    int addUser(User user);

    User findUserByUserId(int UserId);

    int updateUser(User user);

    int deleteUserByUserId(int UserId);

    int findBreachNum(int UserId);

    int updateBreachNum(User user);

}
