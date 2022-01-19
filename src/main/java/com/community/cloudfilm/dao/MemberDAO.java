package com.community.cloudfilm.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.community.cloudfilm.model.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public MemberVO getMember() {
		return sqlSession.selectOne("memberns.getMember");
	}
	

}
