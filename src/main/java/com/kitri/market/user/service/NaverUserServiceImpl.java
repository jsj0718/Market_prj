package com.kitri.market.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.user.dao.NaverUserDAO;
import com.kitri.market.user.vo.NaverUserVO;

@Service
public class NaverUserServiceImpl implements NaverUserService{
	
	@Autowired
	private NaverUserDAO naverUserDAO;

	@Override
	public NaverUserVO registNaverUser(NaverUserVO nuvo) {
		
		if(nuvo.getBirthyear() == null) {
			nuvo.setBirthyear("");
		}
		
		if(nuvo.getMobile() == null) {
			nuvo.setMobile("");
		}
		
		NaverUserVO vo = naverUserDAO.selectNaverUser(nuvo.getEmail());
		int result = 0;
		
		if(vo == null) {
			result = naverUserDAO.insertNaverUser(nuvo);
			vo = nuvo;
		}
		
		return vo;
	}

}
