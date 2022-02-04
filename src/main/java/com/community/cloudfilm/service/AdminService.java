package com.community.cloudfilm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.AdminDAO;
import com.community.cloudfilm.model.BoardVO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	//한번에 출력할 글 갯수
	private int limit = 5;
	
	// 최근 리뷰 가져오기
	public Map<String, Object> getreviewlist(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> reviewlist = new ArrayList<BoardVO>();
		
		reviewlist = adminDAO.getreviewlist(limit); // 리스트를 받아옴.

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("reviewlist", reviewlist);
		
		return resultMap;
	}

	// 최근 추천 가져오기
	public Map<String, Object> getrecommendlist(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> recommendlist = new ArrayList<BoardVO>();

		recommendlist = adminDAO.getrecommendlist(limit); // 리스트를 받아옴.

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("recommendlist", recommendlist);
		
		return resultMap;
	}

	// 최근 예고편 가져오기
	public Map<String, Object> gettrailerlist(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> trailerlist = new ArrayList<BoardVO>();

		trailerlist = adminDAO.gettrailerlist(limit); // 리스트를 받아옴.

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("trailerlist", trailerlist);
		
		return resultMap;
	}

	// 게시판관리 게시글 가져오기
	public Map<String, Object> getboardlist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<BoardVO> boardlist = new ArrayList<BoardVO>();
		
		// parameter를 map으로 넘김
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		// view페이지에 넘길 값을 map형태로 넘김
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int page = 1;			// 페이징
		int limit = 20; 		// 한 화면에 출력할 레코드수
		int cate_num = 0; 		// 카테고리 필터
		String board_yn = ""; 	// 노출&정지
		String search = "";		// 검색필터
		String keyword = "";	// 검색어

		// 페이지를 받아온다면
		if (request.getParameter("page") != null && request.getParameter("page") != "") {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 카테고리를 받아온다면
		if (request.getParameter("cate_num") != null) {
			cate_num = Integer.parseInt(request.getParameter("cate_num"));
			
		}
		// 정지, 안정지??!?
		if (request.getParameter("board_yn") != null) {
			board_yn = request.getParameter("board_yn");
		}
		
		// 검색을 할 경우
		if(request.getParameter("search") != null && request.getParameter("keyword") != null) {
			search = request.getParameter("search");
			keyword = request.getParameter("keyword");
		}
		
		paraMap.put("page", page);
		paraMap.put("limit", limit);
		paraMap.put("cate_num", cate_num);
		paraMap.put("board_yn", board_yn);
		paraMap.put("search", search);
		paraMap.put("keyword", keyword);

		// 필터로 정렬할 경우
		if(request.getParameter("board_filter") != null) {
			String board_filter = request.getParameter("board_filter");
			
			paraMap.put("board_filter", board_filter);
			
			resultMap.put("board_filter", board_filter);
		}

		// 총 리스트 수를 받아옴.
		int listcount = adminDAO.getAdminSearchListCount(paraMap);
		System.out.println(listcount);

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		boardlist = adminDAO.getAdminSearchList(paraMap); // 리스트를 받아옴.

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		resultMap.put("search", search);
		resultMap.put("keyword", keyword);
		resultMap.put("cate_num", cate_num);
		resultMap.put("board_yn", board_yn);
		resultMap.put("page", page);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("boardlist", boardlist);
		
		return resultMap;
	}

	public void setBoardYN(HttpServletRequest request, HttpServletResponse response) throws Exception{
		adminDAO.setBoardYN(request, response);
	}

	// 회원리스트 받아오기
	public Map<String, Object> getmemberlist(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> memberlist = new ArrayList<BoardVO>();
		
		// parameter를 map으로 넘김
		Map<String, Object> paraMap = new HashMap<String, Object>();
				
		// view페이지에 넘길 값을 map형태로 넘김
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int page = 1;			// 페이징
		int limit = 20; 		// 한 화면에 출력할 레코드수
		String mem_yn = "";
		String search = "";		// 검색필터
		String keyword = "";	// 검색어
		
		// 정지, 안정지??!?
		if (request.getParameter("mem_yn") != null) {
			mem_yn = request.getParameter("mem_yn");
		}
		
		// 검색을 할 경우
		if(request.getParameter("search") != null && request.getParameter("keyword") != null) {
			search = request.getParameter("search");
			keyword = request.getParameter("keyword");
		}

		// 페이지를 받아온다면
		if (request.getParameter("page") != null && request.getParameter("page") != "") {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		paraMap.put("mem_yn", mem_yn);
		paraMap.put("page", page);
		paraMap.put("limit", limit);
		paraMap.put("search", search);
		paraMap.put("keyword", keyword);
		
		
		// 총 리스트 수를 받아옴.
		int listcount = adminDAO.getAdminMemberlistCount(paraMap);
		System.out.println(listcount);

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		memberlist = adminDAO.getAdminMemberlist(paraMap); // 리스트를 받아옴.

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		
		resultMap.put("search", search);
		resultMap.put("keyword", keyword);
		resultMap.put("mem_yn", mem_yn);
		resultMap.put("page", page);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("memberlist", memberlist);
		
		return resultMap;
	}

	public void setMemberYN(HttpServletRequest request, HttpServletResponse response) {
		adminDAO.setMemberYN(request, response);
	}

}
