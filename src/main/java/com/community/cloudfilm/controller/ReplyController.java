package com.community.cloudfilm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.cloudfilm.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	
	// 댓글 작성
	@RequestMapping(value = "/replywrite")
	public String replywrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int page = Integer.parseInt(request.getParameter("page"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		replyService.replywrite(request, response);
		
		return "redirect:trailerDetail?page="+page+"&board_num="+board_num;
	}

}
