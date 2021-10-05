package com.kitri.market.post.service;

import java.util.List;
import java.util.Map;

import com.kitri.market.post.vo.PostCategoryVO;
import com.kitri.market.post.vo.PostDetailImgVO;
import com.kitri.market.post.vo.PostDetailReportVO;
import com.kitri.market.post.vo.PostDetailVO;

public interface PostDetailService {
	
	//상세보기
	public PostDetailVO selectPostDetail(int boardid);
	public PostDetailReportVO selectReport(int boardid);
	
	//상세보기 이미지
	public List<PostDetailImgVO> getImgBoardList(int boardid);
	
	
	//게시글 올리기
	public boolean registPosting(PostDetailVO pdvo, PostDetailImgVO pdivo);
	
	//게시글 수정하기
	public boolean registUpdatePosting(PostDetailVO pdvo, PostDetailImgVO pdivo);
	
	
	//카테고리 보기
	public List<PostCategoryVO> selectCategory();
	
	// 구매자 수정
	public int updateBuyer(int boardid, String sender);
	
}
