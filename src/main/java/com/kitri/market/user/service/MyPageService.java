package com.kitri.market.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kitri.market.user.vo.MyPageVO;

@Service
public interface MyPageService {
    public List<MyPageVO> getSellList(String userId);
    public List<MyPageVO> getSoldoutList(String userId);
    public List<MyPageVO> getBuyList(String userId);
    
  //나의 동네 리스트 서비스
    public List<MyPageVO> searchMyAddress(String userId);
    //나의 동네 삭제 서비스
    public int deleteAddress(MyPageVO mvo);
    
    //회원 정보 리스트
    public List<MyPageVO> searchMyInfo(String userId);
    //회원정보 수정
    public int updateMyInfo(MyPageVO mvo);
    //회원 탈퇴
    public int deleteMyInfo(String userId);
}
