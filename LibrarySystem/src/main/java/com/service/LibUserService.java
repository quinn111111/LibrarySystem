package com.service;

import com.pojo.LibUser;

import java.util.List;

public interface LibUserService {
    int deleteLibUserByUserId(int UserId);

    List<LibUser> queryAllLibUser();

    int addLibUser(LibUser libUser);

    int updateLibUser(LibUser libUser);

    LibUser queryLibUserByUserId(int UserId);


}
