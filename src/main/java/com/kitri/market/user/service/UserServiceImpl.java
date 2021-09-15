package com.kitri.market.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.user.dao.UserDAO;
//import com.kitri.market.user.vo.UserInfoVO;
import com.kitri.market.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired // bean을 자동주입
	private UserDAO userDAO;
	
	// 로그인 체크 (T,F)
	@Override
	public boolean signinCheckUser(UserVO uvo) {
		
		UserVO vo = userDAO.selectUser(uvo);
		boolean signinFlag = false;
		
		// 로그인 됬을 때
		if(vo != null) {
			signinFlag = true;
		
		// 아닐 때
		} else {
			signinFlag = false;
		}
		
		return signinFlag;
		
	}
	
	// id중복체크 flag (T,F)
	@Override
	public boolean idCheck(String userid) {
		int result = userDAO.selectIdCheck(userid);
		boolean idCheckFlag = false;
		
		// ID가 있으면 실패
		if(result != 0) {
			idCheckFlag = false;
		
		// ID가 없으면 성공
		} else {
			idCheckFlag = true;
		}
		
		return idCheckFlag;
		
	}
	
	// 등록 (1,0)
	@Override
	public boolean registUser(UserVO uvo) {
//		System.out.println(uvo.toString());
//		System.out.println(uvo.getImg());
		int result = userDAO.insertUser(uvo);
		boolean registCheckFlag = false;
		
		// 정상 회원가입
		if(result != 0) {
			registCheckFlag = true;
		
		} else {
			registCheckFlag = false;
		}
		
		return registCheckFlag;
		
	}

//	@Override
//	public boolean registAddr(UserInfoVO uivo) {
//		int result = userDAO.insertAddr(uivo);
//		boolean registAddrCheck = false;
//		
//		if(result != 0) {
//			registAddrCheck = true;
//		} else {
//			registAddrCheck = false;
//		}
//		return registAddrCheck;
//	}

}
