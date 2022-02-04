package com.community.cloudfilm.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.service.AdminService;
import com.community.cloudfilm.service.ReplyService;
import com.community.cloudfilm.service.TrailerService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private TrailerService trailerService;
	@Autowired
	private ReplyService replyService;
	
	// 관리자페이지 메인
	@RequestMapping(value = "adminhome")
	public ModelAndView adminhome(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView adminhomeM = new ModelAndView("admin/adminhome");
		
		// 최근 리뷰 가져오기
		Map<String, Object> reviewlist = adminService.getreviewlist(request, response);
		
		// 최근 추천 가져오기
		Map<String, Object> recommendlist = adminService.getrecommendlist(request, response);
		
		// 최근 예고편 가져오기
		Map<String, Object> trailerlist = adminService.gettrailerlist(request, response);
		
		adminhomeM.addAllObjects(reviewlist);
		adminhomeM.addAllObjects(recommendlist);
		adminhomeM.addAllObjects(trailerlist);
		
		return adminhomeM;
	}
	
	// 게시판관리 리스트 보기
	@RequestMapping(value = "boardManagement")
	public ModelAndView boardManagement(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView boardManagementM = new ModelAndView("admin/boardManagement");
		// 모든 게시판글 가져오기
		Map<String, Object> boardlist = adminService.getboardlist(request, response);
		
		boardManagementM.addAllObjects(boardlist);
		
		return boardManagementM;
	}
	
	// 게시판관리 - 게시판 정지 / 복구
	@RequestMapping(value = "adminBoardYN")
	public String adminBoardYN(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int cate_num = Integer.parseInt(request.getParameter("cate_num"));
		String board_yn  = request.getParameter("board_yn");
		String search = request.getParameter("search");
		
		// redirect로 값을 넘길때 인코딩타입을 설정해줘야함
		String keyword  = URLEncoder.encode(request.getParameter("keyword"), "UTF-8");
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		System.out.println(keyword);
		adminService.setBoardYN(request, response);
		
		return "redirect:boardManagement?page="+page+"&cate_num="+cate_num+"&board_yn="+board_yn+"&search="+search+"&keyword="+keyword;
	}
	
	// 회원관리 리스트출력
	@RequestMapping(value = "memberManagement")
	public ModelAndView memberManagement(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView memberManagementM = new ModelAndView("admin/memberManagement");
		
		// 모든 회원정보 가져오기
		Map<String, Object> memberlist = adminService.getmemberlist(request, response);
		
		memberManagementM.addAllObjects(memberlist);
		

		return memberManagementM;
	}
	
	// 회원관리 - 회원 정지
	@RequestMapping(value = "adminMemberYN")
	public String adminMemberYN(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String mem_yn  = request.getParameter("mem_yn");
		String search = request.getParameter("search");
		
		// redirect로 값을 넘길때 인코딩타입을 설정해줘야함
		String keyword  = URLEncoder.encode(request.getParameter("keyword"), "UTF-8");
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		System.out.println(keyword);
		adminService.setMemberYN(request, response);
		
		return "redirect:memberManagement?page="+page+"&mem_yn="+mem_yn+"&search="+search+"&keyword="+keyword;
	}
	
	// 공지관리
	@RequestMapping(value = "infoManagement")
	public ModelAndView infoManagement(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView infoManagementM = new ModelAndView("admin/infoManagement");
		
		// 공지 정보 가져오기
		Map<String, Object> infolist = adminService.getinfolist(request, response);
		
		infoManagementM.addAllObjects(infolist);
		
		return infoManagementM;
	}
	
	// 공지 작성폼으로 이동
	@RequestMapping(value = "writeinfoForm")
	public String writeinfoForm() {
		return "admin/writeinfoForm";
	}
	
	// 공지 작성
	@RequestMapping(value = "writeInfo")
	public String writeInfo(BoardVO board, HttpServletRequest request, HttpServletResponse response) throws Exception{
		adminService.writeInfo(board, request, response);
		
		return "redirect:infoManagement";
	}
	
	// 공지 상세보기
	@RequestMapping(value = "infoDetail")
	public ModelAndView infoDetail(HttpServletRequest request, HttpServletResponse response)throws Exception{
		ModelAndView infodetaillM = new ModelAndView("admin/infodetail");
		
		// 게시글 상세정보 가져오기
		Map<String, Object> board = trailerService.getTrailerDetail(request, response);
		
		// 댓글 리스트 가져오기
		Map<String, Object> replylist = replyService.getReplyList(request, response);
		
		infodetaillM.addAllObjects(replylist);
		infodetaillM.addAllObjects(board);
		
		
		return infodetaillM;
	}
	
	// 예고편 수정폼으로 이동
	@RequestMapping(value = "/infoUpdateForm")
	public ModelAndView infoUpdateForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView trailerUpdateFormM = new ModelAndView("admin/infoupdateform");
		
		// 게시글 상세정보 가져오기
		Map<String, Object> board = trailerService.getTrailerDetail(request, response);
	
		trailerUpdateFormM.addAllObjects(board);
		
		return trailerUpdateFormM;
	}
	
	
	// 공지 수정하기
	@RequestMapping(value = "/updateInfo")
	public String updateInfo(BoardVO board, @RequestParam("page") String page) {
		
		// 예고편 수정하기
		adminService.updateInfo(board);
		
		return "redirect:infoManagement?page="+page;
	}
	
	// 공지 삭제하기
	@RequestMapping(value = "/infoDelete")
	public String infotrailerDelete(@RequestParam("board_num") int board_num, @RequestParam("page") String page) {
		
		// 예고편 삭제하기
		adminService.deleteInfo(board_num);
		
		return "redirect:infoManagement?page="+page;
	}
	
	// 공지 정지
	@RequestMapping(value = "infoYN")
	public String infoYN(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int cate_num = Integer.parseInt(request.getParameter("cate_num"));
		String board_yn  = request.getParameter("board_yn");
		String search = request.getParameter("search");
		
		// redirect로 값을 넘길때 인코딩타입을 설정해줘야함
		String keyword  = URLEncoder.encode(request.getParameter("keyword"), "UTF-8");
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		System.out.println(keyword);
		adminService.setBoardYN(request, response);
		
		return "redirect:infoManagement?page="+page+"&cate_num="+cate_num+"&board_yn="+board_yn+"&search="+search+"&keyword="+keyword;
	}

}
