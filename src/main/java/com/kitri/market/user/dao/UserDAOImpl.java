package com.kitri.market.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.user.vo.UserAddrVO;
//import com.kitri.market.user.vo.UserInfoVO;
import com.kitri.market.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	/*
	* mybatis를 이용하여 DAO를 구현하려면 SqlSession 객체가 필요
	* spring 컨테이너에서 생성하도록 설정하면 자동구현
	*/
	@Autowired
	private SqlSession sqlSession;
	
	// 회원 조회 로그인
	@Override
	public UserVO selectUser(UserVO uvo) {
		return sqlSession.selectOne("login.selectUser", uvo);
	}
	
	// id중복체크
	@Override
	public int selectIdCheck(String userid) {
		return sqlSession.selectOne("login.selectIdCheck", userid);
	}
	
	// 회원가입 insert
	@Override
	public int insertUser(UserVO uvo) {
		return sqlSession.insert("login.insertUser", uvo);
	}

	@Override
	public int insertAddr(UserAddrVO udvo) {
		return sqlSession.insert("user-address.insertAddr", udvo);
	}

}
