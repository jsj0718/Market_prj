package com.kitri.market.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.user.vo.MyPageVO;
@Repository
public class MyPageDAOImpl implements MyPageDAO {
    @Autowired
    SqlSession SqlSession;

    @Override
    public List<MyPageVO> selectSellList(String userId) {
        return SqlSession.selectList("user.selectSellList",userId);
    }

    @Override
    public List<MyPageVO> selectSoldoutList(String userId) {
        return SqlSession.selectList("user.selectSoldoutList",userId);
    }
    
    @Override
    public List<MyPageVO> selectBuyList(String userId) {
        return SqlSession.selectList("user.selectBuyList",userId);
    }

  //나의 동네 리스트
    @Override
    public List<MyPageVO> selectMyAddress(String userId) {
      return SqlSession.selectList("user.myAddressList",userId);
    }
    //동네리스트 선택 삭제
    @Override
    public int deleteAddress(MyPageVO mvo) {
      return SqlSession.delete("user.myAddressDelete",mvo);
    }
    //회원 정보 리스트
    @Override
    public List<MyPageVO> selectMyInfo(String userId) {
      return SqlSession.selectList("user.userInfo",userId);
    }
    //회원 수정
    @Override
    public int updateInfo(MyPageVO mvo) {
      return SqlSession.update("user.userUpdate",mvo);
    }
    //회원 탈퇴
    @Override
    public int deleteInfo(String userId) {
      // TODO Auto-generated method stub
      return SqlSession.delete("user.userDelete",userId);
    }

}
