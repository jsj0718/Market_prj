package com.kitri.market.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.admin.pagination.Criteria;
import com.kitri.market.admin.vo.AdminAnalysisVO;
import com.kitri.market.admin.vo.AdminBlacklistVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

  @Autowired
  private SqlSession SqlSession;
  
  
  @Override
  public List<AdminAnalysisVO> selectUserGender() {
    
    return SqlSession.selectList("adminchart.userGenderChart");
  }

  @Override
  public List<AdminAnalysisVO> selectUserAge() {

    return SqlSession.selectList("adminchart.userAgeChart");
  }

  @Override
  public List<AdminAnalysisVO> selectDailyBoard() {

    return SqlSession.selectList("adminchart.dailyBoard");
  }

  @Override
  public List<AdminAnalysisVO> selectCompleteBoard() {

    return SqlSession.selectList("adminchart.completeBoard");
  }

  @Override
  public List<AdminAnalysisVO> selectBestCategory() {

    return SqlSession.selectList("adminchart.categoryBest");
  }
//--------------------------------report-----------------------------------------

  //페이징처리용 총갯수 
  @Override
  public int reportCount() {
    return SqlSession.selectOne("blacklist.reportCount");
  }
  //레포트 리스트
  @Override
  public List<AdminBlacklistVO> selectReportList(Criteria cri) {
    return SqlSession.selectList("blacklist.pagingList",cri);
  }
  //신고 내역 삭제
  @Override
  public int deleteReport(int reportid) {
    return SqlSession.delete("blacklist.deleteReport",reportid);
  }
  //카테고리 추가
  @Override
  public int insertCategory(String categoryname) {
    return SqlSession.insert("blacklist.insertCategory",categoryname);
  }
//--------------------------------blackList------------------------------------ 
//====================five===============================  
  //fivelist
  @Override
  public List<AdminBlacklistVO> selectFiveList(Criteria cri) {
    return SqlSession.selectList("blacklist.fiveList",cri);
  }
  //fiveCount
  @Override
  public int fiveCount() {
    return SqlSession.selectOne("blacklist.fiveCount");
  }
  @Override
  public int fiveDelete(String userid) {
    return SqlSession.delete("blacklist.fiveDelete",userid);
  }
  
//====================three===============================
  //threeList
  @Override
  public List<AdminBlacklistVO> selectThreeList(Criteria cri) {
    return SqlSession.selectList("blacklist.threeList",cri);
  }
  //threeCount
  @Override
  public int threeCount() {
    return SqlSession.selectOne("blacklist.threeCount");
  }
  //threeUpdate
  @Override
  public int threeUpdate(String userid) {
    return SqlSession.update("blacklist.threeUpdate",userid);
  }
  //유저차트
  @Override
  public List<AdminBlacklistVO> selectUserChart() {
    return SqlSession.selectList("blacklist.blackListChart");
  }


  
  
  

}
