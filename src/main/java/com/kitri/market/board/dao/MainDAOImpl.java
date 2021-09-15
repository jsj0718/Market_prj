package com.kitri.market.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.board.vo.MainVO;
@Repository
public class MainDAOImpl implements MainDAO {
    @Autowired
    SqlSession sqlSession;
    
    @Override
    public int insertUserAddress(MainVO mvo) {
        return sqlSession.insert("main.insertUserAddress",mvo);
    }

    @Override
    public List<MainVO> selectUserAddress(String userId) {
        return sqlSession.selectList("main.selectUserAddress", userId);
    }

    @Override
    public List<MainVO> selectBoard(String userId) {
        return sqlSession.selectList("main.selectBoard",userId);
    }

    @Override
    public List<MainVO> selectBoardAddress(String addressName) {
        return sqlSession.selectList("main.selectBoardAddress", addressName);
    }

    @Override
    public List<MainVO> searchBoard(String inputSearch) {
        // TODO Auto-generated method stub
        return sqlSession.selectList("main.searchBoard", inputSearch);
    }

    @Override
    public List<MainVO> selectCategory() {
        return sqlSession.selectList("main.selectCategory");
    }

    @Override
    public List<MainVO> selectCategoryBoard(String categoryName) {
        return sqlSession.selectList("main.searchCategory", categoryName);
    }

}
