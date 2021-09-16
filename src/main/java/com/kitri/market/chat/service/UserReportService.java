package com.kitri.market.chat.service;

import com.kitri.market.chat.vo.UserReportVO;

public interface UserReportService {
    public int searchReportPossible(UserReportVO urvo);
    public int insertReport(UserReportVO urvo);
    public int updateUserReportCnt(String id);
    
}
