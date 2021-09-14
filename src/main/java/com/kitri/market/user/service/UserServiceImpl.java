package com.kitri.market.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.user.dao.UserDAO;
import com.kitri.market.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;

	@Override
	public boolean idCheck(String userid) {
		int result = userDAO.selectIdCheck(userid);
		boolean idCheckFlag = false;
		
		if(result != 0) {
			idCheckFlag = false;
			
		} else {
			idCheckFlag = true;
		}
		
		return idCheckFlag;
		
	}

	@Override
	public boolean signinCheckUser(UserVO uvo) {
		
		UserVO vo = userDAO.selectUser(uvo);
		boolean signinFlag = false;
		
		if(vo != null) {
			signinFlag = true;
		} else {
			signinFlag = false;
		}
		
		return signinFlag;
		
	}

	@Override
	public boolean registUser(UserVO uvo) {
		System.out.println(uvo.toString());
		System.out.println(uvo.getImg());
		int result = userDAO.insertUser(uvo);
		boolean registCheckFlag = false;
		
		if(result != 0) {
			registCheckFlag = true;
			
		} else {
			registCheckFlag = false;
		}
		
		return registCheckFlag;
		
	}

//	@Override
//	public boolean registImgBoard(UserVO uvo) {
//		int result = userDAO.insertUser(uvo);
//		boolean registFlag = false;
//		
//		if(result != 0) {
//			registFlag = true;
//		} else {
//			registFlag = true;
//		}
//		
//		return registFlag;
//	}

}
