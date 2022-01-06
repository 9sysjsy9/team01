package com.kh.ex01.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.ex01.vo.MemberVo;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVo memberVo = new MemberVo();
		memberVo = (MemberVo)session.getAttribute("memberVo");
		System.out.println("AuthInterceptor,, preHandle,, memberVo.getUserid() : " + memberVo);
		if(memberVo == null) {
			response.sendRedirect("/member/login");
		}
//		System.out.println("memberVo Data id : " + memberVo.getUserid() + ", name : " + memberVo.getUsername() + ", 권한 : " + memberVo.getAuthority());
		return super.preHandle(request, response, handler);
	}
	
}