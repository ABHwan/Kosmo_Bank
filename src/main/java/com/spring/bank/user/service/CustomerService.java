package com.spring.bank.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface CustomerService {
	
	// 로그인 시 계좌 불러오기
	public void accountLoad(HttpServletRequest req, Model model);

	// 아이디 중복확인 처리
	public int confirmIdAction(Map<String, Object> map);

	// 명의중복
	public int duplicateAction(Map<String, Object> map);

	// 회원가입 처리
	public void registerAction(HttpServletRequest req, Model model);

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

	// qna 작성
	public void inquiryList(HttpServletRequest req, Model model);

	// qna작성 처리페이지
	public void inquiryWriteAction(HttpServletRequest req, Model model);

	// qna 상세보기 페이지
	public void InquiryDetailAction(HttpServletRequest req, Model model);

	// qna 수정
	public void InquiryModifyDetailAction(HttpServletRequest req, Model model);

	// qna 수정 처리
	public void inquiryModifyAction(HttpServletRequest req, Model model);

	// qna 비번 확인
	public void QnaPasswordConfirm(HttpServletRequest req, Model model);

	// qna 삭제 처리
	public void inquiryDelete(HttpServletRequest req, Model model);

	// faq 조회
	public void faqList(HttpServletRequest req, Model model);

	// 예금 상품 조회
	public void depositList(HttpServletRequest req, Model model);

	// 예금 상품 검색
	public void searchDepositProduct(HttpServletRequest req, Model model);

	// 예금 상품 상세보기
	public void depositDetail(HttpServletRequest req, Model model);
	
	// 금융상품 신청 시 계좌번호 생성 insert
	public void makeAccount(HttpServletRequest req, Model model);
	
	// 예금 신청 
	public void insertDeposit(HttpServletRequest req, Model model);

	// 회원 계좌 찾기
	public void getAccount(HttpServletRequest req, Model model);

	// 회원 계좌 비밀번호 확인
	public void accountPwdConfirm(HttpServletRequest req, Model model);

	// 회원 이체 최종 확인
	public void transferConfirm(HttpServletRequest req, Model model);
	
	// 연금 상품 조회
	public void irpList(HttpServletRequest req, Model model);
	
	// 연금 상품 검색 
	public void irpProductSearch(HttpServletRequest req, Model model);
	
	// 연금 상품 상세보기 
	public void irpDetail(HttpServletRequest req, Model model);
	
	// 연금 상품 신청 화면 
	public void irpProductJoin(HttpServletRequest req, Model model);
	
	// 연금 신청 irp insert
	public void insertIrp(HttpServletRequest req, Model model);
		
	// 적금 상품 조회
	public void savingList(HttpServletRequest req, Model model);
	
	// 적금 상품 검색 
	public void savingProductSearch(HttpServletRequest req, Model model);
	
	// 적금 상품 상세보기 
	public void savingDetail(HttpServletRequest req, Model model);
	
	// 적금 신청 
	public void savingProductAction(HttpServletRequest req, Model model);
	
	// 펀드 상품 조회
	public void fundList(HttpServletRequest req, Model model);
	
	// 펀드 상품 검색 
	public void fundProductSearch(HttpServletRequest req, Model model);
	
	// 펀드 상품 상세보기 
	public void fundDetail(HttpServletRequest req, Model model);
	
	// 펀드 신청 
	public void fundProductAction(HttpServletRequest req, Model model);
		
	//예금 신청 상세 화면 
	public void setDepositProductJoin(HttpServletRequest req, Model model);

	// 환율 데이터 입력 후 출력
	public void exchanges(HttpServletRequest req, Model model);
	
	// 환율 목록 출력
	public void exchangeList(HttpServletRequest req, Model model);
	
	// db json 넣기
	//public void test(HttpServletRequest req, Model model);

	// 가계부 내역 추가
	public void insertAccountBook(HttpServletRequest req, Model model);
	
	// 가계부 내역 삭제
	public void deleteAccountBook(HttpServletRequest req, Model model);
	
	// 가계부 내역 조회
	public void getAccountBook(HttpServletRequest req, Model model);

	// 예금리스트처리(민재)
	public void myDepositList(HttpServletRequest req, Model model);
	
	// 예금서브리스트처리(민재)
	public void myDepositSubList(HttpServletRequest req, Model model);
	
	// 적금리스트처리(민재)
	public void mySavingList(HttpServletRequest req, Model model);
	
	// 적금서브리스트처리(민재)
	public void mySavingSubList(HttpServletRequest req, Model model);
	
	// 연금리스트처리(민재)
	public void myIrpList(HttpServletRequest req, Model model);
	
	// 공지사항리스트(민재)
	public void noticeList(HttpServletRequest req, Model model);
	
	// 공지사항상세페이지(민재)
	public void noticeDetailAction(HttpServletRequest req, Model model);
	
	// 계좌조회
	public void myAccountList(HttpServletRequest req, Model model);
	
	// 계좌연동체크
	public void accountConnectCheck(HttpServletRequest req, Model model);
	
	// 계좌연동
	public int accountConnectAction(HttpServletRequest req, Model model);
	
	// 계좌연동해지
	public void accountDisConnectAction(HttpServletRequest req, Model model);
	
	// 회원 자동이체 신청
	public void insertAutoTransfer(HttpServletRequest req, Model model);
	
	// 회원 자동이체 목록
	public void getMyAutoTransfer(HttpServletRequest req, Model model);
	
	// 회원 자동이체 해지
	public void deleteAutoTransfer(HttpServletRequest req, Model model);
	
	// 자동이체 실행
	public void AutoTransferAction();
}
