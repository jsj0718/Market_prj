package com.kitri.market.user.service;

//import com.kitri.market.user.vo.UserInfoVO;
import com.kitri.market.user.vo.UserVO;

public interface UserService {
	
	//  Controller에서 받고 ServiceImpl로 보냄
	
	public boolean signinCheckUser(UserVO uvo);
	public boolean idCheck(String userid);
	public boolean registUser(UserVO uvo);
//	public boolean registAddr(UserInfoVO uivo);
}
