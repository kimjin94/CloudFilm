package com.community.cloudfilm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.service.RecommendService;
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
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 홈페이지로 이동
	@RequestMapping(value = "/home")
	public String home() {
		return "home/home";
	}
	
}

