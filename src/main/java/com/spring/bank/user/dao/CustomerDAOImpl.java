package com.spring.bank.user.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.product.vo.SavingProductVO;
import com.spring.bank.user.vo.AccountBookVO;
import com.spring.bank.user.vo.AccountVO;
import com.spring.bank.user.vo.CrawlerVO;
import com.spring.bank.user.vo.DepositVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.user.vo.LoanHistoryVO;
import com.spring.bank.user.vo.LoanProductVO;
import com.spring.bank.user.vo.TransferVO;
import com.spring.bank.user.vo.UserVO;
import com.spring.bank.user.vo.faqVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	SqlSession sqlSession;

	// 회원 가입 아이디 중복확인
	@Override
	public int idCheck(Map<String, Object> map) {

		System.out.println(map.get("member_id"));
		return sqlSession.getMapper(CustomerDAO.class).idCheck(map);
	}
	
	// 회원가입 명의 중복확인
	@Override
	public int duplicateCheck(Map<String, Object> map) {
		
		System.out.println(map.get("member_id"));
		return sqlSession.getMapper(CustomerDAO.class).duplicateCheck(map);
	}

	// 회원가입 처리
	@Override
	public int insertUser(UserVO vo) {

		System.out.println("[DAO => InsertUser()]");
		return sqlSession.getMapper(CustomerDAO.class).insertUser(vo);
	}

	// 이메일 인증 성공 처리
	@Override
	public int emailSuccess(UserVO vo) {

		System.out.println("[DAO => emailSuccess()]");
		return sqlSession.getMapper(CustomerDAO.class).emailSuccess(vo);
	}

	// 이메일 체크
	@Override
	public int emailChk(String id) {
		System.out.println("[DAO => emailChk()]");

		return sqlSession.getMapper(CustomerDAO.class).emailChk(id);
	}

	// 로그인 및 회원 인증
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("[DAO => idPasswordChk()]");


		return sqlSession.getMapper(CustomerDAO.class).idPasswordChk(map);
	}

	// 회원 탈퇴
	@Override
	public int deleteUser(String id) {
		System.out.println("[DAO => updateUser()]");

		return sqlSession.getMapper(CustomerDAO.class).deleteUser(id);

	}

	// 회원정보 상세 페이지
	@Override
	public UserVO getUserInfo(String id) {
		System.out.println("[DAO => getUserInfo()]");

		return sqlSession.getMapper(CustomerDAO.class).getUserInfo(id);
	}

	// 회원정보 수정 처리
	@Override
	public int updateUser(UserVO vo) {
		System.out.println("[DAO => updateUser()]");

		return sqlSession.getMapper(CustomerDAO.class).updateUser(vo);
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

	// 문의사항 갯수(지현)
	@Override
	public int getInquiryCnt() {

		return sqlSession.getMapper(CustomerDAO.class).getInquiryCnt();
	}

	// 문의사항 조회(지현)
	@Override
	public List<InquiryVO> getInquiryList(Map<String, Integer> map) {
		
		return sqlSession.getMapper(CustomerDAO.class).getInquiryList(map);
	}

	// 문의사항 추가 처리 페이지(지현)
	public int insertInquiry(InquiryVO vo) {


		return sqlSession.getMapper(CustomerDAO.class).insertInquiry(vo);
	}

	// 문의사항 조회수 증가(지현)
	public int addReadCnt(int inquiry_id) {

		return sqlSession.getMapper(CustomerDAO.class).addReadCnt(inquiry_id);
	}

	// 문의사항 상세페이지 조회(지현)
	public InquiryVO getQnaDetail(int inquiry_id) {

		return sqlSession.getMapper(CustomerDAO.class).getQnaDetail(inquiry_id);
	}

	// qna 수정 처리 (지현)
	public int updateQna(InquiryVO vo) {

		return sqlSession.getMapper(CustomerDAO.class).updateQna(vo);
	}

	// qna 삭제 처리(지현)
	public int deleteQna(int inquiry_id) {

		return sqlSession.getMapper(CustomerDAO.class).deleteQna(inquiry_id);
	}

	// 자주묻는 질문 갯수 (지현)
	@Override
	public int getFaqCnt() {

		return sqlSession.getMapper(CustomerDAO.class).getFaqCnt();
	}

	// 자주묻는 질문 조회(지현)
	@Override
	public List<faqVO> getFaqList(Map<String, Integer> map) {

		return sqlSession.getMapper(CustomerDAO.class).getFaqList(map);
	}

	// 예금 상품 갯수(지현)
	@Override
	public int getDepositCnt() {

		return sqlSession.getMapper(CustomerDAO.class).getDepositCnt();
	}

	// 예금 상품 조회
	@Override
	public List<DepositProductVO> getDepositList(Map<String, Object> map){

		return sqlSession.getMapper(CustomerDAO.class).getDepositList(map);
	}

	// 관리자 페이지 예금 상품 수(검색결과수)
	@Override
	public int getDepositProductSearchCnt(String search) {
		return sqlSession.getMapper(CustomerDAO.class).getDepositProductSearchCnt(search);
	}

	// 관리자 페이지 예금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<DepositProductVO> searchDepositProduct(Map<String, Object> map) {
		return sqlSession.getMapper(CustomerDAO.class).searchDepositProduct(map);
	}

	// 예금 상품 상세 보기
	@Override
	public DepositProductVO getDepositDetail(String deposit_product_name) {
		
		return sqlSession.getMapper(CustomerDAO.class).getDepositDetail(deposit_product_name);
	}

	// 적금 상품 갯수
	@Override
	public int getSavingCnt(){
		
		return sqlSession.getMapper(CustomerDAO.class).getSavingCnt();
	}		
	
	// 적금 상품 조회
	@Override
	public List<SavingProductVO> getSavingList(Map<String, Integer> map){
		
		return sqlSession.getMapper(CustomerDAO.class).getSavingList(map);
	}
	
	// 관리자 페이지 적금 상품 수(검색결과수)
	@Override
	public int getSavingProductSearchCnt(String search) {
		return sqlSession.getMapper(CustomerDAO.class).getSavingProductSearchCnt(search);
	}
	
	// 관리자 페이지 적금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<SavingProductVO> searchSavingProduct(Map<String, Object> map){
		return sqlSession.getMapper(CustomerDAO.class).searchSavingProduct(map);
	}
	
	// 적금 상품 상세 보기
	@Override
	public SavingProductVO getSavingDetail(String saving_product_name) {

		return sqlSession.getMapper(CustomerDAO.class).getSavingDetail(saving_product_name);
	}
	 
	//멤버의 unique_key가져오기 
	@Override
	public String getUniqueKey(String id) {
		
		return sqlSession.getMapper(CustomerDAO.class).getUniqueKey(id);
	}
	
	//예금 신청 시 계좌 개설 
	@Override
	public int insertAccount(AccountVO vo) {
		
		return sqlSession.getMapper(CustomerDAO.class).insertAccount(vo);
	}
		
	//예금 신청 처리 insert
	@Override
	public int insertDeposit(DepositVO vo) {
		
		return sqlSession.getMapper(CustomerDAO.class).insertDeposit(vo);
	}
	
	// 환율 저장 후 출력
	@Override
	public int exchangeIn(CrawlerVO vo) {
		System.out.println("[DAO => exchangeIn()]");


		return sqlSession.getMapper(CustomerDAO.class).exchangeIn(vo);
	}

	// 환율 체크
	@Override
	public int exchangeChk(String exchange_country) {
		System.out.println("[DAO => exchangeChk()]");


		return sqlSession.getMapper(CustomerDAO.class).exchangeChk(exchange_country);
	}

	// 환율 최신화
	@Override
	public int exchangeUpd(CrawlerVO vo) {
		System.out.println("[DAO => exchangeUpd()]");


		return sqlSession.getMapper(CustomerDAO.class).exchangeUpd(vo);
	}

	// 환율 증감식 -> db에있는 정보 출력
	@Override
	public String exchangeVary(String country) {
		System.out.println("[DAO => exchangeVary()]");


		return sqlSession.getMapper(CustomerDAO.class).exchangeVary(country);
	}

	// 회원 계좌 찾기
	@Override
	public List<AccountVO> accountFind(String strId) {


		return sqlSession.getMapper(CustomerDAO.class).accountFind(strId);
	}

	// 계좌 비밀번호
	@Override
	public int account_pwd(String strId) {
		return sqlSession.getMapper(CustomerDAO.class).account_pwd(strId);
	}

	// 회원 이체 확인
	@Override
	public int transfer_confirm(TransferVO vo) {
		return sqlSession.getMapper(CustomerDAO.class).transfer_confirm(vo);
	}

	// 회원 이체(보낸 사람 이체 정보 추가)
	@Override
	public int transferSenderConfirm(TransferVO vo) {
		return sqlSession.getMapper(CustomerDAO.class).transferSenderConfirm(vo);
	}

	// 받는 사람 이체 정보 추가
	@Override
	public int transferReceiverConfirm(TransferVO vo) {
		return sqlSession.getMapper(CustomerDAO.class).transferReceiverConfirm(vo);
	}

	// 보낸사람 계좌 정보 변경
	@Override
	public int transfer_sender(AccountVO vo) {
		return sqlSession.getMapper(CustomerDAO.class).transfer_sender(vo);
	}

	// 받는사람 계좌 정보 변경
	@Override
	public int transfer_receiver(AccountVO vo) {
		return sqlSession.getMapper(CustomerDAO.class).transfer_receiver(vo);
	}

	// test
