package com.community.cloudfilm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSession sqlSession;

	//내가 쓴 글 갯수 가져오기
	public int getListCount(int mem_num) {
		return sqlSession.selectOne("mypageMapper.boardlist_count",mem_num);
	}
	//내가 쓴 글 리스트 가져오기
	public List<BoardVO> getBoardList(Map<String, Object> indeXMap) {
		return sqlSession.selectList("mypageMapper.board_list",indeXMap);
	}
}
