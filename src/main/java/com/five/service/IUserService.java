package com.five.service;

import com.five.pojo.User;

public interface IUserService {
	
	public User getUserById(int userId);
	public User login(User user);

}