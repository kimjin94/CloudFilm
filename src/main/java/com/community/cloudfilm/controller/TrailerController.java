package com.community.cloudfilm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.service.TrailerService;

@Controller
public class TrailerController {
	@Autowired
	private TrailerService trailerService;
	
	// 예고편 게시판으로 이동
	@RequestMapping(value = "/trailerlist")
	public ModelAndView trailerlist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView trailerlistM = new ModelAndView("trailer/trailerlist");
		
		// 예고편 리스트 받아오기
		Map<String, Object> trailerlist = trailerService.getTrailerList(request, response);

		trailerlistM.addAllObjects(trailerlist);
		
		return trailerlistM;
	}
	
	// 예고편 글쓰기폼으로 이동
	@RequestMapping(value = "/writeTrailerForm")
	public String writeTrailerForm() throws Exception{
		
		return "trailer/trailerwritefrom";
	}
	
	// 예고편 글작성하기
	@RequestMapping(value = "/writeTrailer")
	public String writeTrailer(BoardVO board) throws Exception{
		trailerService.insertTrailer(board);
		
		return "redirect:trailerlist";
	}
	
	// 예고편 상세봅기
	@RequestMapping(value = "/trailerDetail")
	public ModelAndView trailerDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView trailerdetailM = new ModelAndView("trailer/trailerdetail");
		
		Map<String, Object> board = trailerService.getTrailerDetail(request, response);
		
		trailerdetailM.addAllObjects(board);
		
		return trailerdetailM;
	}
	
	// 예고편 추천
	@RequestMapping(value = "/trailergood")
	public ModelAndView trailergood(HttpServletRequest request, HttpServletResponse response) {
		
		BoardVO board = trailerService.goodtrailer(request, response);
		
		ModelAndView trailergoodM = new ModelAndView("trailer/ajax/trailergood");
		
		trailergoodM.addObject("board", board);
		
		return trailergoodM;
	}
	
	// 예고편 추천 취소
	@RequestMapping(value = "/trailernogood")
	public ModelAndView trailernogood(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("컨트롤러");
		BoardVO board = trailerService.nogoodtrailer(request, response);
		
		ModelAndView trailergoodandbadM = new ModelAndView("trailer/ajax/trailergoodandbad");
		
		trailergoodandbadM.addObject("board", board);
		
		return trailergoodandbadM;
	}
	
	// 예고편 비추
	@RequestMapping(value = "/trailerbad")
	public ModelAndView trailerbad(HttpServletRequest request, HttpServletResponse response) {
		
		BoardVO board = trailerService.badtrailer(request, response);
		
		ModelAndView trailerbadM = new ModelAndView("trailer/ajax/trailerbad");
		
		trailerbadM.addObject("board", board);
		
		return trailerbadM;
	}
	
	// 예고편 비추 취소
	@RequestMapping(value = "/trailernobad")
	public ModelAndView trailernobad(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("컨트롤러");
		BoardVO board = trailerService.nobadtrailer(request, response);
		
		ModelAndView trailergoodandbadM = new ModelAndView("trailer/ajax/trailergoodandbad");
		
		trailergoodandbadM.addObject("board", board);
		
		return trailergoodandbadM;
	}

}