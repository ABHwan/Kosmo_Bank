package com.spring.bank.admin.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.user.vo.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSession sqlSession;

	// 관리자페이지 회원수 구하기
	@Override
	public int getCustomerCnt() {
		return sqlSession.getMapper(AdminDAO.class).getCustomerCnt();
	}

	// 관리자페이지 회원목록
	@Override
	public ArrayList<UserVO> getCustomerList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).getCustomerList(map);
	}

	// 관리자페이지 회원수(검색어별)
	@Override
	public int getCustomerSearchCnt(String search) {
		return sqlSession.getMapper(AdminDAO.class).getCustomerSearchCnt(search);
	}
	
	// 관리자페이지  회원검색
	@Override
	public ArrayList<UserVO> getCustomerSearchList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).getCustomerSearchList(map);
	}

	// 관리자 페이지 회원 삭제
	@Override
	public int deleteCustomer(String member_id) {
		return sqlSession.getMapper(AdminDAO.class).deleteCustomer(member_id);
	}

	// 관리자 페이지 예금 상품 등록
	@Override
	public int insertDepositProduct(DepositProductVO vo) {
		return sqlSession.getMapper(AdminDAO.class).insertDepositProduct(vo);
	}

	// 관리자 페이지 예금 상품 수
	@Override
	public int getDepositProductCnt() {
		return sqlSession.getMapper(AdminDAO.class).getDepositProductCnt();
	}
	
	// 관리자 페이지 예금 상품 조회
	@Override
	public ArrayList<DepositProductVO> selectDepositProduct(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).selectDepositProduct(map);
	}

	// 관리자 페이지 예금 상품 수(검색결과수)
	@Override
	public int getDepositProductSearchCnt(String search) {
		return sqlSession.getMapper(AdminDAO.class).getDepositProductSearchCnt(search);
	}
	
	// 관리자 페이지 예금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<DepositProductVO> searchDepositProduct(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).searchDepositProduct(map);
	}
		
	// 관리자 페이지 예금 상품 수정
	@Override
	public int updateDepositProduct(DepositProductVO vo) {
		return 0;
	}

	// // 관리자 페이지 예금 상품 삭제
	@Override
	public int deleteDepositProduct(String deposit_product_name) {
		return sqlSession.getMapper(AdminDAO.class).deleteDepositProduct(deposit_product_name);
	}

}
