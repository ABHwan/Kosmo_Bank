package com.spring.bank.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bank.user.vo.CrawlerVO;
import com.spring.bank.user.vo.UserVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 회원 가입 아이디 중복확인
	@Override
	public int idCheck(Map<String, Object> map) {
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		System.out.println(map.get("member_id"));
		return dao.idCheck(map);
	}

	// 회원가입 처리
	@Override
	public int insertUser(UserVO vo) {

		System.out.println("[DAO => InsertUser()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.insertUser(vo);
	}

	// 이메일 인증 성공 처리
	@Override
	public int emailSuccess(UserVO vo) {
		
		System.out.println("[DAO => emailSuccess()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.emailSuccess(vo);
	}

	// 이메일 체크
	@Override
	public int emailChk(String id) {
		System.out.println("[DAO => emailChk()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		return dao.emailChk(id);
	}

	// 로그인 및 회원 인증
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("[DAO => idPasswordChk()]");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		return dao.idPasswordChk(map);
	}
	
	// 회원 탈퇴
	@Override 
	public int deleteUser(String id) {
		System.out.println("[DAO => updateUser()]");
	
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
	
		return dao.deleteUser(id);
	
	}
	
	// 회원정보 상세 페이지
	@Override
	public UserVO getUserInfo(String id) { 
		System.out.println("[DAO => getUserInfo()]");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		return dao.getUserInfo(id);
	}
	
	// 회원정보 수정 처리
	@Override
	public int updateUser(UserVO vo) {
		System.out.println("[DAO => updateUser()]");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		return dao.updateUser(vo);
	}

	// 아이디 찾기
	@Override
	public UserVO idFind(Map<String, Object> map) {
		return sqlSession.getMapper(CustomerDAO.class).idFind(map);
	}

	// 비밀번호 찾기(이메일발송위해 정보 가져오기)
	@Override
	public UserVO customerFind(Map<String, Object> map) {
		return sqlSession.getMapper(CustomerDAO.class).customerFind(map);
	}

	// 비밀번호 재설정
	@Override
	public int updatePassword(UserVO vo) {
		return sqlSession.getMapper(CustomerDAO.class).updatePassword(vo);
	}
	
	// 환율 저장 후 출력(지호)
	@Override
	public int exchangeIn(CrawlerVO vo) {
		System.out.println("[DAO => exchangeIn()]");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		return dao.exchangeIn(vo);
	}

	// 환율 체크
	@Override
	public int exchangeChk(String exchange_country) {
		System.out.println("[DAO => exchangeChk()]");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		return dao.exchangeChk(exchange_country);
	}

	// 환율 최신화
	@Override
	public int exchangeUpd(CrawlerVO vo) {
		System.out.println("[DAO => exchangeUpd()]");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		return dao.exchangeUpd(vo);
	}

	// 환율 증감식 -> db에있는 정보 출력
	@Override
	public String exchangeVary(String country) {
		System.out.println("[DAO => exchangeVary()]");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		
		return dao.exchangeVary(country);
	}	
}
