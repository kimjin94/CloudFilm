package com.community.cloudfilm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.TrailerDAO;
import com.community.cloudfilm.model.BoardVO;

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

	public Map<String, Object> getTrailerDetail(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("page"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardVO board = trailerDAO.getBoardDetail(board_num);
		
		String board_cont = board.getBoard_cont().replace("\n", "<br/>");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("page", page);
		resultMap.put("board_num", board_num);
		resultMap.put("board_cont", board_cont);
		resultMap.put("board", board);
		
		return resultMap;
	}

}
