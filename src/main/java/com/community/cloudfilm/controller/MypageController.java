package com.community.cloudfilm.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.model.MemberVO;
import com.community.cloudfilm.service.MemberService;
import com.community.cloudfilm.service.MypageService;
import com.community.cloudfilm.service.ReviewService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	
	//마이페이지 메인
	@RequestMapping(value="myPage")
	public String mypage(HttpSession session,Model model) {

		MemberVO mypagemember = (MemberVO)session.getAttribute("member");
		MemberVO member = memberService.getmemberinfo(mypagemember.getMem_num());
		
		model.addAttribute("member", member);
		
		return "mypage/myPage";
	}
	//마이페이지 고정폼
	@RequestMapping(value="/mypageProfile")
	public String myhome(HttpSession session,Model model) {
		
		MemberVO mypagemember = (MemberVO)session.getAttribute("member");
		MemberVO member = memberService.getmemberinfo(mypagemember.getMem_num());
		
		model.addAttribute("member", member);
		
		return "layout/mypageProfile";
	}

	//내가 쓴 글
	@RequestMapping(value="myWritingList")
	public ModelAndView myWritingList(HttpServletRequest request,HttpServletResponse response,
									  HttpSession session) {
		
		ModelAndView mywritinglistM = new ModelAndView("mypage/myWritingList");
		
		//내가 쓴 글 리스트 받아오기
		Map<String, Object> mywritinglist = mypageService.getmyWritingList(request,response,session);
		
		mywritinglistM.addAllObjects(mywritinglist);
		
		return mywritinglistM;
	}
	//내가 쓴 댓글
	@RequestMapping(value="myReplyList")
	public ModelAndView myReplyList(HttpServletRequest request,HttpServletResponse response,
									HttpSession session) {
		
		ModelAndView myreplylistM = new ModelAndView("mypage/myReplyList");
		
		//내가 쓴 댓글 리스트 받아오기
		Map<String, Object> myreplylist = mypageService.getmyReplyList(request,response,session);
		
		myreplylistM.addAllObjects(myreplylist);
		return myreplylistM;
	}
	//내가 좋아요한 글
	@RequestMapping(value="myGoodList")
	public ModelAndView myGoodList(HttpServletRequest request, HttpServletResponse response,
									HttpSession session) {
		
		ModelAndView mygoodlistM = new ModelAndView("mypage/myGoodList");
		
		//내가 좋아요한 글 리스트 받아오기
		Map<String, Object> mygoodlist = mypageService.getmyGoodList(request,response,session);
		
		mygoodlistM.addAllObjects(mygoodlist);
		return mygoodlistM;
	}
	
	//글들 상세보기
	@RequestMapping(value="MyBoard_cont")
	public String MyBoard_cont(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int board_num =Integer.parseInt(request.getParameter("board_num"));
		int page =1;
		//게시글 상세정보 가져오기
		BoardVO board = reviewService.getReviewCont(board_num);
		String index ="";
		if(board.getCate_num()  == 1 ) {
			index = "review_cont";
		}else if(board.getCate_num() == 2) {
			index ="recommend_cont";
		}else if(board.getCate_num() ==3) {
			index = "trailerDetail";
		}
		
		return "redirect:"+index+"?page="+page+"&board_num="+board_num;
	}
}
