package com.kitri.market.post.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.post.vo.PostCategoryVO;
import com.kitri.market.post.vo.PostDetailImgVO;
import com.kitri.market.post.vo.PostDetailReportVO;
import com.kitri.market.post.vo.PostDetailVO;

@Repository
public class PostDetailDAOImpl implements PostDetailDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<PostDetailImgVO> selectImgBoards(int boardid) {
		
		return sqlSession.selectList("img.selectImgDetail", boardid);
	}
	
	//상세보기 페이지 조회
	@Override
	public PostDetailVO selectPostDetail(int boardid) {
		System.out.println("selectPostDetail Dao : " + boardid);
		
		return sqlSession.selectOne("post.selectPostDetail", boardid);
	}

	@Override
	public PostDetailReportVO selectReport(int boardid) {
		System.out.println("selectReport Dao : " + boardid);	
		
		return sqlSession.selectOne("report.selectReport", boardid);
	}
	//게시물 업로드
	@Override
	public int insertPosting(PostDetailVO pdvo) {
		
		return sqlSession.insert("post.insertPosting",pdvo);
	}
	//게시물 이미지 업로드
	@Override
	public int insertImgPosting(PostDetailImgVO pdivo) {
		
		return sqlSession.insert("img.insertImgPosting",pdivo);
	}
	
	//카테고리 보기
	@Override
	public List<PostCategoryVO> selectCategory() {
		
		return sqlSession.selectList("category.selectCategory");
	}
	
	
	//게시글 수정
	@Override
	public int updatePosting(PostDetailVO pdvo) {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
	

}
