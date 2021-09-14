package com.kitri.market.chat.dao;

import com.kitri.market.chat.vo.UserReportVO;

public interface UserReportDAO {
    public int selectReportPossible(UserReportVO urvo);
    public int insertReport(UserReportVO urvo);
    public int updateUserReportCnt(String id);
}
