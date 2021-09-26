package com.spring.bank.admin.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.user.vo.UserVO;


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

}
