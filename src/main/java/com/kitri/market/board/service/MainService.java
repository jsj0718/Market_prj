package com.kitri.market.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kitri.market.board.vo.MainVO;


@Service
public interface MainService {
    //내 동네 추가
    public boolean registUserAddress(MainVO mvo);
    
    //내 동네 탭에서 해당 유저에 맞는 동네 불러오기
    public List<MainVO> getUserAddress(String userId);
    
    //카테고리 불러오기
    public List<MainVO> getCategory();
    
    //선택된 카테고리에 맞는 게시글 불러오기
    public List<MainVO> getCategoryBoard(String categoryName);
    
    //로그인 후, 메인에 해당 동네에 맞는 게시물 띄워주기
    public List<MainVO> getBoard(String userId);
    
    //선택된 동네에 맞는 게시글 띄워주기
    public List<MainVO> getBoardAddress(String addressName);
    
    //게시글검색
    public List<MainVO> getSearchBoard(String inputSearch);
    
    

}
