package com.spring.bank.user.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bank.admin.dao.AdminDAO;
import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.user.vo.CrawlerVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.user.vo.UserVO;
import com.spring.bank.user.vo.faqVO;

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
	

	//문의사항 갯수(지현)
	@Override
	public int getInquiryCnt() {
		
		int selectCnt = sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.getInquiryCnt");
		return selectCnt;
	}

	//문의사항 조회(지현)
	@Override
	public List<InquiryVO> getInquiryList(Map<String, Integer> map) {
		// List<InquiryVO> list = sqlSession.selectList("com.spring.bank.admin.dao.AdminDAO.getInquiryList"); 
		List<InquiryVO> list = sqlSession.selectList("com.spring.bank.user.dao.CustomerDAO.getInquiryList", map); 
		return list;
	}
	
	//문의사항 추가 처리 페이지(지현)
	public int insertInquiry(InquiryVO vo) {
		
		int selectCnt = sqlSession.insert("com.spring.bank.user.dao.CustomerDAO.insertInquiry", vo);
		
		return selectCnt;
	}
	
	//문의사항 조회수 증가(지현)
	public int addReadCnt(int inquiry_id) {
		int readCnt = sqlSession.update("com.spring.bank.user.dao.CustomerDAO.addReadCnt", inquiry_id);
		
		return readCnt;
	}
	
	//문의사항 상세페이지 조회(지현)
	public InquiryVO getQnaDetail(int inquiry_id) {
		
		InquiryVO vo = sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.getInquiryDetail", inquiry_id);
		
		return vo;
	}
	
	//qna 수정 처리 (지현)
	public int updateQna(InquiryVO vo) {
		int updateCnt = sqlSession.update("com.spring.bank.user.dao.CustomerDAO.updateQna", vo);
		
		return updateCnt;
	}
	
	//qna 삭제 처리(지현)
	public int deleteQna(int inquiry_id) {
		int deleteCnt = sqlSession.delete("com.spring.bank.user.dao.CustomerDAO.deleteQna", inquiry_id);
		
		return deleteCnt;
	}
	
	//자주묻는 질문 갯수 (지현)
	@Override
	public int getFaqCnt() {
		int selectCnt = sqlSession.selectOne("com.spring.bank.admin.dao.AdminDAO.getFaqCnt");				;
		
		
		return selectCnt;
	}

	//자주묻는 질문 조회(지현)
	@Override
	public List<faqVO> getFaqList(Map<String, Integer> map) {
		
		List<faqVO> list = sqlSession.selectList("com.spring.bank.admin.dao.AdminDAO.getFaqList", map);
		return list;
	}
	
	//예금 상품 갯수(지현)
	@Override
	public int getDepositCnt(){
		int selectCnt =sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.getDepositCnt");
		return selectCnt;
	}		
	
	//예금 상품 조회
	@Override
	public List<DepositProductVO> getDepositList(Map<String, Integer> map){
		List<DepositProductVO> list = sqlSession.selectList("com.spring.bank.user.dao.CustomerDAO.getDepositList", map);
		
		return list;
	}
	
	// 관리자 페이지 예금 상품 수(검색결과수)
	@Override
	public int getDepositProductSearchCnt(String search) {
		return sqlSession.getMapper(CustomerDAO.class).getDepositProductSearchCnt(search);
	}
	
	// 관리자 페이지 예금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<DepositProductVO> searchDepositProduct(Map<String, Object> map){
		return sqlSession.getMapper(CustomerDAO.class).searchDepositProduct(map);
	}
	
	//예금 상품 상세 보기
	@Override
	public DepositProductVO getDepositDetail(String deposit_product_name) {
		DepositProductVO vo = sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.getDepositDetail",deposit_product_name);
		System.out.println("상세보기 : "+vo.getDeposit_product_name());
		return vo;
	}

	// 환율 저장 후 출력
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
