package com.omiyami.shop.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	@Override
	public void signup(UserVO vo) throws Exception{
		userDAO.signup(vo);
	}
	
	//아이디 찾기
	@Override
	public String findId(UserVO vo) {
		return userDAO.findId(vo);
		}
	
	//비밀번호 찾기
	@Override
	public String findPw(UserVO vo) {
		return userDAO.findPw(vo);
	}
	
	@Override
	public void updatePw(UserVO vo) {
	    userDAO.updatePw(vo);  // 변경된 행 수 확인
	}
}
