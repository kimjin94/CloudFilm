package com.community.cloudfilm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.ReviewDAO;
import com.community.cloudfilm.model.BoardVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;

	//리뷰글 작성 저장
	public void insertReview(BoardVO board)throws Exception{
		System.out.println("리뷰작성 서비스");
		reviewDAO.insertReview(board);
	}
	//게시글 갯수
	public int getListCount()throws Exception {
		return reviewDAO.getListCount();
	}
	//게시글 목록
	public List<BoardVO> getReviewList(int page)throws Exception {
		System.out.println("리뷰리스트 서");
		return reviewDAO.getReviewList(page);
	}
	//필터 적용 게시글 갯수
	public int getFilterListCount(String board_filter) {
		return reviewDAO.getFilterListCount(board_filter);
	}
	//필터적용 게시글 목록
	public List<BoardVO> getFilterReviewList(Map<String, Object> indexMap) {
		return reviewDAO.getFilterReviewList(indexMap);
	}
	//검색 적용 게시글 갯수
	public int getSearchListCount(String keyword) {
		return reviewDAO.getSearchListCount(keyword);
	}
	//검색 적용 게시글 목록
	public List<BoardVO> getSearchReviewList(Map<String, Object> parameterMap) {
		return reviewDAO.getSearchReviewList(parameterMap);
	}
	//리뷰게시글 원문내용
	public BoardVO getReviewCont(int board_num)throws Exception {
		BoardVO review = reviewDAO.getReviewCont(board_num);
		return review;
	}
	//조회수 증가
	public void hit(int board_num)throws Exception{
		reviewDAO.reviewHit(board_num);
	}
	//리뷰 수정
	public void reviewUpdate(BoardVO board)throws Exception {
		reviewDAO.reviewUpdate(board);
	}
	//리뷰삭제
	public void reviewDelete(int board_num)throws Exception {
		System.out.println("리뷰삭제시켜줘 서");
		reviewDAO.reviewDelete(board_num);
	}
	
	public int checkTrailerGood(int board_num, int mem_num) {
		return reviewDAO.checkTrailerGood(board_num, mem_num);
	}
	public int checkTrailerBad(int board_num, int mem_num) {
		return reviewDAO.checkTrailerBad(board_num, mem_num);
	}
	
	
	
	
	



}
