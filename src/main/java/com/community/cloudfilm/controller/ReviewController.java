package com.community.cloudfilm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.community.cloudfilm.model.BoardVO;
import com.community.cloudfilm.model.MemberVO;
import com.community.cloudfilm.service.MemberService;
import com.community.cloudfilm.service.ReplyService;
import com.community.cloudfilm.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReplyService replyService;
	
	
	//리뷰 작성폼
	@RequestMapping(value="/review_write")
	public String review_write(BoardVO Board) {
		return "review/review_write";
	}
	//리뷰작성 저장
	@RequestMapping(value = "/review_writing")
	public String review_writing(@RequestParam("board_img1") MultipartFile mf,
								HttpServletRequest request,HttpSession session,
								MemberVO member,BoardVO board) throws Exception{
		
		if (!mf.isEmpty()) {
	         //첨부파일 저장
	         UUID uuid = UUID.randomUUID();
	         String filename = uuid + mf.getOriginalFilename();
	         int size = (int) mf.getSize();
	         String path = request.getRealPath("resources/images/reviewimage");
	         int result = 0;
	         String file[] = new String[2];

        // 첨부파일 저장 체크
//	         if (filename != "") {
//	            StringTokenizer st = new StringTokenizer(filename, ".");
//	            file[0] = st.nextToken();
//	            file[1] = st.nextToken(); // 확장자
//
//	            // 사이즈가 10mb 이상인경우
//	            if (size > 10000000) {
//	               result = 1;
//	               model.addAttribute("result", result);
//
//	               return "";
//
//	            //  
//	            } else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png") && !file[1].equals("pdf")) {
//
//	               result = 2;
//	               model.addAttribute("result", result);
//
//	               return "";
//	            }
//	         }

	         // 첨부파일이 전송된 경우
	         if (size > 0) {
	            mf.transferTo(new File(path + "/" + filename));
	         }

	         board.setBoard_img(filename);
	         System.out.println(path);
	      }
		
		
		System.out.println(board.getBoard_num());
		System.out.println(board.getBoard_title());
		System.out.println(board.getBoard_filter());
		System.out.println(board.getBoard_cont());
		System.out.println(board.getMem_id());
		
		// 현제 세션에 있는(로그인 한 member의 정보) mem_num값 가져오기
		MemberVO reviewmember = (MemberVO)session.getAttribute("member");
		int mem_num = reviewmember.getMem_num();
		String mem_id =	reviewmember.getMem_id();
		board.setMem_id(mem_id);
		board.setMem_num(mem_num);
		
		reviewService.insertReview(board);
		
		return "redirect:/review_list";
	}
	//리뷰게시판 목록
	@RequestMapping(value = "/review_list")
	public String review_list(HttpServletRequest request,BoardVO board, Model model)throws Exception {
		System.out.println("리뷰리스트 컨");
		System.out.println(request.getParameter("board_filter"));
		
		List<BoardVO> reviewlist = new ArrayList<BoardVO>();
		
		int page = 1;
		int limit = 10;	//한화면에 출력할 레코드 수
		
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
		
		return "review/review_list";
	}
	//리뷰게시판 원글내용폼
	@RequestMapping(value="review_cont")
	public String review_cont(@RequestParam("board_num") int board_num,
							  @RequestParam("page") String page,
							  HttpServletRequest request, HttpServletResponse response,
							  Model model)throws Exception {
		//조회수 증가
		reviewService.hit(board_num);
		
		BoardVO review = reviewService.getReviewCont(board_num);
		
		int checkTrailerGood = 0;
		int checkTrailerBad = 0;
		int mem_num = 0;
		// 세션에서 로그인한 계정의 정보 받아오기
		HttpSession session = request.getSession();
		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO)session.getAttribute("member");
			// 회원번호 가져오기
			mem_num = member.getMem_num();
			
			model.addAttribute("mem_num", mem_num);
			
			// 좋아요를 눌렀는지 
			if(reviewService.checkTrailerGood(board_num, mem_num) != 0) {
				checkTrailerGood = reviewService.checkTrailerGood(board_num, mem_num);
			}
			//  싫어요를 눌렀는지	
			if(reviewService.checkTrailerBad(board_num, mem_num) != 0) {
				checkTrailerBad = reviewService.checkTrailerBad(board_num, mem_num);
			}
		}
		
		// 댓글 리스트 가져오기
		Map<String, Object> replylist = replyService.getReplyList(request, response);
		
		//멤버불러오기
		MemberVO member = memberService.getmemberinfo(review.getMem_num());
		System.out.println(member.getMem_id());
		System.out.println(member.getMem_img());
		
		model.addAttribute("checkTrailerGood", checkTrailerGood);
		model.addAttribute("checkTrailerBad", checkTrailerBad);
		model.addAttribute("re", review);
		model.addAttribute("mem", member);
		model.addAttribute("page", page);
		model.addAllAttributes(replylist);
		
		return "review/review_cont";
	}
	//리뷰 수정폼
	@RequestMapping(value="review_update")
	public String review_update(@RequestParam("board_num") int board_num,
								@RequestParam("page") String page,HttpSession session,
								MemberVO member,Model model)throws Exception{
		
		MemberVO reviewmember = (MemberVO)session.getAttribute("member");
		int mem_num = reviewmember.getMem_num();
		String mem_id = reviewmember.getMem_id();
		
		//리뷰 불러오기
		BoardVO review = reviewService.getReviewCont(board_num);
		model.addAttribute("re", review);
		model.addAttribute("page", page);
		
		int result =0;
		
		if(!review.getMem_id().equals(mem_id)) {
			result = 1;
			model.addAttribute("result", result);
			return "review/deleteCheck";
		}
		
		String review_cont = review.getBoard_cont().replace("\n", "<br/>");
		//글 내용중 엔터키 친 부분을 다음줄로 개행
		model.addAttribute("review_content", review_cont);
		
		return "review/review_update";
	}
	
	//리뷰 수정
	@RequestMapping(value="/review_updating", method=RequestMethod.POST)
	public String review_updating(@RequestParam(value="board_img1", required = false ) MultipartFile mf,
								  @ModelAttribute BoardVO board,
								  @RequestParam("board_num") int board_num,
								  @RequestParam("page") String page,
								  HttpServletRequest request,
								  Model model)throws Exception{
		
		if (!mf.isEmpty()) {
	         //첨부파일 저장
	         UUID uuid = UUID.randomUUID();
	         String filename = uuid + mf.getOriginalFilename();
	         int size = (int) mf.getSize();
	         String path = request.getRealPath("resources/images/reviewimage");
	         int result = 0;
	         String file[] = new String[2];

        // 첨부파일 저장 체크
//	         if (filename != "") {
//	            StringTokenizer st = new StringTokenizer(filename, ".");
//	            file[0] = st.nextToken();
//	            file[1] = st.nextToken(); // 확장자
//
//	            // 사이즈가 10mb 이상인경우
//	            if (size > 10000000) {
//	               result = 1;
//	               model.addAttribute("result", result);
//
//	               return "";
//
//	            //  
//	            } else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png") && !file[1].equals("pdf")) {
//
//	               result = 2;
//	               model.addAttribute("result", result);
//
//	               return "";
//	            }
//	         }

	         // 첨부파일이 전송된 경우
	         if (size > 0) {
	            mf.transferTo(new File(path + "/" + filename));
	         }

	         board.setBoard_img(filename);
	         System.out.println(path);
	      } else {
	    	//기존 리뷰정보 불러오기
	    	BoardVO oldreview = reviewService.getReviewCont(board_num);
	    	// 기존 이미지 덮어쓰기
	  		board.setBoard_img(oldreview.getBoard_img());
	      }
		
		
		
		//수정 메서드 호출
		reviewService.reviewUpdate(board);
		System.out.println("수정가나요 컨트롤러");
		
		return "redirect:/review_cont?board_num=" + board.getBoard_num()
							+"&page=" + page;
	}
	//리뷰 삭제
	@RequestMapping(value="review_delete")
	public String review_delete(@RequestParam("board_num") int board_num,
								@RequestParam("page") String page, HttpSession session,
								MemberVO member, Model model)throws Exception {
		
		MemberVO reviewmember = (MemberVO)session.getAttribute("member");
		int mem_num = reviewmember.getMem_num();
		String mem_id = reviewmember.getMem_id();
		
		//리뷰정보 불러오기
		BoardVO review = reviewService.getReviewCont(board_num);
		System.out.println("리뷰삭제시켜줘 컨");
		
		int result =0;
		
		if(!review.getMem_id().equals(mem_id)) {
			result = 1;
			model.addAttribute("result", result);
			return "review/deleteCheck";
		}else {
			reviewService.reviewDelete(board_num);
		}
			
			
			return "redirect:/review_list?page="+page;
	}
	//리뷰게시판 검색
	@RequestMapping(value="search_review")
	public ModelAndView search_review(HttpServletRequest request,HttpServletResponse response) {
			ModelAndView reviewsearchM = new ModelAndView("review/review_searchlist");

			//리뷰 리스트 불러오기
			Map<String, Object> reviewsearchlist = reviewService.getreviewsearchlist(request,response);

			reviewsearchM.addAllObjects(reviewsearchlist);
			
			return reviewsearchM;
	}
}
