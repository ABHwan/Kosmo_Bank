package com.spring.bank.admin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.bank.user.vo.DepositVO;

public interface AdminService {
	
	// 관리자 페이지 회원정보 목록
	public void customerList(HttpServletRequest req, Model model);

	// 관리자 페이지 회원검색
	public void searchCustomer(HttpServletRequest req, Model model);
	
	// 관리자 페이지 회원삭제
	public void deleteCustomer(HttpServletRequest req, Model model);
	
	// 관리자 금융관리 조회
	public void selectBanking(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품 등록
	public void insertDepositProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품 조회
	public ArrayList<DepositVO> selectDepositProduct();
	
	// 관리자 페이지 예금 상품 상세 조회
	public void getDepositProductInfo(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품 수정
	public void updateDepositProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 예금 상품 삭제
	public void deleteDepositProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 적금 상품 등록 처리
	public void savingProductInsertAction(HttpServletRequest req, Model model);
	
	// 관리자 페이지 적금 상품 조회
	public void selectSavingProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 적금 상품 검색
	public void searchSavingProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 적금 상품 상세 조회
    public void getSavingProductInfo(HttpServletRequest req, Model model);
   
    // 관리자 페이지 적금 상품 수정
    public void updateSavingProduct(HttpServletRequest req, Model model);
	
    // 관리자 페이지 적금 상품 삭제
	public void deleteSavingProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 연금 상품 등록(지현)
	public void insertIrpProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 연금 상품 조회(지현)
	public void selectIrpProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 연금 상품 검색(지현)
	public void searchIrpProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 연금 상품 상세 조회(지현)
	public void getIrpProductInfo(HttpServletRequest req, Model model);
	
	// 관리자 페이지 연금 상품 수정(지현)
	public void updateIrpProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 연금 상품 삭제(지현)
	public void deleteIrpProduct(HttpServletRequest req, Model model);

	// 관리자 페이지 펀드 상품 등록 처리
	public void fundProductInsertAction(HttpServletRequest req, Model model);
	
	// 관리자 페이지 펀드 상품 조회
	public void selectFundProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 펀드 상품 검색
	public void searchFundProduct(HttpServletRequest req, Model model);
	
	// 관리자 페이지 펀드 상품 상세 조회
    public void getFundProductInfo(HttpServletRequest req, Model model);
   
    // 관리자 페이지 펀드 상품 수정
    public void updateFundProduct(HttpServletRequest req, Model model);
	
    // 관리자 페이지 펀드 상품 삭제
	public void deleteFundProduct(HttpServletRequest req, Model model);	
	
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
	
	// 공지사항 쓰기 처리(민재)
	public void mngNoticeWriteAction(HttpServletRequest req, Model model);
	
	// 공지사항 수정(민재)
	public void mngNoticeModifyDetail(HttpServletRequest req, Model model);
	
	// 공지사항 수정처리(민재)
	public void mngNoticeModifyAction(HttpServletRequest req, Model model);
	
	// 공지사항 삭제처리(민재)
	public void mngNoticeDeleteAction(HttpServletRequest req, Model model);
	
    // 관리자 페이지 회원별 가입상품조회
    public void selectCustomerProduct(HttpServletRequest req, Model model);
    
    // 관리자 페이지 회월별 가입상품검색
    public void searchCustomerProduct(HttpServletRequest req, Model model);
}
