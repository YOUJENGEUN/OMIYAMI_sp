package com.omiyami.shop.user;

public interface UserService {

	UserVO getUserForLogin(String username, String password);
	boolean idCheck(String username);
	
}
