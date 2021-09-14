package com.kitri.market.chat.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.chat.vo.UserReportVO;

@Repository
public class UserReportDAOImpl implements UserReportDAO {
    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public int selectReportPossible(UserReportVO urvo) {
        return sqlSession.selectOne("user_report.selectReportPossible", urvo);
    }

    @Override
    public int insertReport(UserReportVO urvo) {
        return sqlSession.insert("user_report.insertReport", urvo);
    }

    @Override
    public int updateUserReportCnt(String id) {
        return sqlSession.update("user_report.updateUserReportCnt", id);
    }
    
}
