package com.kitri.market.admin.service;

import java.util.List;
import java.util.Map;

import com.kitri.market.admin.pagination.Criteria;
import com.kitri.market.admin.vo.AdminAnalysisVO;
import com.kitri.market.admin.vo.AdminBlacklistVO;

public interface AdminService {
//---차트 서비스----------  
  public List<AdminAnalysisVO> searchUserGender();
  public List<AdminAnalysisVO> searchUserAge();
  public List<AdminAnalysisVO> searchDailyBoard();
  public List<AdminAnalysisVO> searchCompleteBoard();
  public List<AdminAnalysisVO> searchBestCategory();
  
//레포트 서비스-----------
  //신고 내역 페이징처리 총 개수
  public int reportCount();
  //신고내역 리스트
  public List<AdminBlacklistVO> searchReportList(Criteria cri);
  //레포트 삭제
  public int deleteReport(int reportid);
  //카테고리 추가
  public int insertCategory(String categoryname);
  
  
//블랙리스트 서비스-----------  
//====================five===============================  
  //5회이상 리스트
  public List<AdminBlacklistVO> searchFiveList(Criteria cri);
  //5회 이상 카운트
  public int fiveCount();
  //5회 이상 회원 삭제
  public int fiveDelete(String userid);
  
//====================three===============================  
  //3회 리스트
  public List<AdminBlacklistVO> searchThreeList(Criteria cri);
  //3회 이상 카운트
  public int threeCount();
  //3회 이상 경고 
  public int threeUpdate(String userid);
  //유저 차트
  public List<AdminBlacklistVO> searchUserChart();
  
}
