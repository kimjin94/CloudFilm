package com.community.cloudfilm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// 댓글 달기
	public void replywrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		System.out.println("mem_num : " + mem_num);
		String re_cont = request.getParameter("re_cont");
		
		Map<String, Object> parameterMAP = new HashMap<String, Object>();
		
		parameterMAP.put("board_num", board_num);
		parameterMAP.put("mem_num", mem_num);
		parameterMAP.put("re_cont", re_cont);
		
		sqlSession.insert("replyMapper.insertreply", parameterMAP);
	}

	// 댓글목록 불러오기
	public List<ReplyVO> getReplyList(int board_num) throws Exception{
		return sqlSession.selectList("replyMapper.selectReplyList", board_num);
	}

	// 댓글 정보 가져오기
	public ReplyVO getReply(int re_num) {
		return sqlSession.selectOne("replyMapper.selectReply", re_num);
	}

	// 댓글 수정하기
	public ReplyVO udpatereply(HttpServletRequest request, HttpServletResponse response) {
		int re_num = Integer.parseInt(request.getParameter("re_num"));
		String re_cont = request.getParameter("re_contupdate");
		
		System.out.println(re_num);
		System.out.println(re_cont);
		
		Map<String, Object> parameterMAP = new HashMap<String, Object>();
		
		parameterMAP.put("re_num", re_num);
		parameterMAP.put("re_cont", re_cont);
		
		sqlSession.insert("replyMapper.udpateReply", parameterMAP);
		
		return sqlSession.selectOne("replyMapper.selectReply", re_num);
	}

	public ReplyVO deleteReply(HttpServletRequest request, HttpServletResponse response) {
		
		int re_num = Integer.parseInt(request.getParameter("re_num"));
		sqlSession.update("replyMapper.deleteReply", re_num);
		
		return sqlSession.selectOne("replyMapper.selectReply", re_num);
	}
	
}
