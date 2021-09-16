package com.kitri.market.user.dao;

import com.kitri.market.user.vo.NaverUserVO;

public interface NaverUserDAO {
	
	public NaverUserVO selectNaverUser(String email);
	public int insertNaverUser(NaverUserVO nuvo);

}
