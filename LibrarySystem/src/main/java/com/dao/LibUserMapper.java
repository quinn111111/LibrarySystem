package com.dao;

import com.pojo.LibUser;

import java.util.List;

public interface LibUserMapper {

    int deleteLibUserByUserId(int UserId);

    List<LibUser> queryAllLibUser();

    int addLibUser(LibUser libUser);

    int updateLibUser(LibUser libUser);

    LibUser queryLibUserByUserId(int UserId);

}
