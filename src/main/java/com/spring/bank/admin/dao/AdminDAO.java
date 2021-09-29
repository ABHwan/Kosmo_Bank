package com.spring.bank.admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.user.vo.CustomerAccountVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.user.vo.NoticeVO;
import com.spring.bank.user.vo.UserVO;
import com.spring.bank.user.vo.faqVO;


public interface AdminDAO {
	
	// 관리자 페이지 회원수(전체)
	public int getCustomerCnt();
	
	// 관리자 페이지 회원목록 조회
	public ArrayList<UserVO> getCustomerList(Map<String, Object> map);

	// 관리자 페이지 회원수(검색어)
	public int getCustomerSearchCnt(String search);
	
	// 관리자 페이지 회원 검색
	public ArrayList<UserVO> getCustomerSearchList(Map<String, Object> map);
	
	// 관리자 페이지 회원 삭제
	public int deleteCustomer(String member_id);
	
	// 관리자 페이지 예금 상품 등록
	public int insertDepositProduct(DepositProductVO vo);
	
	// 관리자 페이지 예금 상품 수
	public int getDepositProductCnt(); 
	
	// 관리자 페이지 예금 상품 조회
	public ArrayList<DepositProductVO> selectDepositProduct(Map<String, Object> map);
	
	// 관리자 페이지 예금 상품 수(검색결과수)
	public int getDepositProductSearchCnt(String search);
	
	// 관리자 페이지 예금 상품 검색(입력받아서 검색)
	public ArrayList<DepositProductVO> searchDepositProduct(Map<String, Object> map);
	
	// 관리자 페이지 예금 상품 수정
	public int updateDepositProduct(DepositProductVO vo);
	
	// 관리자 페이지 예금 상품 삭제
	public int deleteDepositProduct(String deposit_product_name);
	
	//문의사항 갯수 (지현)
	public int getInquiryCnt();
	
	//문의사항 리스트 (지현)
	public List<InquiryVO> getInquiryList(Map<String, Integer> map);
	
	//faq 갯수 구하기(지현)
	public int getFaqCnt();
	
	//faq 조회(지현)
	public List<faqVO> getFaqList(Map<String, Integer> map);
	
	//faq 추가하기(지현)
	public int faqAdd(faqVO vo);
	
	//faq 수정 상세조회(지현)
	public faqVO getFaqDetail(int faq_id);
	
	//faq 수정 처리(지현)
	public int updateFaq(faqVO vo);
	
	//faq 삭제 처리(지현)
	public int deleteFaq(int faq_id);

	// 관리자 페이지 회원계좌수
	public int getCustomerAccountCnt();
	
	// 관리자 페이지 회원계좌목록
	public ArrayList<CustomerAccountVO> getCustomerAccountList(Map<String, Object> map);
	
	// 관리자 페이지 회원계좌 검색결과 수
	public int getSerachCustomerAccountCnt(String search);
	
	// 관리자 페이지 회원계좌 검색결과목록
	public ArrayList<CustomerAccountVO> getSearchCustomerAccountList(Map<String, Object> map); 

	// 공지사항 쓰기 처리(민재)
	public int mngNoticeWriteAction(NoticeVO vo);
	
	// 공지사항 - 비밀번호 인증(민재)
	public int noticePWDCheck(Map<String, Object> map);
	
	// 공지사항 상세페이지(민재)
	public NoticeVO getNoticeDetail(int notice_num);
	
	// 공지사항 수정처리(민재)
	public int noticeModifyAction(NoticeVO vo);

	// 공지사항 수정처리(민재)
	public int noticeDeleteAction(int notice_num);

}
