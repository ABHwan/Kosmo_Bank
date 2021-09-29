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
	
	//qna 작성 
	public void inquiryList(HttpServletRequest req, Model model);
	
	//qna작성 처리페이지
	public void inquiryWriteAction(HttpServletRequest req, Model model);
	
	//qna 상세보기 페이지
	public void InquiryDetailAction(HttpServletRequest req, Model model);
	
	//qna 수정 
	public void InquiryModifyDetailAction(HttpServletRequest req, Model model);
	
	//qna 수정 처리 
	public void inquiryModifyAction(HttpServletRequest req, Model model);
	
	// qna 비번 확인
	public void QnaPasswordConfirm(HttpServletRequest req, Model model);
	
	//qna 삭제 처리
	public void inquiryDelete(HttpServletRequest req, Model model);
	
	//faq 조회
	public void faqList(HttpServletRequest req, Model model);

	//예금 상품 조회
	public void depositList(HttpServletRequest req, Model model);
	
	//예금 상품 검색 
	public void searchDepositProduct(HttpServletRequest req, Model model);
	
	//예금 상품 상세보기 
	public void depositDetail(HttpServletRequest req, Model model);
	
	//예금 신청 
	public void insertDeposit(HttpServletRequest req, Model model);
	
	// 환율 데이터 입력 후 출력
	public void exchanges(HttpServletRequest req, Model model);
	
	// 환율 목록 출력
	public void exchangeList(HttpServletRequest req, Model model);	

	// 가계부 내역 추가
	public void insertAccountBook(HttpServletRequest req, Model model);
	
	// 가계부 내역 삭제
	public void deleteAccountBook(HttpServletRequest req, Model model);
	
	// 가계부 내역 조회
	public void getAccountBook(HttpServletRequest req, Model model);
}
