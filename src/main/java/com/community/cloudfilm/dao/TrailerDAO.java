package com.community.cloudfilm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;

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

	public BoardVO getBoardDetail(int board_num) {
		return sqlSession.selectOne("trailer.getBoardDetail", board_num);
	}

}
