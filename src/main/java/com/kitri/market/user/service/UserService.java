package com.kitri.market.user.service;

import com.kitri.market.user.vo.UserVO;

public interface UserService {
	
	public boolean signinCheckUser(UserVO uvo);
	public boolean idCheck(String userid);
	public boolean registUser(UserVO uvo);
//	public boolean registImgBoard(UserVO uvo);

}
