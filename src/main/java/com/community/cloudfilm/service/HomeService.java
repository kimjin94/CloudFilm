package com.community.cloudfilm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.HomeDAO;
import com.community.cloudfilm.model.BoardVO;

@Service
public class HomeService {
	@Autowired
	private HomeDAO homeDAO;

	//한번에 출력할 글 갯수
	private int limit = 5;
	
	// 최근 리뷰 가져오기
	public Map<String, Object> getreviewlist(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> reviewlist = new ArrayList<BoardVO>();
		
		reviewlist = homeDAO.getreviewlist(limit); // 리스트를 받아옴.

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("reviewlist", reviewlist);
		
		return resultMap;
	}

	// 최근 추천 가져오기
	public Map<String, Object> getrecommendlist(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> recommendlist = new ArrayList<BoardVO>();

		recommendlist = homeDAO.getrecommendlist(limit); // 리스트를 받아옴.

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("recommendlist", recommendlist);
		
		return resultMap;
	}

	// 최근 예고편 가져오기
	public Map<String, Object> gettrailerlist(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> trailerlist = new ArrayList<BoardVO>();

		trailerlist = homeDAO.gettrailerlist(limit); // 리스트를 받아옴.

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("trailerlist", trailerlist);
		
		return resultMap;
	}
}
