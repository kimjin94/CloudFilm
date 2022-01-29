package com.community.cloudfilm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.TrailerDAO;
import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.model.MemberVO;

@Service
public class TrailerService {
	@Autowired
	private TrailerDAO trailerDAO;

	// 예고편 작성하기
	public void insertTrailer(BoardVO board) {
		String[] videoList = board.getBoard_video().split("/");
		String board_video = videoList[3].replace("watch?v=", "");
		board.setBoard_video(board_video);
		
		trailerDAO.insertTrailer(board);
	}

	// 예고편 리스트 불러오기
	public Map<String, Object> getTrailerList(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> trailerlist = new ArrayList<BoardVO>();

		int page = 1;
		int limit = 10; // 한 화면에 출력할 레코드수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 총 리스트 수를 받아옴.
		int listcount = trailerDAO.getListCount();

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		trailerlist = trailerDAO.getBoardList(page); // 리스트를 받아옴.

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("page", page);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("trailerlist", trailerlist);
		
		return resultMap;
	}

	// 예고편 상세보기
	public Map<String, Object> getTrailerDetail(HttpServletRequest request, HttpServletResponse response) {
		
		int page = Integer.parseInt(request.getParameter("page"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardVO board = trailerDAO.getBoardDetail(board_num);
		
		String board_cont = board.getBoard_cont().replace("\n", "<br/>");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		int checkTrailerGood = 0;
		int checkTrailerBad = 0;
		int mem_num = 0;
		// 세션에서 로그인한 계정의 정보 받아오기
		HttpSession session = request.getSession();
		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO)session.getAttribute("member");
			// 회원번호 가져오기
			mem_num = member.getMem_num();
			
			resultMap.put("mem_num", mem_num);
			
			// 좋아요를 눌렀는지 
			if(trailerDAO.checkTrailerGood(board_num, mem_num) != 0) {
				checkTrailerGood = trailerDAO.checkTrailerGood(board_num, mem_num);
			}
			//  싫어요를 눌렀는지	
			if(trailerDAO.checkTrailerBad(board_num, mem_num) != 0) {
				checkTrailerBad = trailerDAO.checkTrailerBad(board_num, mem_num);
			}
		}
		
		System.out.println(checkTrailerGood);
		System.out.println(checkTrailerBad);
		System.out.println(mem_num);
		
		resultMap.put("checkTrailerGood", checkTrailerGood);
		resultMap.put("checkTrailerBad", checkTrailerBad);
		resultMap.put("page", page);
		resultMap.put("board_num", board_num);
		resultMap.put("board_cont", board_cont);
		resultMap.put("board", board);
		
		return resultMap;
	}

	// 예고편 추천
	public BoardVO goodtrailer(HttpServletRequest request, HttpServletResponse response) {
		
		BoardVO baord = trailerDAO.goodtrailer(request, response);
		
		return baord;
	}

	// 예고편 추천 취소
	public BoardVO nogoodtrailer(HttpServletRequest request, HttpServletResponse response) {
		
		return trailerDAO.nogoodtrailer(request, response);
	}

	// 예고편 비추
	public BoardVO badtrailer(HttpServletRequest request, HttpServletResponse response) {
		
		return trailerDAO.badtrailer(request, response);
	}

	// 예고편 비추 취소
	public BoardVO nobadtrailer(HttpServletRequest request, HttpServletResponse response) {
		
		return trailerDAO.nobadtrailer(request, response);
	}

	// 댓글새로고침 할 때 게시글정보 같이 긁어오기
	public BoardVO getTrailerDetailAtReply(int board_num) {
		return trailerDAO.getTrailerDetailAtReply(board_num);
	}

	// 예고편 검색
	public Map<String, Object> getTrailersearchList(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> trailersearchlist = new ArrayList<BoardVO>();
		
		// parameter를 map으로 넘김
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		// view페이지에 넘길 값을 map형태로 넘김
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int page = 1;
		int limit = 10; // 한 화면에 출력할 레코드수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			
		}
		
		// 검색을 할 경우
		if(request.getParameter("search") != null && request.getParameter("keyword") != null) {
			String search = request.getParameter("search");
			String keyword = request.getParameter("keyword");
			
			paraMap.put("search", search);
			paraMap.put("keyword", keyword);
			
			resultMap.put("search", search);
			resultMap.put("keyword", keyword);
		}
		
		// 필터로 정렬할 경우
		if(request.getParameter("board_filter") != null) {
			String board_filter = request.getParameter("board_filter");
			
			paraMap.put("board_filter", board_filter);
			
			resultMap.put("board_filter", board_filter);
			
		}
		

		paraMap.put("page", page);

		// 총 리스트 수를 받아옴.
		int listcount = trailerDAO.getSearchListCount(paraMap);

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		trailersearchlist = trailerDAO.getSearchBoardList(paraMap); // 리스트를 받아옴.

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		
		

		resultMap.put("page", page);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("trailersearchlist", trailersearchlist);
		
		return resultMap;
	}
}
