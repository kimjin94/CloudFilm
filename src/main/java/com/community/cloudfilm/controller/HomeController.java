package com.community.cloudfilm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.service.HomeService;

@Controller
public class HomeController {
	
		@Autowired
		private HomeService homeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 홈페이지로 이동
	@RequestMapping(value = "/home")
	public ModelAndView homeM(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView homeM = new ModelAndView("home/home");
		
		// 최근 리뷰 가져오기
		Map<String, Object> reviewlist = homeService.getreviewlist(request, response);
		
		// 최근 추천 가져오기
		Map<String, Object> recommendlist = homeService.getrecommendlist(request, response);
		
		// 최근 예고편 가져오기
		Map<String, Object> trailerlist = homeService.gettrailerlist(request, response);
		
		homeM.addAllObjects(reviewlist);
		homeM.addAllObjects(recommendlist);
		homeM.addAllObjects(trailerlist);
		
		return homeM;
	}
}

