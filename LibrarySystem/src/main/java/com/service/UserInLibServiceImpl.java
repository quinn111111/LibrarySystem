package com.service;

import com.dao.UserInLibMapper;
import com.pojo.UserInLib;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserInLibServiceImpl implements UserInLibService{

    @Autowired
    private UserInLibMapper userInLibMapper;

    public UserInLibMapper getUserInLibMapper() {
        return userInLibMapper;
    }

    public void setUserInLibMapper(UserInLibMapper userInLibMapper) {
        this.userInLibMapper = userInLibMapper;
    }

    @Override
    public int addUserInLib(UserInLib userInLib) {
        return userInLibMapper.addUserInLib(userInLib);
    }

    @Override
    public int deleteUserInLibByUserId(int UserId) {
        return userInLibMapper.deleteUserInLibByUserId(UserId);
    }

    @Override
    public int updateUserInLib(UserInLib userInLib) {
        return userInLibMapper.updateUserInLib(userInLib);
    }

    @Override
    public UserInLib queryUserInLibByUserId(int UserId) {
        return userInLibMapper.queryUserInLibByUserId(UserId);
    }

    @Override
    public List<UserInLib> queryAllUserInLib() {
        return userInLibMapper.queryAllUserInLib();
    }
}
