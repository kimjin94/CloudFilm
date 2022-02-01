package com.community.cloudfilm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.HomeDAO;
import com.community.cloudfilm.model.BoardVO;

@Service
public class HomeService {
	@Autowired
	private HomeDAO HomeDAO;
	
	//게시글 갯수
		public int getListCount()throws Exception {
			return HomeDAO.getListCount();
		}
	
	// 글목록
	public List<BoardVO> getHome_reviewlist(int page) throws Exception{
		System.out.println("리뷰목록 확인용 서비스");
		return HomeDAO.getHome_reviewlist(page);
	}
}
