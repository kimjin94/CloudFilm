package com.community.cloudfilm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.cloudfilm.model.BoardVO;


@Repository
public class HomeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 최근 리뷰 가져오기
		public List<BoardVO> getreviewlist(int limit) {
			return sqlSession.selectList("homeMapper.getreviewlist", limit);
		}

		// 최근 추천게시판글 가져오기
		public List<BoardVO> getrecommendlist(int limit) {
			return sqlSession.selectList("homeMapper.getrecommendlist", limit);
		}

		// 최근 예고편글 가져오기
		public List<BoardVO> gettrailerlist(int limit) {
			return sqlSession.selectList("homeMapper.gettrailerlist", limit);
		}

}
