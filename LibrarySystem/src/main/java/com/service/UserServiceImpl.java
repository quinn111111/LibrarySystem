package com.service;

import com.dao.UserMapper;
import com.pojo.Reserve;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    public UserMapper userMapper;

    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public User findUserByUserId(int UserId) {
        return userMapper.findUserByUserId(UserId);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int deleteUserByUserId(int UserId) {
        return userMapper.deleteUserByUserId(UserId);
    }

    @Override
    public int findBreachNum(int UserId) {
        return userMapper.findBreachNum(UserId);
    }

    @Override
    public int updateBreachNum(User user) {
        return userMapper.updateBreachNum(user);
    }

}
