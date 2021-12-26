package com.service;


import com.dao.LibUserMapper;
import com.pojo.LibUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LibUserServiceImpl implements LibUserService{

    @Autowired
    private LibUserMapper libUserMapper;
    @Override
    public int deleteLibUserByUserId(int UserId) {
        return libUserMapper.deleteLibUserByUserId(UserId);
    }

    @Override
    public List<LibUser> queryAllLibUser() {
        return libUserMapper.queryAllLibUser();
    }

    @Override
    public int addLibUser(LibUser libUser) {
        return libUserMapper.addLibUser(libUser);
    }

    @Override
    public int updateLibUser(LibUser libUser) {
        return libUserMapper.updateLibUser(libUser);
    }

    @Override
    public LibUser queryLibUserByUserId(int UserId) {
        return libUserMapper.queryLibUserByUserId(UserId);
    }
}
