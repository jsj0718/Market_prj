package com.kitri.market.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.post.dao.PostDetailDAO;
import com.kitri.market.post.vo.PostDetailImgVO;
import com.kitri.market.post.vo.PostDetailReportVO;
import com.kitri.market.post.vo.PostDetailVO;

@Service
public class PostDetailServiceImpl implements PostDetailService{

	@Autowired
	private PostDetailDAO postBoardDAO;

	@Override
	public PostDetailVO selectPostDetail(int boardid) {
		System.out.println("selectPostDetail service : " + boardid);
		
		return postBoardDAO.selectPostDetail(boardid);
	}

	@Override
	public PostDetailReportVO selectReport(int boardid) {
		System.out.println("selectReport service: " + boardid);		
		
		return postBoardDAO.selectReport(boardid);
	}

	@Override
	public List<PostDetailImgVO> getImgBoardList(int boardid) {
		
		return postBoardDAO.selectImgBoards(boardid);
	}

	@Override
	public boolean registPosting(PostDetailVO pdvo) {
		int result = postBoardDAO.insertPosting(pdvo);
		boolean registFlag = false;
		
		if(result != 0) {
			registFlag = true;
		}
		
		return registFlag;
	}
	
	

}