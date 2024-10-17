package com.omiyami.shop.user.impl;

import com.omiyami.shop.user.UserVO;

public interface UserDAO {

	UserVO getUserForLogin(String username, String password);
	UserVO getUserById(String username);
}
