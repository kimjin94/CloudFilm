package com.community.cloudfilm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.model.ReplyVO;
import com.community.cloudfilm.service.ReplyService;
import com.community.cloudfilm.service.TrailerService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	@Autowired
	private TrailerService trailerService;
	
	// 댓글 작성
   @RequestMapping(value = "/replywrite")
   public String replywrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
      int page = Integer.parseInt(request.getParameter("page"));
      int board_num = Integer.parseInt(request.getParameter("board_num"));
      
      // 게시글 상세정보 가져오기
      BoardVO board = trailerService.getTrailerDetailAtReply(board_num);
      
      String index = "";
      if(board.getCate_num() == 1) {
         index = "review_cont";
      }else if(board.getCate_num() == 2) {
         index = "recommend_cont";
      }else if(board.getCate_num() == 3) {
         index = "trailerDetail";
      }
      
      replyService.replywrite(request, response);
      
      return "redirect:"+index+"?page="+page+"&board_num="+board_num;
	   }
	
	// 댓글 수정폼으로 이동
	@RequestMapping(value = "/replyUpdateForm")
	public ModelAndView replyUpdateForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView updateReplyFormM = new ModelAndView("reply/ajax/updatereplyform");
		
		ReplyVO reply = replyService.getReply(request, response);
		
		updateReplyFormM.addObject("reply", reply);
		
		return updateReplyFormM;
	}
	
	// 댓글 수정
	@RequestMapping(value = "/replyUpdate")
	public ModelAndView replyUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView updateReplyM = new ModelAndView("reply/ajax/updatereply");
		
		// 댓글 상세정보 가져오기
		ReplyVO reply = replyService.updatereply(request, response);
		
		// 게시글 상세정보 가져오기
		BoardVO board = trailerService.getTrailerDetailAtReply(reply.getBoard_num());
		
		updateReplyM.addObject("reply", reply);
		updateReplyM.addObject("board", board);
		 
		return updateReplyM;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/deleteReply")
	public ModelAndView deleteReply(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView deleteReplyM = new ModelAndView("reply/ajax/updatereply");
		
		// 댓글 삭제하기
		ReplyVO reply = replyService.deleteReply(request, response);
		
		deleteReplyM.addObject("reply", reply);
		
		return deleteReplyM;
	}
	

}
