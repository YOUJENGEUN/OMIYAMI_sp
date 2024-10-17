package com.omiyami.shop.user.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.user.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVO getUserForLogin(String username, String password) {
		UserVO vo = new UserVO();
		vo.setUsername(username);
		vo.setPassword(password);
		return sqlSession.selectOne("UserMapper.getUserForLogin", vo);
	}

	@Override
	public UserVO getUserById(String username) {
		return sqlSession.selectOne("UserMapper.getUserById", username);
	}

}
