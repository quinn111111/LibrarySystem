package com.dao;


import com.pojo.UserInLib;

import java.util.List;

public interface UserInLibMapper {
    int addUserInLib(UserInLib userInLib);

    int deleteUserInLibByUserId(int UserId);

    int updateUserInLib(UserInLib userInLib);

    UserInLib queryUserInLibByUserId(int UserId);

    List<UserInLib> queryAllUserInLib();
}
