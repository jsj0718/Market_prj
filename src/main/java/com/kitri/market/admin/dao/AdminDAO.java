package com.kitri.market.admin.dao;

import java.util.List;
import java.util.Map;

import com.kitri.market.admin.pagination.Criteria;
import com.kitri.market.admin.vo.AdminAnalysisVO;
import com.kitri.market.admin.vo.AdminBlacklistVO;

public interface AdminDAO {
//차트에 필요한 dao
  public List<AdminAnalysisVO> selectUserGender();
  public List<AdminAnalysisVO> selectUserAge();
  public List<AdminAnalysisVO> selectDailyBoard();
  public List<AdminAnalysisVO> selectCompleteBoard();
  public List<AdminAnalysisVO> selectBestCategory();
  
//레포트 페이지에 필요한 dao  
  //레포트 페이징 갯수 
  public int reportCount();
  //레포트 페이징 list
  public List<AdminBlacklistVO> selectReportList(Criteria cri);
  //레포트 삭제
  public int deleteReport(int reportid);
  //카테고리 추가
  public int insertCategory(String categoryname);
  
  
//BlacList 페이지에 필요한 dao
  //5회 이상 페이지 list
  public List<AdminBlacklistVO> selectFiveList(Criteria cri);
  //5회 이상 총 갯수
  public int fiveCount();
  //5회이상 회원 삭제
  public int fiveDelete(String userid);
  
  //3회 이상 페이지 List
  public List<AdminBlacklistVO> selectThreeList(Criteria cri);
  //3회 이상 갯수
  public int threeCount();
  //3회 이상 경고(업데이트)
  public int threeUpdate(String userid);
  //블랙리스트 페이지 차트
  public List<AdminBlacklistVO> selectUserChart();
  
  
}
