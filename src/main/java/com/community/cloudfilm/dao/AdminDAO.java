package com.community.cloudfilm.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;

@Repository
public class AdminDAO {
	@Autowired
	SqlSession sqlSession;

	// 최근 리뷰 가져오기
	public List<BoardVO> getreviewlist(int limit) {
		return sqlSession.selectList("adminMapper.getreviewlist", limit);
	}

	// 최근 추천게시판글 가져오기
	public List<BoardVO> getrecommendlist(int limit) {
		return sqlSession.selectList("adminMapper.getrecommendlist", limit);
	}

	// 최근 예고편글 가져오기
	public List<BoardVO> gettrailerlist(int limit) {
		return sqlSession.selectList("adminMapper.gettrailerlist", limit);
	}

	// 게시판관리 글 갯수 가져오기
	public int getAdminSearchListCount(Map<String, Object> paraMap) throws Exception{
		return sqlSession.selectOne("adminMapper.getAdminSearchListCount", paraMap);
	}

	// 게시판관리 글 가져오기
	public List<BoardVO> getAdminSearchList(Map<String, Object> paraMap) throws Exception{
		return sqlSession.selectList("adminMapper.getAdminSearchList", paraMap);
	}

	// 게시판관리 글 정지, 복구
	public void setBoardYN(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String yn = request.getParameter("yn");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		System.out.println("관리자게시글삭제");
		System.out.println(yn);
		if(yn.equals("y")) {
			System.out.println("y를 n으로");
			sqlSession.update("adminMapper.setN", board_num);
		}else if(yn.equals("n")) {
			System.out.println("y를 n으로");
			sqlSession.update("adminMapper.setY", board_num);
		}
	}

	// 총 회원수 가져오기
	public int getAdminMemberlistCount(Map<String, Object> paraMap) {
		return sqlSession.selectOne("adminMapper.getAdminMemberlistCount", paraMap);
	}

	public List<BoardVO> getAdminMemberlist(Map<String, Object> paraMap) {
		return sqlSession.selectList("adminMapper.getAdminMemberlist", paraMap);
	}

	public void setMemberYN(HttpServletRequest request, HttpServletResponse response) {
		String yn = request.getParameter("yn");
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		System.out.println("회원정지, 복구");
		System.out.println(yn);
		if(yn.equals("y")) {
			System.out.println("y를 n으로");
			sqlSession.update("adminMapper.setmemN", mem_num);
		}else if(yn.equals("n")) {
			System.out.println("y를 n으로");
			sqlSession.update("adminMapper.setmemY", mem_num);
		}
	}
	
}
