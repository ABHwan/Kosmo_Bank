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
	
	//qna게시글 조회(지현)
	public void qnaList_mng(HttpServletRequest req,  Model model);
	
	//faq 조회(지현)
	public void faqList_mng(HttpServletRequest req,  Model model);
	
	//faq 게시글 추가(지현)
	public void faqAdd(HttpServletRequest req,  Model model);
	
	//faq 수정 상세(지현)
	public void faqModifyDetail(HttpServletRequest req,  Model model);
	
	//faq 수정 처리(지현)
	public void faqModify(HttpServletRequest req,  Model model);
	
	//faq 삭제 처리(지현)
	public void faqDelete(HttpServletRequest req,  Model model);

	// 관리자 페이지 회원계좌목록
	public void customerAccountList(HttpServletRequest req, Model model);
	
	// 관리자 페이지 회원계좌검색목록
	public void searchCustomerAccountList(HttpServletRequest req, Model model);
	
	// 관리자 페이지 TEST계좌생성(복환)
	public int insertTestAccount(HttpServletRequest req, Model model);
}
