package com.community.cloudfilm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
//	public int getSearchListCount(String keyword) {
//		return reviewDAO.getSearchListCount(keyword);
//	}
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
	//검색적용 게시글 목록
	public Map<String, Object> getreviewsearchlist(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> reviewsearchlist = new ArrayList<BoardVO>();
		
		Map<String, Object> javaMap = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int page =1;
		int limit =20;	//한 화면에 출력할 레코드 수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));	
		}
		// 검색을 할 경우
		if(request.getParameter("search") != null && request.getParameter("keyword") != null) {
			String search = request.getParameter("search");
			String keyword = request.getParameter("keyword");
			
			javaMap.put("search", search);
			javaMap.put("keyword", keyword);
			
			resultMap.put("search", search);
			resultMap.put("keyword", keyword);
		}
		// 필터로 정렬할 경우
		if(request.getParameter("board_filter") != null) {
			String board_filter = request.getParameter("board_filter");
			
			javaMap.put("board_filter", board_filter);
			
			resultMap.put("board_filter", board_filter);
			
		}
		javaMap.put("page", page);
		
		//총리스트 수를 받아옴
		int listcount = reviewDAO.getSearchListCount(javaMap);
		
		//페이지 번호 dao클래스로 전달
		reviewsearchlist = reviewDAO.getSearchReviewList(javaMap);//리스트 받아옴
		
		//총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); //0.95더해서 올림처리
		
		//현재 페이지에 보요줄 시작 페이지수 (1,21,41..)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		
		System.out.println(page);
		System.out.println(startpage);
		//현재 페이지에 보여줄 마지막 페이지 수(20,40,60...)
		int endpage = maxpage;
		
		if(endpage > startpage + 10 -1)
			endpage = startpage + 10 -1;
		
		resultMap.put("page", page);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("reviewsearchlist", reviewsearchlist);
		
		return resultMap;

	}
	
	
	
	
	



}
