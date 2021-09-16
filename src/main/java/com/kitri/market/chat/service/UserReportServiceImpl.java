package com.kitri.market.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.chat.dao.UserReportDAOImpl;
import com.kitri.market.chat.vo.UserReportVO;

@Service
public class UserReportServiceImpl implements UserReportService {
    
    @Autowired
    private UserReportDAOImpl urdao;
    
    @Override
    public int searchReportPossible(UserReportVO urvo) {
        return urdao.selectReportPossible(urvo);
    }

    @Override
    public int insertReport(UserReportVO urvo) {
        return urdao.insertReport(urvo);
    }

    @Override
    public int updateUserReportCnt(String id) {
        return urdao.updateUserReportCnt(id);
    }
    
}
