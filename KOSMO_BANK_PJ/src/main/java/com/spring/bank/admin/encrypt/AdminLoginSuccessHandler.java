package com.spring.bank.admin.encrypt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.spring.bank.user.vo.MemberVO;

// 로그인이 성공한 경우 자동으로 실행
public class AdminLoginSuccessHandler implements AuthenticationSuccessHandler {

	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res,
			Authentication authentication) throws IOException, ServletException {
		
		MemberVO vo = (MemberVO) authentication.getPrincipal();
		System.out.println("UserVO => " + vo);
		
		String strId = vo.getUserID();
		String strName = vo.getUsername();
		
		System.out.println(strId);
		System.out.println(strName);
		
		// 자동로그인 check박스는 check가 있으면 true로 반환되지만 check가 없으면 false가 아닌 null이된다.
	    String autoLogin = req.getParameter("autoLogin");
		
	    // 로그인 성공 시 세션ID를 설정
		req.getSession().setAttribute("adminID", strId);
		
		
		/*
		  	유효기간 : cookie.setMaxAge(Integer); 
		  	
		  	경로설정 : cookie.setPath("/"); /는 최상위 경로 의미,
		  	경로에 관계없이 쿠키를 받고자 한다면 루트로 설정하면 된다. 
		  	
		  	최상위 경로이기에 서버에서 문제없이 받음 클라이언트에
		  	쿠키저장요청 : response.addCookie(cookie);
		 */
		// 쿠키 로그인 유지처리
        if(autoLogin != null){
            Cookie cookie = new Cookie("adminID", strId);
            cookie.setMaxAge(60*60*24*7); // 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
            cookie.setPath("/");
            res.addCookie(cookie);
            } 
        
		req.setAttribute("selectCnt", 3);
		
		String viewPage = "/manager/mngLogin.do";
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		dispatcher.forward(req, res);
		
	}

}
