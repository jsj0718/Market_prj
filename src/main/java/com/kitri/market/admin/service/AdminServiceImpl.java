package com.kitri.market.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.admin.dao.AdminDAO;
import com.kitri.market.admin.pagination.Criteria;
import com.kitri.market.admin.vo.AdminAnalysisVO;
import com.kitri.market.admin.vo.AdminBlacklistVO;

@Service
public class AdminServiceImpl implements AdminService{

  @Autowired
  private AdminDAO admindao;
  
//----------블랙리스트 서비스impl-----------------
  @Override
  public List<AdminAnalysisVO> searchUserGender() {

    return admindao.selectUserGender();
  }

  @Override
  public List<AdminAnalysisVO> searchUserAge() {

    return admindao.selectUserAge();
  }

  @Override
  public List<AdminAnalysisVO> searchDailyBoard() {

    return admindao.selectDailyBoard();
  }

  @Override
  public List<AdminAnalysisVO> searchCompleteBoard() {

    return admindao.selectCompleteBoard();
  }

  @Override
  public List<AdminAnalysisVO> searchBestCategory() {

    return admindao.selectBestCategory();
  }
//----------레포트 서비스impl-----------------
 
  //신고 내역 페이징처리 총개수
  @Override
  public int reportCount() {
    return admindao.reportCount();
  }
  //신고 내역 리스트(페이징)
  @Override
  public List<AdminBlacklistVO> searchReportList(Criteria cri) {
    return admindao.selectReportList(cri);
  }
  //레포트 삭제
  @Override
  public int deleteReport(int reportid) {
    return admindao.deleteReport(reportid);
  }
  //카테고리 추가
  @Override
  public int insertCategory(String categoryname) {
    return admindao.insertCategory(categoryname);
  }
//----------블랙리스트 서비스impl-----------------
//====================five===============================
  //5회이상 리스트
  @Override
  public List<AdminBlacklistVO> searchFiveList(Criteria cri) {
    return admindao.selectFiveList(cri);
  }
  
  //5회이상 카운트
  @Override
  public int fiveCount() {
    return admindao.fiveCount();
  }
  
  @Override
  public int fiveDelete(String userid) {
    return admindao.fiveDelete(userid);
  }
//====================three===============================  
  //3회 이상 리스트
  @Override
  public List<AdminBlacklistVO> searchThreeList(Criteria cri) {
    return admindao.selectThreeList(cri);
  }
  //3회 이상 카운트
  @Override
  public int threeCount() {
    return admindao.threeCount();
  }
  //3회 이상 업데이트
  @Override
  public int threeUpdate(String userid) {
    return admindao.threeUpdate(userid);
  }
  //유저차트
  @Override
  public List<AdminBlacklistVO> searchUserChart() {
    return admindao.selectUserChart();
  }



  
  
  
}
