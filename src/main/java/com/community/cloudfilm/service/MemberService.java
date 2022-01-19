package com.community.cloudfilm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.MemberDAO;
import com.community.cloudfilm.model.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;

	public MemberVO getMember() {
		return memberDAO.getMember();
	}
	
	

}
