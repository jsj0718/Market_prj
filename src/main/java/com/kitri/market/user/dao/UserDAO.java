package com.kitri.market.user.dao;

//import com.kitri.market.user.vo.UserInfoVO;
import com.kitri.market.user.vo.UserVO;

public interface UserDAO {
	
	// ServiceImpl에서 받고 DAOImpl로 보냄
	
	public UserVO selectUser(UserVO uvo);
	public int selectIdCheck(String userid);
	public int insertUser(UserVO uvo);
//	public int insertAddr(UserInfoVO uivo);

}
