<%@page import="com.community.cloudfilm.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
String mem_id =request.getParameter("mem_id");
String mem_pass =request.getParameter("mem_pass");
System.out.println("mem_id:"+mem_id);
System.out.println("mem_pass:"+mem_pass);


MemberDAO md= new MemberDAO();

int result =md.memberIdCheck(mem_id);
//-1이면 중복
// 1이면 사용가능
out.println(result);

%>