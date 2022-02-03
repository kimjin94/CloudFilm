package com.community.cloudfilm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.service.MemberService;
import com.community.cloudfilm.service.RecommendService;
import com.community.cloudfilm.service.ReplyService;
import com.community.cloudfilm.service.ReviewService;
import com.community.cloudfilm.service.TrailerService;

@Controller
public class HomeController {
	
		@Autowired
		private ReviewService reviewService;
		@Autowired
		private RecommendService recommendService;
		@Autowired
		private TrailerService trailerService;
		@Autowired
		private MemberService memberService;
		@Autowired
		private ReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 홈페이지로 이동
	@RequestMapping(value = "/home")
	public String home() {
		return "home/home";
	}
	
	
	  // 홈페이지용 리뷰 인기글 불러오기
	  
	//리뷰게시판 목록
		@RequestMapping(value = "/home")
		public String review_list(HttpServletRequest request,BoardVO board, Model model)throws Exception {
			System.out.println("리뷰리스트 컨");
			System.out.println(request.getParameter("board_filter"));
			
			List<BoardVO> reviewlist = new ArrayList<BoardVO>();
			
			int page = 1;
			int limit = 5;	//한화면에 출력할 레코드 수
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			int listcount = 0;
			
			
			if(request.getParameter("board_filter") == null) {
				//총 리스트 수를 받아옴
				listcount = reviewService.getListCount();
				//페이지 번호(page)를 DAO클래스에게 전달한다.
				reviewlist = reviewService.getReviewList(page);	//리스트 받아오기
			}else if(request.getParameter("board_filter") != null){
				String board_filter = request.getParameter("board_filter");
				
				Map<String, Object> indexMap = new HashMap<String, Object>();
				
				indexMap.put("page", page);
				indexMap.put("board_filter", board_filter);
				
				//총 리스트 수를 받아옴
				listcount = reviewService.getFilterListCount(board_filter);
				System.out.println(listcount);
				//페이지 번호(page)를 DAO클래스에게 전달한다.
				reviewlist = reviewService.getFilterReviewList(indexMap);	//리스트 받아오기
				
				model.addAttribute("board_filter", board_filter);
			}
			
			//총 페이지 수
			int maxpage = (int) ((double) listcount / limit + 0.95); //0.95더해서 올림처리
			
			//현재 페이지에 보요줄 시작 페이지수 (1,21,41..)
			int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			
			System.out.println(page);
			System.out.println(startpage);
			//현재 페이지에 보여줄 마지막 페이지 수(20,40,60...)
			int endpage = maxpage;
			
			if(endpage > startpage + 10 -1)
				endpage = startpage + 10 -1;
			
			model.addAttribute("page", page);
			
			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			model.addAttribute("maxpage", maxpage);
			model.addAttribute("listcount", listcount);
			model.addAttribute("reviewlist", reviewlist);
			
			return "home/home";
		}
		//추천게시판 목록
		@RequestMapping(value = "/home")
		public String recommend_list(HttpServletRequest request,BoardVO board, Model model)throws Exception {
			System.out.println("추천리스트 컨");
			System.out.println(request.getParameter("board_filter"));
			
			List<BoardVO> recommendlist = new ArrayList<BoardVO>();
			
			int page = 1;
			int limit = 5;	//한화면에 출력할 레코드 수
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			int listcount = 0;
			
			
			if(request.getParameter("board_filter") == null) {
				//총 리스트 수를 받아옴
				listcount = recommendService.getListCount();
				//페이지 번호(page)를 DAO클래스에게 전달한다.
				recommendlist = recommendService.getRecommendList(page);	//리스트 받아오기
			}else if(request.getParameter("board_filter") != null){
				String board_filter = request.getParameter("board_filter");
				
				Map<String, Object> indexMap = new HashMap<String, Object>();
				
				indexMap.put("page", page);
				indexMap.put("board_filter", board_filter);
				
				//총 리스트 수를 받아옴
				listcount = recommendService.getFilterListCount(board_filter);
				System.out.println(listcount);
				//페이지 번호(page)를 DAO클래스에게 전달한다.
				recommendlist = recommendService.getFilterRecommendList(indexMap);	//리스트 받아오기
				
				model.addAttribute("board_filter", board_filter);
			}
			
			//총 페이지 수
			int maxpage = (int) ((double) listcount / limit + 0.95); //0.95더해서 올림처리
			
			//현재 페이지에 보요줄 시작 페이지수 (1,21,41..)
			int startpage = (((int) ((double) page / 20 + 0.95)) - 1) * 20 + 1;
			
			System.out.println(page);
			System.out.println(startpage);
			//현재 페이지에 보여줄 마지막 페이지 수(20,40,60...)
			int endpage = maxpage;
			
			if(endpage > startpage + 20 -1)
				endpage = startpage + 20 -1;
			
			model.addAttribute("page", page);
			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			model.addAttribute("maxpage", maxpage);
			model.addAttribute("listcount", listcount);
			model.addAttribute("recommendlist", recommendlist);
			
			return "home/home";
		}
		@RequestMapping(value = "/home")
		public ModelAndView trailerlist(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			ModelAndView trailerlistM = new ModelAndView("home/home");
			
			// 예고편 리스트 받아오기
			Map<String, Object> trailerlist = trailerService.getTrailerList(request, response);

			trailerlistM.addAllObjects(trailerlist);
			
			return trailerlistM;
		}
}

