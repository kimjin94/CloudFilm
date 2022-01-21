package com.community.cloudfilm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.service.MypageService;
import com.community.cloudfilm.service.ReviewService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private ReviewService reviewService;

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
	public String myReplyList( ) {
		
		return "mypage/myReplyList";
	}
}
