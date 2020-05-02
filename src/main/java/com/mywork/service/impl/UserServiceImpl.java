package com.mywork.service.impl;

import com.mywork.mapper.UserMapper;
import com.mywork.pojo.User;
import com.mywork.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User userLogin(User user) {
        return userMapper.selUser(user);
    }

    @Override
    public boolean selUsername(String username) {
        User user = userMapper.selByUsername(username);
        if(user == null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean selBySno(String sno) {
        User u = userMapper.selBySno(sno);
        if(u != null) {
            //用户存在
            return true;
        } else {
            return false;
        }
    }

    @Override
    public int insUser(User user) {
        return userMapper.insUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User selUserById(int id) {
        return userMapper.selUserById(id);
    }

    @Override
    public int updatePassword(String password, int id) {
        return userMapper.updatePassword(password,id);
    }


}
