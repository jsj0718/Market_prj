package com.kitri.market.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.user.dao.MyPageDAO;
import com.kitri.market.user.vo.MyPageVO;

@Service
public class MyPageServiceImpl implements MyPageService {
    @Autowired
    private MyPageDAO mypageDao;

    @Override
    public List<MyPageVO> getSellList(String userId) {
        return mypageDao.selectSellList(userId);
    }

    @Override
    public List<MyPageVO> getSoldoutList(String userId) {
        return mypageDao.selectSoldoutList(userId);
    }

    @Override
    public List<MyPageVO> getBuyList(String userId) {
        return mypageDao.selectBuyList(userId);
    }
    
    //나의 동네리스트
    @Override
    public List<MyPageVO> searchMyAddress(String userId) {
      return mypageDao.selectMyAddress(userId);
    }
    //나의 동네 삭제
    @Override
    public int deleteAddress(MyPageVO mvo) {
      return mypageDao.deleteAddress(mvo);
    }
    //회원정보 리스트
    @Override
    public List<MyPageVO> searchMyInfo(String userId) {
      return mypageDao.selectMyInfo(userId);
    }
    //회원 수정
    @Override
    public int updateMyInfo(MyPageVO mvo) {
      return mypageDao.updateInfo(mvo);
    }
    //회원 탈퇴
    @Override
    public int deleteMyInfo(String userId) {
      return mypageDao.deleteInfo(userId);
    }

}