//	@Override
//	public int jsonIn(List<String> list) {
//		System.out.println("[DAO ==> test()]");
//		
//		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
//		
//		return dao.jsonIn(list);
//	}		
	
	// 가계부 내역추가
	public int insertAccountBook(AccountBookVO vo) {
		return sqlSession.getMapper(CustomerDAO.class).insertAccountBook(vo);
	}
	
	// 가계부 내역삭제
	public int deleteAccountBook(AccountBookVO vo) {
		return sqlSession.getMapper(CustomerDAO.class).deleteAccountBook(vo);
	}
	
	// 가계부 조회
	public ArrayList<AccountBookVO> getAccountBook(String member_id) {
		return sqlSession.getMapper(CustomerDAO.class).getAccountBook(member_id);
	}

	// 가계부 통계조회
	public ArrayList<AccountBookVO> getAccountBookReport(String member_id) {
		return sqlSession.getMapper(CustomerDAO.class).getAccountBookReport(member_id);
	}
	
	//지은~!~!@@@@!
	// 대출 가입 상품
	@Override
	public ArrayList<LoanProductVO> loanList() {
		System.out.println("[DAO => loanList()]");
		return sqlSession.getMapper(CustomerDAO.class).loanList();
	}

	public int getLoanCancelCnt(String member_id) {
		System.out.println("[DAO => getLoanCancelCnt()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanCancelCnt(member_id);
	}

	public ArrayList<LoanProductVO> getLoanCancelList(Map<String, Object> map) {
		System.out.println("[DAO => getLoanCancelList()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanCancelList(map);
	}

	public int getLoanCnt(String member_id) {
		System.out.println("[DAO => getLoanCnt()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanCnt(member_id);
	}

	public ArrayList<LoanProductVO> getLoanList(Map<String, Object> map) {
		System.out.println("[DAO => getLoanList()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanList(map);
	}
	
	// 대출 상품 개수
	public int getLoanProductCnt() {
		System.out.println("[UserDAO => getLoanProductCnt()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanProductCnt();	
	}

	// 대출 상품 목록
	public ArrayList<LoanProductVO> getLoanProductList(Map<String, Object> map) {
		System.out.println("[UserDAO => getLoanProductList()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanProductList(map);	
	}

	public int getSearchLoanProductCnt(String keyword) {
		System.out.println("[UserDAO => getSearchLoanProductCnt()]");
		return sqlSession.getMapper(CustomerDAO.class).getSearchLoanProductCnt(keyword);	
	}

	public ArrayList<LoanProductVO> searchLoanProductList(Map<String, Object> map) { // parameter : keyword, start, end
		System.out.println("[UserDAO => searchLoanProductList()]");
		return sqlSession.getMapper(CustomerDAO.class).searchLoanProductList(map);	
	}

	public LoanProductVO getLoanProductInfo(String loan_product_name) {
		System.out.println("[UserDAO => getLoanProductInfo()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanProductInfo(loan_product_name);	
	}

	public ArrayList<LoanHistoryVO> getLoanHistoryList(Map<String, Object> map) {
		System.out.println("[UserDAO => getLoanHistoryList()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanHistoryList(map);	
	}

	public int getLoanHistoryCnt(String member_id) {
		System.out.println("[UserDAO => getLoanHistoryCnt()]");
		return sqlSession.getMapper(CustomerDAO.class).getLoanHistoryCnt(member_id);	
	}
	//지은!!!!!!!!1
}
