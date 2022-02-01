package com.community.cloudfilm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;


@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//게시글 갯수
		public int getListCount()throws Exception {
			int count = 0;
			count = sqlSession.selectOne("homeMapper.home_listcount");
			return count;
		}	
	
	
	//리뷰목록 5개 목록
	public List<BoardVO> getHome_reviewlist(int page)throws Exception{
		System.out.println("리뷰리스트 5개");
		List<BoardVO> home_reviewlist = sqlSession.selectList("homeMapper.home_reviewlist");
		return home_reviewlist;
	}

}
