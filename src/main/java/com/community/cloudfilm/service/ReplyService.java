package com.community.cloudfilm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.ReplyDAO;
import com.community.cloudfilm.model.ReplyVO;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;

	// 댓글 작성
	public void replywrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
		replyDAO.replywrite(request, response);
	}

	// 댓글 리스트 불러오기
	public Map<String, Object> getReplyList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		List<ReplyVO> replylist = replyDAO.getReplyList(board_num);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("replylist", replylist);
		
		return resultMap;
	}

}
