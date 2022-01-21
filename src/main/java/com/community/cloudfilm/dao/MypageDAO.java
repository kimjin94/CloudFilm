package com.community.cloudfilm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSession sqlSession;

	//내가 쓴 글 갯수 가져오기
	public int getListCount() {
		return sqlSession.selectOne("mypageMapper.boardlist_count");
	}
	//내가 쓴 글 리스트 가져오기
	public List<BoardVO> getBoardList(int page) {
		return sqlSession.selectList("mypageMapper.board_list",page);
	}
}
