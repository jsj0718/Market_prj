package com.kitri.market.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.market.board.vo.MainVO;

public interface MainDAO {
    //내 동네 추가
    public int insertUserAddress(MainVO mvo);
    
    //내 동네 탭에서 해당 유저에 맞는 동네 불러오기
    public List<MainVO> selectUserAddress(String userId);
    
    //카테고리 불러오기
    public List<MainVO> selectCategory();
    
    //선택한 카테고리의 게시글 불러오기
    public List<MainVO> selectCategoryBoard(String categoryName);
    
    //로그인 후, 메인에 해당 동네에 맞는 게시물 띄워주기
    public List<MainVO> selectBoard(String userId);

    //선택된 동네에 맞는 게시글 띄워주기
    public List<MainVO> selectBoardAddress(String addressName);
    
    //게시글 검색
    public List<MainVO> searchBoard(String inputSearch);
    
    
}
