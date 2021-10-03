package com.spring.bank.admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.product.vo.FundProductVO;
import com.spring.bank.product.vo.IrpProductVO;
import com.spring.bank.product.vo.SavingProductVO;
import com.spring.bank.user.vo.AccountVO;
import com.spring.bank.user.vo.CustomerAccountVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.product.vo.LoanProductVO;
import com.spring.bank.user.vo.LoanVO;
import com.spring.bank.user.vo.NoticeVO;
import com.spring.bank.user.vo.TransferVO;
import com.spring.bank.user.vo.UserVO;
import com.spring.bank.user.vo.faqVO;

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
		
	// 관리자 페이지 예금 상품 상세조회
	@Override
	public DepositProductVO getDepositProductInfo(String deposit_product_name) {
		return sqlSession.getMapper(AdminDAO.class).getDepositProductInfo(deposit_product_name);
	}
	
	// 관리자 페이지 예금 상품 수정
	@Override
	public int updateDepositProduct(DepositProductVO vo) {
		return sqlSession.getMapper(AdminDAO.class).updateDepositProduct(vo);
	}

	// // 관리자 페이지 예금 상품 삭제
	@Override
	public int deleteDepositProduct(String deposit_product_name) {
		return sqlSession.getMapper(AdminDAO.class).deleteDepositProduct(deposit_product_name);
	}
	
	// 관리자 페이지 적금 상품 등록
	@Override
	public int insertSavingProduct(SavingProductVO vo) {
		System.out.println("[DAO = insertSavingProduct]");
		return sqlSession.getMapper(AdminDAO.class).insertSavingProduct(vo);
	}

	// 관리자 페이지 적금 상품 수
	@Override
	public int getSavingProductCnt() {
		return sqlSession.getMapper(AdminDAO.class).getSavingProductCnt();
	}

	// 관리자 페이지 적금 상품 조회
	@Override
	public ArrayList<SavingProductVO> selectSavingProduct(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).selectSavingProduct(map);
	}

	// 관리자 페이지 적금 상품 수(검색결과수)
	@Override
	public int getSavingProductSearchCnt(String search) {
		return sqlSession.getMapper(AdminDAO.class).getSavingProductSearchCnt(search);
	}

	// 관리자 페이지 적금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<SavingProductVO> searchSavingProduct(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).searchSavingProduct(map);
	}

	// 관리자 페이지 적금 상품 상세조회
	@Override
	public SavingProductVO getSavingProductInfo(String saving_product_name) {
	    return sqlSession.getMapper(AdminDAO.class).getSavingProductInfo(saving_product_name);
	}
	   
	// 관리자 페이지 적금 상품 수정
	@Override
	public int updateSavingProduct(SavingProductVO vo) {
	    return sqlSession.getMapper(AdminDAO.class).updateSavingProduct(vo);
	}
	
	// 관리자 페이지 적금 상품 삭제
	@Override
	public int deleteSavingProduct(String saving_product_name) {
		return sqlSession.getMapper(AdminDAO.class).deleteSavingProduct(saving_product_name);
	}

	// 관리자 페이지 연금 상품 등록
	public int insertIrpProduct(IrpProductVO vo) {
		return sqlSession.getMapper(AdminDAO.class).insertIrpProduct(vo);
	};
	
	// 관리자 페이지 연금  상품 수
	@Override
	public int getIrpProductCnt() {
		return sqlSession.getMapper(AdminDAO.class).getIrpProductCnt();
	}
	
	// 관리자 페이지 연금  상품 조회
	@Override
	public ArrayList<IrpProductVO> selectIrpProduct(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).selectIrpProduct(map);
	}

	// 관리자 페이지 연금 상품 수(검색결과수)
	@Override
	public int getIrpProductSearchCnt(String search) {
		return sqlSession.getMapper(AdminDAO.class).getIrpProductSearchCnt(search);
	}
	
	// 관리자 페이지 연금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<IrpProductVO> searchIrpProduct(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).searchIrpProduct(map);
	}
		
	// 관리자 페이지 연금 상품 상세조회
	@Override
	public IrpProductVO getIrpProductInfo(String irp_product_name) {
		return sqlSession.getMapper(AdminDAO.class).getIrpProductInfo(irp_product_name);
	}
	
	// 관리자 페이지 펀드 상품 등록
	@Override
	public int insertFundProduct(FundProductVO vo) {
		System.out.println("[DAO = insertFundProduct]");
		return sqlSession.getMapper(AdminDAO.class).insertFundProduct(vo);
	}

	// 관리자 페이지 펀드 상품 수
	@Override
	public int getFundProductCnt() {
		return sqlSession.getMapper(AdminDAO.class).getFundProductCnt();
	}

	// 관리자 페이지 펀드 상품 조회
	@Override
	public ArrayList<FundProductVO> selectFundProduct(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).selectFundProduct(map);
	}

	// 관리자 페이지 펀드 상품 수(검색결과수)
	@Override
	public int getFundProductSearchCnt(String search) {
		return sqlSession.getMapper(AdminDAO.class).getFundProductSearchCnt(search);
	}

	// 관리자 페이지 펀드 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<FundProductVO> searchFundProduct(Map<String, Object> map) {
		return sqlSession.getMapper(AdminDAO.class).searchFundProduct(map);
	}

	// 관리자 페이지 펀드 상품 상세조회
	@Override
	public FundProductVO getFundProductInfo(String fund_title) {
	    return sqlSession.getMapper(AdminDAO.class).getFundProductInfo(fund_title);
	}
	   
	// 관리자 페이지 펀드 상품 수정
	@Override
	public int updateFundProduct(FundProductVO vo) {
	    return sqlSession.getMapper(AdminDAO.class).updateFundProduct(vo);
	}
	
	// 관리자 페이지 펀드 상품 삭제
	@Override
	public int deleteFundProduct(String fund_title) {
		return sqlSession.getMapper(AdminDAO.class).deleteFundProduct(fund_title);
	}
	
	
	// 관리자 페이지 연금 상품 수정
	@Override
	public int updateIrpProduct(IrpProductVO vo) {
		return sqlSession.getMapper(AdminDAO.class).updateIrpProduct(vo);
	}

	// // 관리자 페이지 연금 상품 삭제
	@Override
	public int deleteIrpProduct(String irp_product_name) {
		return sqlSession.getMapper(AdminDAO.class).deleteIrpProduct(irp_product_name);
	}
		
	//qna 개수(지현)
	@Override
	public int getInquiryCnt() {
		
		int selectCnt = sqlSession.selectOne("com.spring.bank.admin.dao.AdminDAO.getInquiryCnt");
		return selectCnt;
	}

	//qna 조회(지현)
	@Override
	public List<InquiryVO> getInquiryList(Map<String, Integer> map) {
		// List<InquiryVO> list = sqlSession.selectList("com.spring.bank.admin.dao.AdminDAO.getInquiryList"); // ........................
		List<InquiryVO> list = sqlSession.selectList("com.spring.bank.admin.dao.AdminDAO.getInquiryList", map); // 너 죽인다. 파라미터 안줬자나....
		return list;
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

	//자주묻는 질문  등록하기(지현)
	@Override
	public int faqAdd(faqVO vo) {
		int insertCnt = sqlSession.insert("com.spring.bank.admin.dao.AdminDAO.faqAdd", vo);
				
		return insertCnt;
	}

	//faq 수정 상세 조회(지현)
	@Override
	public faqVO getFaqDetail(int faq_id) {
		faqVO vo = sqlSession.selectOne("com.spring.bank.admin.dao.AdminDAO.getFaqDetail", faq_id);
		
		return vo;
	}

	//faq 수정 처리(지현)
	@Override
	public int updateFaq(faqVO vo) {
		int updateCnt = sqlSession.update("com.spring.bank.admin.dao.AdminDAO.updateFaq", vo);
		
		return updateCnt;
	}
	
	
	//faq삭제처리(지현)
	@Override
	public int deleteFaq(int faq_id) {
		int deleteCnt = sqlSession.delete("com.spring.bank.admin.dao.AdminDAO.deleteFaq", faq_id);
		
		return deleteCnt;
	}
	
	// 관리자 페이지 회원계좌수
	public int getCustomerAccountCnt() {
		return sqlSession.getMapper(AdminDAO.class).getCustomerAccountCnt();
	}
	
	// 관리자 페이지 회원계좌목록
	public ArrayList<CustomerAccountVO> getCustomerAccountList(Map<String, Object> map){
		return sqlSession.getMapper(AdminDAO.class).getCustomerAccountList(map);
	}
	
	// 관리자 페이지 회원계좌 검색결과 수
	public int getSerachCustomerAccountCnt(String search) {
		return sqlSession.getMapper(AdminDAO.class).getSerachCustomerAccountCnt(search);
	}
	
	// 관리자 페이지 회원계좌 검색결과목록
	public ArrayList<CustomerAccountVO> getSearchCustomerAccountList(Map<String, Object> map){
		return sqlSession.getMapper(AdminDAO.class).getSearchCustomerAccountList(map);
	}

	// 관리자 페이지 TEST 계좌 생성(복환)
	@Override
	public int insertTestAccount(AccountVO vo) {
		System.out.println("DAO => insertTestAccount");
		
		return sqlSession.getMapper(AdminDAO.class).insertTestAccount(vo);
	}

	// !지은!
	// 대출 상품 개수
	public int getLoanProductCnt() {
		System.out.println("[AdminDAO => getLoanProductCnt()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanProductCnt();	
	}

	// 대출 상품 목록
	public ArrayList<LoanProductVO> getLoanProductList(Map<String, Object> map) {
		System.out.println("[AdminDAO => getLoanProductList()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanProductList(map);	
	}

	//
	public ArrayList<LoanProductVO> searchLoanProductList(Map<String, Object> map) { // parameter : keyword, start, end
		System.out.println("[AdminDAO => searchLoanProductList()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.searchLoanProductList(map);	
	}

	public int loanProductInsert(LoanProductVO l) {
		System.out.println("[AdminDAO => loanProductInsert()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.loanProductInsert(l);	
	}

	public int loanProductUpdate(LoanProductVO l) {
		System.out.println("[AdminDAO => loanProductUpdate()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.loanProductUpdate(l);	
	}

	public int loanProductDelete(String loan_product_name) {
		System.out.println("[AdminDAO => loanProductDelete()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.loanProductDelete(loan_product_name);	
	}

	public LoanProductVO getLoanProductInfo(String loan_product_name) {
		System.out.println("[AdminDAO => getLoanProductInfo()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanProductInfo(loan_product_name);	
	}

	public ArrayList<LoanVO> getLoanList(Map<String, Object> map) {
		System.out.println("[AdminDAO => getLoanList()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanList(map);	
	}
	
	public ArrayList<LoanVO> getLoanRequestList(Map<String, Object> map) {
		System.out.println("[AdminDAO => getLoanRequestList()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanRequestList(map);	
	}

	public int getSearchLoanProductCnt(String keyword) {
		System.out.println("[AdminDAO => getSearchLoanProductCnt()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getSearchLoanProductCnt(keyword);	
	}

	public int getLoanCnt() {
		System.out.println("[AdminDAO => getLoanCnt()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanCnt();	
	}

	public int getLoanRequestCnt() {
		System.out.println("[AdminDAO => getLoanRequestCnt()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanRequestCnt();	
	}

	public int loanRequestAction(Map<String, Object> map) {
		System.out.println("[AdminDAO => loanRequestAction()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.loanRequestAction(map);	
	}

	public int getSearchLoanRequestCnt(String keyword) {
		System.out.println("[AdminDAO => getSearchLoanRequestCnt()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getSearchLoanRequestCnt(keyword);	
	}

	public int getSearchLoanCnt(String keyword) {
		System.out.println("[AdminDAO => getSearchLoanCnt()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getSearchLoanCnt(keyword);	
	}

	public ArrayList<LoanVO> searchLoanRequestList(Map<String, Object> map) {
		System.out.println("[AdminDAO => searchLoanRequestList()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.searchLoanRequestList(map);	
	}

	public ArrayList<LoanVO> searchLoanList(Map<String, Object> map) {
		System.out.println("[AdminDAO => searchLoanList()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.searchLoanList(map);	
	}

	public int getLoanCancelCnt() {
		System.out.println("[AdminDAO => getLoanCancelCnt()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanCancelCnt();	
	}

	public ArrayList<LoanProductVO> getLoanCancelList(Map<String, Object> map) {
		System.out.println("[AdminDAO => getLoanCancelList()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanCancelList(map);	
	}

	public LoanVO getLoanInfo(Map<String, Object> map) {
		System.out.println("[AdminDAO => getLoanInfo()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getLoanInfo(map);	
	}

	public int transNewLoanAccount(TransferVO trans) {
		System.out.println("[AdminDAO => transNewLoanAccount()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.transNewLoanAccount(trans);	
	}
	
	public int setNewLoanAccount(Map<String, Object> map) {
		System.out.println("[AdminDAO => setNewLoanAccount()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.setNewLoanAccount(map);	
	}

	public TransferVO resetNewLoanAccount(Map<String, Object> map) {
		System.out.println("[AdminDAO => resetNewLoanAccount()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.resetNewLoanAccount(map);	
	}

	// 회원정보 상세 페이지
	@Override
	public UserVO getUserInfo(String member_id) { 
		System.out.println("[DAO => getUserInfo()]");
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getUserInfo(member_id);
	}

	
	//대출계좌 정상으로 두기
	public int changeAccountState0(Map<String, Object> map) {
		return sqlSession.update("com.spring.bank.admin.dao.AdminDAO.changeAccountState0", map);
			
	}
	// !지은!
	
	// 공지사항 쓰기 처리(민재)
	@Override
	public int mngNoticeWriteAction(NoticeVO vo) {
		
		return sqlSession.insert("com.spring.bank.admin.dao.AdminDAO.mngNoticeWriteAction", vo);
	}
	
	// 공지사항 - 비밀번호 인증(민재)
	@Override
	public String noticePWDCheck(int notice_num) {
		
		return sqlSession.selectOne("com.spring.bank.admin.dao.AdminDAO.noticePWDCheck", notice_num);
	}
	
	// 공지사항 상세페이지(민재)
	@Override
	public NoticeVO getNoticeDetail(int notice_num) {
		
		return sqlSession.selectOne("com.spring.bank.admin.dao.AdminDAO.getNoticeDetail", notice_num);
	}
	
	// 공지사항 수정처리(민재)
	@Override
	public int noticeModifyAction(NoticeVO vo) {
		
		return sqlSession.update("com.spring.bank.admin.dao.AdminDAO.noticeModifyAction", vo);
	}
	
	// 공지사항 수정처리(민재)
	@Override
	public int noticeDeleteAction(int notice_num) {
		
		return sqlSession.delete("com.spring.bank.admin.dao.AdminDAO.noticeDeleteAction", notice_num);
	}

}
