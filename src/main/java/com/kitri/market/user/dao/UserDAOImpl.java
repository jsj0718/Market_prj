package com.kitri.market.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public UserVO selectUser(UserVO uvo) {
		return sqlSession.selectOne("login.selectUser", uvo);
	}
	
	@Override
	public int selectIdCheck(String userid) {
		return sqlSession.selectOne("login.selectIdCheck", userid);
	}

	@Override
	public int insertUser(UserVO uvo) {
		return sqlSession.insert("login.insertUser", uvo);
	}

}
