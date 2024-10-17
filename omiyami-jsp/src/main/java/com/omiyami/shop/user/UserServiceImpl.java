package com.omiyami.shop.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.user.impl.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO getUserForLogin(String username, String password) {
		return userDAO.getUserForLogin(username, password);
	}

	@Override
	public boolean idCheck(String username) {
        UserVO user = userDAO.getUserById(username);
        return user != null;
	}

	
	
}
