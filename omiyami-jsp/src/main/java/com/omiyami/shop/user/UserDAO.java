package com.omiyami.shop.user;

public interface UserDAO {

	UserVO getUserForLogin(String username, String password);
	UserVO getUserById(String username);
}
