package com.kitri.market.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.user.vo.NaverUserVO;

@Repository
public class NaverUserDAOImpl implements NaverUserDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public NaverUserVO selectNaverUser(String email) {
		NaverUserVO nuvo = sqlSession.selectOne("naveruser.selectNaverUser", email); // selectOne 하나의 값만 조회
		return nuvo;
	}

	@Override
	public int insertNaverUser(NaverUserVO nuvo) {
		return sqlSession.insert("naveruser.insertNaverUser", nuvo);
	}

}
