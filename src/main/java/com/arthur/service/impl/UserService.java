package com.arthur.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.arthur.dao.UserMapper;
import com.arthur.pojo.User;
import com.arthur.service.IUserService;


@Service("userService")
public class UserService implements IUserService {

    @Resource
    private UserMapper userDao;

    public User getUserById(int userId) {
        return this.userDao.selectByPrimaryKey(userId);
    }

}