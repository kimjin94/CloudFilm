package com.community.cloudfilm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.community.cloudfilm.model.MemberVO;

//로그인 체크 세션
public class AdminSession extends HandlerInterceptorAdapter{
	// preHandle(request,response,handler)메소드
		// 1.Controller에서 요청(*.nhn)을 받기 전에  preHandle()가 호출되어 가로채는 역할로 사용
		// 2.로그인 하지않고(세션이 없으면) 요청하면 로그인 폼으로 이동 하도록 해주는 역할
		public boolean preHandle(HttpServletRequest request, 
				HttpServletResponse response, Object handler) throws Exception {
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			MemberVO member = (MemberVO)session.getAttribute("member");
			if (mem_id == null || mem_id.equals(""))  {		
				response.sendRedirect("member_login");	// 세션이 없으면 로그인 폼으로 이동
				return false;
			}else {
				if(member != null) {
					if(member.getMem_grade() != 99) {
						response.sendRedirect("home/home");	// 관리자가 아니면 접근불허
						return false;
					}
					
				}
			}
			return true;
		}
}
