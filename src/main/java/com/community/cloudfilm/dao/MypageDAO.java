package com.community.cloudfilm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.model.GoodAndBadVO;
import com.community.cloudfilm.model.ReplyVO;

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
	//내가 쓴 댓글 갯수 가져오기
	public int getReplyListCount(int mem_num) {
		return sqlSession.selectOne("mypageMapper.replylist_count", mem_num);
	}
	//내가 쓴 글 리스트 가져오기
	public List<ReplyVO> getReplyList(Map<String, Object> indexMap) {
		return sqlSession.selectList("mypageMapper.reply_list", indexMap);
	}
	//내가 좋아요한 글 갯수 가져오기
	public int getGoodListCount(int mem_num) {
		return sqlSession.selectOne("mypageMapper.goodlist_count", mem_num);
	}
	//내가 좋아욯한 글 리스트 가져오기
	public List<GoodAndBadVO> getGoodList(Map<String, Object> indexMap) {
		return sqlSession.selectList("mypageMapper.good_list", indexMap);
	}
}
