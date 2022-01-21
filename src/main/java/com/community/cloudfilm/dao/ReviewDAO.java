package com.community.cloudfilm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;

	//리뷰글 작성 저장
	public void insertReview(BoardVO board) {
		System.out.println("리뷰쓰기 dao");
		sqlSession.insert("reviewMapper.insert_review", board);
	}
	//게시글 갯수
	public int getListCount()throws Exception {
		int count = 0;
		count = sqlSession.selectOne("reviewMapper.reviewlist_count");
		return count;
	}
	//게시글 목록
	public List<BoardVO> getReviewList(int page)throws Exception {
		System.out.println("리뷰리스트 디");
		List<BoardVO> reviewlist = sqlSession.selectList("reviewMapper.review_list", page);
		return reviewlist;
	}
	//필터적용 게시글 갯수
	public int getFilterListCount(String board_filter) {
		int count = 0;
		count =sqlSession.selectOne("reviewMapper.reviewFilter_count", board_filter);
		return count;
	}
	//필터적용 게시글 갯수
	public List<BoardVO> getFilterReviewList(Map<String, Object> indexMap) {
		List<BoardVO> list = sqlSession.selectList("reviewMapper.reviewFilter_list", indexMap);
		return list;
	}
	//게시글 원문내용
	public BoardVO getReviewCont(int board_num)throws Exception {
		return sqlSession.selectOne("reviewMapper.review_cont", board_num);
	}
	//조회수 증가
	public void reviewHit(int board_num)throws Exception {
		sqlSession.update("reviewMapper.review_hit", board_num);
	}
	//리뷰 수정
	public void reviewUpdate(BoardVO board)throws Exception {
		sqlSession.update("reviewMapper.review_update", board);
	}
	//리뷰 삭제
	public void reviewDelete(int board_num)throws Exception {
		System.out.println("리뷰삭제시켜줘 디");
		sqlSession.delete("reviewMapper.review_delete", board_num);
	}
	
	
	


}
