package com.kitri.market.post.dao;

import java.util.List;

import com.kitri.market.post.vo.PostCategoryVO;
import com.kitri.market.post.vo.PostDetailImgVO;
import com.kitri.market.post.vo.PostDetailReportVO;
import com.kitri.market.post.vo.PostDetailVO;

public interface PostDetailDAO {
	//상세보기 페이지 조회
	public PostDetailVO selectPostDetail(int boardid);
	//사용자 신고 수 조회
	public PostDetailReportVO selectReport(int boardid);
	
	//상세보기 이미지 리스트 조회 
	public List<PostDetailImgVO> selectImgBoards(int boardid);
	
	//게시물 업로드
	public int insertPosting(PostDetailVO pdvo);
	//게시물 이미지 업로드
	public int insertImgPosting(PostDetailImgVO pdivo);
	
	//카테고리 보기
	public List<PostCategoryVO> selectCategory();
	
	//게시물 수정
	public int updatePosting(PostDetailVO pdvo);
	//게시물 이미지 수정
	
}
