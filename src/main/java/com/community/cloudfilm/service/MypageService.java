package com.community.cloudfilm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.MypageDAO;
import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.model.GoodAndBadVO;
import com.community.cloudfilm.model.MemberVO;
import com.community.cloudfilm.model.ReplyVO;

@Service
public class MypageService {
	
	@Autowired
	private MypageDAO mypageDAO;

	//내가 쓴 글 리스트
	public Map<String, Object> getmyWritingList(HttpServletRequest request, HttpServletResponse response,
												HttpSession session) {
		List<BoardVO> mywritinglist = new ArrayList<BoardVO>();
		
		int page= 1;
		int limit =10;	//한 화면에 출력할 글 수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Map<String, Object> indexmMap = new HashMap<String, Object>();
		
		//멤버 세션불러오기
		MemberVO member =(MemberVO)session.getAttribute("member");
		int mem_num = member.getMem_num();
				
		
		indexmMap.put("page", page);
		indexmMap.put("mem_num",mem_num);
		
		//총 리스트 수를 받아옴
		int listcount = mypageDAO.getListCount(mem_num);
		System.out.println(listcount);
		
		//페이지 번호(page)를 DAO클래스에게 전달한다.
		mywritinglist = mypageDAO.getBoardList(indexmMap);//리스트 받아옴
		
		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("page", page);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("mywritinglist", mywritinglist);
		
		return resultMap;
	}

	public Map<String, Object> getmyReplyList(HttpServletRequest request, HttpServletResponse response,
											HttpSession session) {
		List<ReplyVO> myreplylist = new ArrayList<ReplyVO>();
		
		int page = 1;
		int limit =10;	//한 화면에 출력한 댓글 수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> indexMap = new HashMap<String, Object>();
		
		//멤버 세션불러오기
		MemberVO member =(MemberVO)session.getAttribute("member");
		int mem_num = member.getMem_num();
		
		indexMap.put("page", page);
		indexMap.put("mem_num", mem_num);
		
		//총리스트 수를 받아옴
		int listcount = mypageDAO.getReplyListCount(mem_num);
		//페이지 번호를 dao클래스에게 전달한다.
		myreplylist = mypageDAO.getReplyList(indexMap);
		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("page", page);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("myreplylist", myreplylist);
		
		return resultMap;
	}
	//내가 좋아요한 글 리스트
	public Map<String, Object> getmyGoodList(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		
		List<GoodAndBadVO> mygoodlist = new ArrayList<GoodAndBadVO>();
		
		int page = 1;
		int limit =10;
		
		if(request.getParameter("page") != null) {
			page= Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> indexMap = new HashMap<String, Object>();
		
		//멤버 세션불러오기
		MemberVO member =(MemberVO)session.getAttribute("member");
		int mem_num = member.getMem_num();
		
		indexMap.put("page", page);
		indexMap.put("mem_num", mem_num);
		
		//총리스트 수를 받아옴
		int listcount = mypageDAO.getGoodListCount(mem_num);
		//페이지 번호를 dao클래스에게 전달한다.
		mygoodlist = mypageDAO.getGoodList(indexMap);
		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("page", page);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("mygoodlist", mygoodlist);
		
		return resultMap;
	}
}
