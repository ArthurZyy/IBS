package com.five.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.five.dao.UserMapper;
import com.five.pojo.User;
import com.five.service.IUserService;


@Service("userService")
public class UserService implements IUserService {

    @Resource
    private UserMapper userDao;

    public User getUserById(int userId) {
        return this.userDao.selectByPrimaryKey(userId);
    }

}