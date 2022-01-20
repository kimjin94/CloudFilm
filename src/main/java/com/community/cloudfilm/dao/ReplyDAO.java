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
		String re_cont = request.getParameter("re_cont");
		
		Map<String, Object> parameterMAP = new HashMap<String, Object>();
		
		parameterMAP.put("board_num", board_num);
		parameterMAP.put("mem_num", mem_num);
		parameterMAP.put("re_cont", re_cont);
		
		sqlSession.insert("replyMapper.insertreply", parameterMAP);
	}

	public List<ReplyVO> getReplyList(int board_num) throws Exception{
		return sqlSession.selectList("replyMapper.selectReplyList", board_num);
	}
	
}
