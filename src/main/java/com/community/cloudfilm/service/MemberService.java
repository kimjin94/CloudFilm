package com.community.cloudfilm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.cloudfilm.dao.MemberDAO;
import com.community.cloudfilm.model.MemberVO;


@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	//ID유효성 검사
	/*
	 * public int memberIdCheck(String mem_id) throws Exception { return
	 * memberDAO.memberIdCheck(mem_id); }
	 */
	public int memberIdCheck(String mem_id) {
		System.out.println("id유효성 서비스");
		return memberDAO.memberIdCheck(mem_id);
	}
	//닉네임 중복검사
//		public int nickCheck(String mem_nick) {
//			System.out.println("닉네임 중복 서");
//			return memberDAO.nickCheck(mem_nick);
//		}
	public int EmailCheck(String mem_email) {
		return memberDAO.EmailCheck(mem_email);
	}
	//회원가입 member저장
	public void insertMember(MemberVO member) throws Exception {
		 memberDAO.insertMember(member);
	}
	//로그인 저장 인증
	public MemberVO loginCheck(String mem_id) throws Exception {
		return memberDAO.loginCheck(mem_id);
	}
	//아이디 찾기 
	public MemberVO idFind(String mem_name) throws Exception{
		return memberDAO.idFind(mem_name);
	}
	//비밀번호 찾기
	public MemberVO passFind(MemberVO member) throws Exception {
		System.out.println("비밀번호 찾기서비스");
		return memberDAO.passFind(member);
	}
	//비밀번호 재확인
	public MemberVO passRe(MemberVO prmv)throws Exception {
		System.out.println("가냐");
		return memberDAO.passRe(prmv);
	}
	//비밀번호 수정
//		public void passUpdate(MemberVO member)throws Exception {
//			System.out.println("비밀번호 변경 괜찮으시겠어요?");
//			memberDAO.passUpdate(member);
//		}
	//회원 수정
	public void memberUpdate(MemberVO member)throws Exception {
		memberDAO.memberUpdate(member);
		System.out.println("수정폼 서비스");
	}
	//회원 삭제
	public void deleteMember(MemberVO delmv) throws Exception{
		memberDAO.deleteMember(delmv);
		System.out.println("탈퇴 서비스");
	}
	//회원 1명의 정보
	public MemberVO getMemberInfo(String mem_id) throws Exception{
		MemberVO member = memberDAO.getMemberInfo(mem_id);
		return member;
	}
	//
	public MemberVO getmemberinfo(int mem_num) {
		return (MemberVO)memberDAO.getmemberInfo(mem_num);
	}

	public MemberVO getMember() {
		return memberDAO.getMember();
	}
	
	
}
