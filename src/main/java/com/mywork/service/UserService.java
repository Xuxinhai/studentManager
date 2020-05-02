package com.mywork.service;

import com.mywork.pojo.User;

public interface UserService {

    User userLogin(User user);

    boolean selUsername(String username);

    boolean selBySno(String sno);

    int insUser(User user);

    int updateUser(User user);

    User selUserById(int id);

    int updatePassword(String password,int id);
}
