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
	public int memberIdCheck(String mem_id) {
		System.out.println("id유효성 dao");
		int result = sqlSession.selectOne("memberMapper.idCheck", mem_id);
		System.out.println(result);
		return result;
	}
//	@Transactional
//	public int nickCheck(String mem_nick) {
//		System.out.println("닉네임 중복 디");
//		int result = sqlSession.selectOne("memberMapper.nickCheck", mem_nick);
//		System.out.println(result);
//		return result;
//	}
	public int EmailCheck(String mem_email) {
		int result = sqlSession.selectOne("memberMapper.emailCheck", mem_email);
		return result;
	}
	//회원가입 저장
	@Transactional
	public void insertMember(MemberVO member) throws Exception {
		sqlSession.insert("memberMapper.member_join", member);
	}
	//로그인 인증
	@Transactional
	public MemberVO loginCheck(String mem_id) throws Exception {
		return (MemberVO) sqlSession.selectOne("memberMapper.login_check", mem_id);
	}
	//아이디 찾기
	public MemberVO idFind(String mem_name) {
		return (MemberVO) sqlSession.selectOne("memberMapper.findId", mem_name);
	}
	//비밀번호 찾기
	public MemberVO passFind(MemberVO member)throws Exception {
		System.out.println("비밀번호 찾기 dao");
		return (MemberVO) sqlSession.selectOne("memberMapper.findPass", member);
	}
	//비밀번호 재확인
	public MemberVO passRe(MemberVO prmv)throws Exception {
		System.out.println("영차영차 재확인");
		return (MemberVO) sqlSession.selectOne("memberMapper.pass_recheck", prmv);
	}
	//비밀번호 수정
//	public void passUpdate(MemberVO member)throws Exception {
//		sqlSession.update("memberns.pass_update", member);
//	}
	//회원정보 수정
	public void memberUpdate(MemberVO member) {
		sqlSession.update("memberMapper.update",member);
		System.out.println("수정확인 dao");
	}
	//회원 탈퇴
	public void deleteMember(MemberVO delmv) throws Exception{
		sqlSession.update("memberMapper.delete", delmv);
		System.out.println("탈퇴 dao");
	}
	//회원 1명의 정보
	public MemberVO getMemberInfo(String mem_id) {
		MemberVO member = sqlSession.selectOne("memberMapper.select_member_info", mem_id);
		return member;
	}

	public Object getmemberInfo(int mem_num) {
		return sqlSession.selectOne("memberMapper.select_member",mem_num);
	}

	@Transactional
	public MemberVO getMember() {
		return sqlSession.selectOne("memberns.getMember");
	}
	
}
