package com.community.cloudfilm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.model.MemberVO;

@Repository
public class TrailerDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// 예고편 글쓰기
	public void insertTrailer(BoardVO board) {
		sqlSession.insert("trailer.insertTrailer", board);
	}

	// 예고편 글 갯수 가져오기
	public int getListCount() {
		return sqlSession.selectOne("trailer.getListCount");
	}

	// 예고편 리스트 가져오기
	public List<BoardVO> getBoardList(int page) {
		return sqlSession.selectList("trailer.getBoardList", page);
	}

	// 예고편 상세보기
	public BoardVO getBoardDetail(int board_num) {
		
		// 조회수 증가
		sqlSession.update("trailer.updateCount", board_num);
		// 상세정보 돌려주기
		BoardVO board = sqlSession.selectOne("trailer.getBoardDetail", board_num);
		// 추천 가져오기
		int board_good = sqlSession.selectOne("trailer.getTrailerGood", board_num);
		// 비추천 가져오기
		int board_bad = sqlSession.selectOne("trailer.getTrailerbad", board_num);
		
		board.setBoard_good(board_good);
		board.setBoard_bad(board_bad);
		
		return board;
	}

	// 예고편 추천
	public BoardVO goodtrailer(HttpServletRequest request, HttpServletResponse response) {
		BoardVO board = new BoardVO();
		
		// 세션에서 로그인한 계정의 정보 받아오기
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		// 회원번호 가져오기
		int mem_num = member.getMem_num();
		
		// 글번호 가져오기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		// map 객체 생성
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		// map 객체에 값넣기
		parameterMap.put("mem_num", mem_num);
		parameterMap.put("board_num", board_num);
		
		// 좋아요싫어요 테이블에 데이터 삽입
		sqlSession.insert("trailer.insertgood", parameterMap);
		
		board.setBoard_good(sqlSession.selectOne("trailer.getTrailerGood", board_num));
		
		return board;
		
	}
	
	// 예고편 추천 취소
	public BoardVO nogoodtrailer(HttpServletRequest request, HttpServletResponse response) {
		// 갱신될 추천, 비추천 값을 받을 board객체 생성
		BoardVO board = new BoardVO();
		// 세션에서 로그인한 계정의 정보 받아오기
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		// 회원번호 가져오기
		int mem_num = member.getMem_num();
		
		// 글번호 가져오기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		// map 객체 생성
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		// map 객체에 값넣기
		parameterMap.put("mem_num", mem_num);
		parameterMap.put("board_num", board_num);
		
		// 추천비추천 테이블에 데이터 삭제
		sqlSession.delete("trailer.deletegood", parameterMap);
		
		// 추천 가져오기
		int board_good = sqlSession.selectOne("trailer.getTrailerGood", board_num);
		// 비추천 가져오기
		int board_bad = sqlSession.selectOne("trailer.getTrailerbad", board_num);
		
		board.setBoard_good(board_good);
		board.setBoard_bad(board_bad);

		return board;
	}
	
	// 예고편 비추
	public BoardVO badtrailer(HttpServletRequest request, HttpServletResponse response) {
		BoardVO board = new BoardVO();
		
		// 세션에서 로그인한 계정의 정보 받아오기
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		// 회원번호 가져오기
		int mem_num = member.getMem_num();
		
		// 글번호 가져오기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		// map 객체 생성
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		// map 객체에 값넣기
		parameterMap.put("mem_num", mem_num);
		parameterMap.put("board_num", board_num);
		
		// 좋아요싫어요 테이블에 데이터 삽입
		sqlSession.insert("trailer.insertbad", parameterMap);
		
		board.setBoard_bad(sqlSession.selectOne("trailer.getTrailerbad", board_num));
		
		return board;
		
	}
	
	// 예고편 비추 취소
	public BoardVO nobadtrailer(HttpServletRequest request, HttpServletResponse response) {
		// 갱신될 추천, 비추천 값을 받을 board객체 생성
		BoardVO board = new BoardVO();
		// 세션에서 로그인한 계정의 정보 받아오기
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		// 회원번호 가져오기
		int mem_num = member.getMem_num();
		
		// 글번호 가져오기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		// map 객체 생성
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		// map 객체에 값넣기
		parameterMap.put("mem_num", mem_num);
		parameterMap.put("board_num", board_num);
		
		// 추천비추천 테이블에 데이터 삭제
		sqlSession.delete("trailer.deletebad", parameterMap);
		
		// 추천 가져오기
		int board_good = sqlSession.selectOne("trailer.getTrailerGood", board_num);
		// 비추천 가져오기
		int board_bad = sqlSession.selectOne("trailer.getTrailerbad", board_num);
		
		board.setBoard_good(board_good);
		board.setBoard_bad(board_bad);

		return board;
	}
	// 예고편 좋아요 눌렀는지 확인
	public int checkTrailerGood(int board_num, int mem_num) {
		// map 객체 생성
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		// map 객체에 값넣기
		parameterMap.put("mem_num", mem_num);
		parameterMap.put("board_num", board_num);
		
		return sqlSession.selectOne("trailer.checkTrailerGood", parameterMap);
	}
	
	// 예고편 좋아요 눌렀는지 확인
	public int checkTrailerBad(int board_num, int mem_num) {
		// map 객체 생성
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		// map 객체에 값넣기
		parameterMap.put("mem_num", mem_num);
		parameterMap.put("board_num", board_num);
		
		return sqlSession.selectOne("trailer.checkTrailerBad", parameterMap);
	}

	// 댓글새로고침 할 때 게시글정보 같이 긁어오기
	public BoardVO getTrailerDetailAtReply(int board_num) {
		return sqlSession.selectOne("trailer.getTrailerDetailAtReply", board_num);
	}

	// 게시판 검색 결과값의 수 
	public int getSearchListCount(Map<String, Object> paraMap) {
		return sqlSession.selectOne("trailer.getSearchListCount", paraMap);
	}

	// 게시판 검색 결과 리스트
	public List<BoardVO> getSearchBoardList(Map<String, Object> paraMap) {
		return sqlSession.selectList("trailer.getSearchList", paraMap);
	}

	// 예고편 수정
	public void updateTrailer(BoardVO board) {
		
		sqlSession.update("trailer.updateTrailer", board);
	}

	// 예고편 삭제
	public void deleteTrailer(int board_num) {
		sqlSession.update("trailer.deleteTrailer", board_num);
	}
	
}
