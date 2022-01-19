package com.community.cloudfilm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.cloudfilm.model.MemberVO;
import com.community.cloudfilm.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/adminsession")
	public String adminsession(HttpSession session) {
		
		MemberVO member = memberService.getMember();
		session.setAttribute("member", member);
		
		System.out.println(member.getMem_id());
		
		return "test";
	}

}
