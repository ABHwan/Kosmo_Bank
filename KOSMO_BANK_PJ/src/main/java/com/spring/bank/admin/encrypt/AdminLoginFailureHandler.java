package com.spring.bank.admin.encrypt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

// 로그인이 실패한 경우 자동으로 실행
public class AdminLoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		request.setAttribute("selectCnt", 0);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manager/account/mngLogin.jsp");
		dispatcher.forward(request, response);
		
	}

}
