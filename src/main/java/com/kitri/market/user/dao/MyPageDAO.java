package com.kitri.market.user.dao;

import java.util.List;

import com.kitri.market.user.vo.MyPageVO;

public interface MyPageDAO {
    //판매중인 내역
    public List<MyPageVO> selectSellList(String userId);
    
    //판매완료 내역
    public List<MyPageVO> selectSoldoutList(String userId);
    
    //구매내역
    public List<MyPageVO> selectBuyList(String userId);
    
    //동네 리스트
    public List<MyPageVO> selectMyAddress(String userId);
    
    //동네 삭제
    public int deleteAddress(MyPageVO mvo);
    
    //회원정보 
    public List<MyPageVO> selectMyInfo(String userId);
    
    //회원 수정
    public int updateInfo(MyPageVO mvo);
    
    //회원 탈퇴
    public int deleteInfo(String userId); 

}
