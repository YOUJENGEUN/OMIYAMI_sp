package com.omiyami.shop.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


	//회원가입	
	@Override
	public void signup(UserVO vo) throws Exception{
		sqlSession.insert("UserMapper.signup",vo);
	}
	
	@Override
	public String findId(UserVO vo) {
		return sqlSession.selectOne("UserMapper.findId", vo);
	}
	
	@Override
	public String findPw(UserVO vo) {
		return sqlSession.selectOne("UserMapper.findPw", vo);
	}
	
	@Override
	public void updatePw(UserVO vo) {
	   sqlSession.update("UserMapper.updatePw", vo);  // 변경된 행 수 반환
	}
	
}
