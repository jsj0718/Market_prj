package com.kitri.market.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.board.dao.MainDAO;
import com.kitri.market.board.vo.MainVO;
@Service
public class MainServiceImpl implements MainService{
    @Autowired
    private MainDAO mainDao;

    @Override
    public boolean registUserAddress(MainVO mvo) {
        int result = mainDao.insertUserAddress(mvo);
        boolean registFlag = false;
        if(result != 0) {
            registFlag = true;
        }
        return registFlag;
    }

    @Override
    public List<MainVO> getUserAddress(String userId) {
        return mainDao.selectUserAddress(userId);
    }

    @Override
    public List<MainVO> getBoard(String userId) {
        return mainDao.selectBoard(userId);
    }

    @Override
    public List<MainVO> getBoardAddress(String addressName) {
        return mainDao.selectBoardAddress(addressName);
    }

    @Override
    public List<MainVO> getSearchBoard(String inputSearch) {
        return mainDao.searchBoard(inputSearch);
    }

    @Override
    public List<MainVO> getCategory() {
        return mainDao.selectCategory();
    }

    @Override
    public List<MainVO> getCategoryBoard(String categoryName) {
        // TODO Auto-generated method stub
        return mainDao.selectCategoryBoard(categoryName);
    }

}
