package com.community.cloudfilm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.service.HomeService;

@Controller
public class HomeController {
	
		@Autowired
		private HomeService HomeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 홈페이지로 이동
	@RequestMapping(value = "/home")
	public String home() {
		return "home/home";
	}
	
	/*
	 * // 홈페이지용 리뷰 인기글 불러오기
	 * 
	 * @RequestMapping(value ="/home") public String home_Review(HttpServletRequest
	 * request, BoardVO board, Model model) throws Exception {
	 * System.out.println("리뷰 목록 컨트롤 확인");
	 * System.out.println(request.getParameter("board_filter"));
	 * System.out.println(request.getParameter("search"));
	 * 
	 * List<BoardVO> home_reviewlist = new ArrayList<BoardVO>();
	 * 
	 * int page = 1; int limit = 5;
	 * 
	 * if(request.getParameter("page") != null) { page =
	 * Integer.parseInt(request.getParameter("page")); }
	 * 
	 * int listcount=0;
	 * 
	 * if(request.getParameter("board_filter") == null) { // 총리스트 불러오기 listcount =
	 * HomeService.getListCount(); // 페이지번호(page)를 DAO클래스에 전달한다. home_reviewlist =
	 * HomeService.getHome_reviewlist(page); // 리스트 불러오기 }else
	 * if(request.getParameter("board_filter") != null){
	 * 
	 * 
	 * }
	 * 
	 * return null; }
	 */
}
