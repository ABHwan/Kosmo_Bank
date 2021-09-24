package com.spring.bank.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface CustomerService {
	
	// 중복확인 처리
	public int confirmIdAction(Map<String, Object> map);
	
	// 회원가입 처리
	public void registerAction(HttpServletRequest req, Model model);
	
	// 이메일 인증 성공 처리
	// public void emailSuccess(HttpServletRequest req, Model model);
	
	// 회원정보 인증
	public void confirmAction(HttpServletRequest req, Model model);
	
	// 회원정보 인증 및 탈퇴 처리
	public void deleteCustomerAction(HttpServletRequest req, Model model);
	
	// 회원정보 인증 및 상세 페이지
	public void modifyDetailAction(HttpServletRequest req, Model model);
	
	// 회원정보 수정 처리
	public void modifyCustomerAction(HttpServletRequest req, Model model);
	
	// id찾기
	public void idFindAction(HttpServletRequest req, Model model);
	
	// pw 재설정 이메일전송
	public void sendEmail(Map<String, Object> map);
	
	// pw 찾기(재설정)
	public void pwFindAction(HttpServletRequest req, Model model);

}
