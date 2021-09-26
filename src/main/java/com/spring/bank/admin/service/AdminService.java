package com.spring.bank.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {
	
	// 관리자 페이지 회원정보 목록
	public void customerList(HttpServletRequest req, Model model);

	// 관리자 페이지 회원검색
	public void searchCustomer(HttpServletRequest req, Model model);
	
	// 관리자 페이지 회원삭제
	public void deleteCustomer(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품 등록
	public void insertDepositProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품 조회
	public void selectDepositProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품검색
	public void searchDepositProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품 수정
	public void updateDepositProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품 삭제
	public void deleteDepositProduct(HttpServletRequest req, Model model);
}
