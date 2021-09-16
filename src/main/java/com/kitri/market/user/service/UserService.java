package com.kitri.market.user.service;

import com.kitri.market.user.vo.UserAddrVO;
import com.kitri.market.user.vo.UserVO;

public interface UserService {
	
	//  Controller에서 받고 ServiceImpl로 보냄
	
	public String signinCheckUser(UserVO uvo);
	public boolean idCheck(String userid);
	public boolean registUser(UserVO uvo, UserAddrVO udvo);
}
