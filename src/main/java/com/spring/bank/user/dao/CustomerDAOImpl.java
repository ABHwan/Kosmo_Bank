package com.spring.bank.user.dao;

import java.sql.Date;
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
import com.spring.bank.user.vo.AccountBookVO;
import com.spring.bank.user.vo.AccountVO;
import com.spring.bank.user.vo.AutoTransferVO;
import com.spring.bank.user.vo.CrawlerVO;
import com.spring.bank.user.vo.DepositVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.user.vo.IrpVO;
import com.spring.bank.user.vo.LoanHistoryVO;
import com.spring.bank.user.vo.LoanProductVO;
import com.spring.bank.user.vo.LoanVO;
import com.spring.bank.user.vo.MyDepositVO;
import com.spring.bank.user.vo.MyIRPVO;
import com.spring.bank.user.vo.MySavingVO;
import com.spring.bank.user.vo.NoticeVO;
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

	//  예금 상품 수(검색결과수)
	@Override
	public int getDepositProductSearchCnt(String search) {
		return sqlSession.getMapper(CustomerDAO.class).getDepositProductSearchCnt(search);
	}

	//예금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<DepositProductVO> searchDepositProduct(Map<String, Object> map) {
		return sqlSession.getMapper(CustomerDAO.class).searchDepositProduct(map);
	}

	// 예금 상품 상세 보기
	@Override
	public DepositProductVO getDepositDetail(String deposit_product_name) {
		
		return sqlSession.getMapper(CustomerDAO.class).getDepositDetail(deposit_product_name);
	}

	// 연금 상품 갯수
	@Override
	public int getIrpCnt(){
		
		return sqlSession.getMapper(CustomerDAO.class).getIrpCnt();
	}		
	
	// 연금 상품 조회
	@Override
	public List<IrpProductVO> getIrpList(Map<String, Integer> map){
		
		return sqlSession.getMapper(CustomerDAO.class).getIrpList(map);
	}
	
	// 관리자 페이지 연금 상품 수(검색결과수)
	@Override
	public int getIrpProductSearchCnt(String search) {
		return sqlSession.getMapper(CustomerDAO.class).getIrpProductSearchCnt(search);
	}
	
	// 관리자 페이지 연금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<IrpProductVO> searchIrpProduct(Map<String, Object> map){
		
		return sqlSession.getMapper(CustomerDAO.class).searchIrpProduct(map);
	}
	
	// 연금 상품 상세 보기
	@Override
	public IrpProductVO getIrpDetail(String irp_product_name) {

		return sqlSession.getMapper(CustomerDAO.class).getIrpDetail(irp_product_name);
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
	
	// 적금 상품 수(검색결과수)
	@Override
	public int getSavingProductSearchCnt(String search) {
		return sqlSession.getMapper(CustomerDAO.class).getSavingProductSearchCnt(search);
	}
	
	// 적금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<SavingProductVO> searchSavingProduct(Map<String, Object> map){
		return sqlSession.getMapper(CustomerDAO.class).searchSavingProduct(map);
	}
	
	// 적금 상품 상세 보기
	@Override
	public SavingProductVO getSavingDetail(String saving_product_name) {
		
		return sqlSession.getMapper(CustomerDAO.class).getSavingDetail(saving_product_name);
	}

	// 적금 신청
	@Override
	public int savingProductAction(SavingProductVO vo) {
		return sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.savingProductAction",vo);
	}
	
	// 펀드 상품 갯수
	@Override
	public int getFundCnt(){
		
		return sqlSession.getMapper(CustomerDAO.class).getFundCnt();
	}		
	
	// 적금 상품 조회
	@Override
	public List<FundProductVO> getFundList(Map<String, Integer> map){
		
		return sqlSession.getMapper(CustomerDAO.class).getFundList(map);
	}
	
	// 관리자 페이지 적금 상품 수(검색결과수)
	@Override
	public int getFundProductSearchCnt(String search) {
		return sqlSession.getMapper(CustomerDAO.class).getFundProductSearchCnt(search);
	}
	
	// 관리자 페이지 적금 상품 검색(입력받아서 검색)
	@Override
	public ArrayList<FundProductVO> searchFundProduct(Map<String, Object> map){
		return sqlSession.getMapper(CustomerDAO.class).searchFundProduct(map);
	}
	
	// 펀드 상품 상세 보기
	@Override
	public FundProductVO getFundDetail(String fund_title) {
		
		return sqlSession.getMapper(CustomerDAO.class).getFundDetail(fund_title);
	}

	// 펀드 신청
	@Override
	public int fundProductAction(FundProductVO vo) {
		return sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.savingProductAction",vo);
	}
	 
	//멤버의 unique_key가져오기 
	@Override
	public String getUniqueKey(String member_id) {
		
		return sqlSession.getMapper(CustomerDAO.class).getUniqueKey(member_id);
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
	
	//연금 신청 처리 insert
	@Override
	public int insertIrp(IrpVO vo) {
		
		return sqlSession.getMapper(CustomerDAO.class).insertIrp(vo);
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
	public int account_pwd(String strPassword) {
		return sqlSession.getMapper(CustomerDAO.class).account_pwd(strPassword);
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
	
	// 대출번호 별 나의 대출 상환내역 불러오기  - 개수(진지현)
	@Override
	public int getLoanPayCnt(Map<String, Object> map) {
		return sqlSession.getMapper(CustomerDAO.class).getLoanPayCnt(map);
	}
	
	// 대출번호 별 나의 대출 상환내역 불러오기  - 리스트(진지현)
	@Override
	public ArrayList<LoanHistoryVO> getLoanPayList(Map<String, Object> map) {
		return sqlSession.getMapper(CustomerDAO.class).getLoanPayList(map);
	}
	//지은~!~!@@@@!

	// 대출 가입 상품
	@Override
	public ArrayList<LoanProductVO> loanList() {
		System.out.println("[DAO => loanList()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.loanList();
	}

	public int getLoanCancelCnt(String member_id) {
		System.out.println("[DAO => getLoanCancelCnt()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanCancelCnt(member_id);
	}

	public ArrayList<LoanVO> getLoanCancelList(Map<String, Object> map) {
		System.out.println("[DAO => getLoanCancelList()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanCancelList(map);
	}

	@Override
	public int getLoanCnt(Map<String, Object> map) {
		System.out.println("[DAO => getLoanCnt()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanCnt(map);
	}

	@Override
	public ArrayList<LoanProductVO> getLoanList(Map<String, Object> map) {
		System.out.println("[DAO => getLoanList()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanList(map);
	}
	
	// 대출 상품 개수
	public int getLoanProductCnt() {
		System.out.println("[UserDAO => getLoanProductCnt()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanProductCnt();	
	}

	// 대출 상품 목록
	public ArrayList<LoanProductVO> getLoanProductList(Map<String, Object> map) {
		System.out.println("[UserDAO => getLoanProductList()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanProductList(map);	
	}

	public int getSearchLoanProductCnt(String keyword) {
		System.out.println("[UserDAO => getSearchLoanProductCnt()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getSearchLoanProductCnt(keyword);	
	}

	public ArrayList<LoanProductVO> searchLoanProductList(Map<String, Object> map) { // parameter : keyword, start, end
		System.out.println("[UserDAO => searchLoanProductList()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.searchLoanProductList(map);	
	}

	public LoanProductVO getLoanProductInfo(String loan_product_name) {
		System.out.println("[UserDAO => getLoanProductInfo()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanProductInfo(loan_product_name);	
	}

	@Override
	public ArrayList<LoanHistoryVO> getLoanHistoryList(Map<String, Object> map) {
		System.out.println("[UserDAO => getLoanHistoryList()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanHistoryList(map);	
	}

	public int getLoanHistoryCnt(String member_id) {
		System.out.println("[UserDAO => getLoanHistoryCnt()]");

		return sqlSession.getMapper(CustomerDAO.class).getLoanHistoryCnt(member_id);
	}

	public int newLoanSignAction(LoanVO loan) {
		System.out.println("[UserDAO => newLoanSignAction()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.newLoanSignAction(loan);	
	}

	public LoanVO getLoanInfo(Map<String, Object> map) {
		System.out.println("[UserDAO => getLoanInfo()]");
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		return dao.getLoanInfo(map);	
	}
	
	//지은!!!!!!!!1
	
	// 회원 이름 불러오기(민재) 
	@Override
	public String getName(String id) {
		
		return sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.getName", id);
	}
	
	// 예금리스트 불러오기(민재)
	@Override
	public List<MyDepositVO> depositList(Map<String, Object> map) {
		
		return sqlSession.selectList("com.spring.bank.user.dao.CustomerDAO.depositList", map);
	}
	
	// 예금서브리스트 불러오기(민재)
	@Override
	public List<MyDepositVO> depositSubList(Map<String, Object> map) {
		
		return sqlSession.selectList("com.spring.bank.user.dao.CustomerDAO.depositSubList", map);
	}
	
	// 적금리스트 불러오기(민재)
	@Override
	public List<MySavingVO> savingList(Map<String, Object> map) {
		
		return sqlSession.selectList("com.spring.bank.user.dao.CustomerDAO.savingList", map);
	}
	
	// 적금서브리스트 불러오기(민재)
	@Override
	public List<MySavingVO> savingSubList(Map<String, Object> map) {
		
		return sqlSession.selectList("com.spring.bank.user.dao.CustomerDAO.savingSubList", map);
	}
	
	// 연금리스트 불러오기(민재)
	@Override
	public List<MyIRPVO> irpList(Map<String, Object> map) {
		
		return sqlSession.selectList("com.spring.bank.user.dao.CustomerDAO.irpList", map);
	}
	
	// 공지사항 글 개수 구하기(민재)
	@Override
	public int getNoticeCnt() {
		
		return sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.getNoticeCnt");
	}
	
	// 공지사항 리스트 불러오기(민재)
	public List<NoticeVO> getNoticeList(Map<String, Integer> map){

		return sqlSession.selectList("com.spring.bank.user.dao.CustomerDAO.getNoticeList", map);
	}
	
	// 공지사항 조회수 증가(민재)
	public int addNoticeReadCnt(int notice_num) {
		
		return sqlSession.update("com.spring.bank.user.dao.CustomerDAO.addNoticeReadCnt", notice_num);
		
	}
	
	// 공지사항 상세페이지(민재)
	public NoticeVO getNoticeDetail(int notice_num) {
		
		return sqlSession.selectOne("com.spring.bank.user.dao.CustomerDAO.getNoticeDetail", notice_num);
		
	}
	
	// 대표 계좌 불러오기
	@Override
	public AccountVO getAccountDefault(String unique_key) {
		System.out.println("DAO - 대표계좌불러오기");
		
		return sqlSession.getMapper(CustomerDAO.class).getAccountDefault(unique_key);
	}

	// 계좌 불러오기(연동 O)
	@Override
	public List<AccountVO> getAccountConnected(String member_id) {
		System.out.println("DAO - 연동계좌불러오기");
		return sqlSession.getMapper(CustomerDAO.class).getAccountConnected(member_id);
	}

	// 계좌 불러오기(연동 X)
	@Override
	public List<AccountVO> getAccountDisConnected(String unique_key) {
		System.out.println("DAO - 비연동계좌불러오기");
		return sqlSession.getMapper(CustomerDAO.class).getAccountDisConnected(unique_key);
	}
	
	// 계좌 연동 체크(복환)
	@Override
	public List<AccountVO> accountConnectCheck(String unique_key) {
		System.out.println("DAO - 연동계좌체크");
		return sqlSession.getMapper(CustomerDAO.class).accountConnectCheck(unique_key);
	}

	// 계좌 연동하기(복환)
	@Override
	public int accountConnectAction(Map<String, Object> map) {
		System.out.println("DAO - 계좌 연동하기");
		return sqlSession.getMapper(CustomerDAO.class).accountConnectAction(map);
	}

	// 계좌 연동해제(복환)
	@Override
	public int accountDisConnectAction(Map<String, Object> map) {
		System.out.println("DAO - 계좌 연동해제");
		return sqlSession.getMapper(CustomerDAO.class).accountDisConnectAction(map);
	}

	// 은행별 계좌 조회(복환)
	@Override
	public  ArrayList<AccountVO> getAccountList(String member_id) {
		return sqlSession.getMapper(CustomerDAO.class).getAccountList(member_id);
	}

    // 회원 자동 이체 신청
    @Override
    public int insertAutoTransfer(AutoTransferVO vo) {
        return sqlSession.getMapper(CustomerDAO.class).insertAutoTransfer(vo);
    }
    
    // 회원 자동이체 조회
    public ArrayList<AutoTransferVO> getMyAutoTransfer(String member_id) {
        return sqlSession.getMapper(CustomerDAO.class).getMyAutoTransfer(member_id);
    }
    
    // 회원 자동이체 해지
    public int deleteAutoTransfer(int auto_id) {
        return sqlSession.getMapper(CustomerDAO.class).deleteAutoTransfer(auto_id);
    }
    
    // 자동이체 오늘날짜에 입금할거있는지 조회
    public ArrayList<AutoTransferVO> selectByDay(int day) {
        return sqlSession.getMapper(CustomerDAO.class).selectByDay(day);
    }
    
    // 자동이체 후 최신납부내역 갱신
    public int updateAutoTransfer(int auto_id) {
        return sqlSession.getMapper(CustomerDAO.class).updateAutoTransfer(auto_id);
    }
    
    // 자동이체 위해 내계좌에서 잔액조회
    public int selectAccountBalance(String account_id) {
        return sqlSession.getMapper(CustomerDAO.class).selectAccountBalance(account_id);
    }
    
    // 자동이체 납부(transfer 테이블에 이체내역추가)
    public int insertTranferByAuto(TransferVO vo) {
        return sqlSession.getMapper(CustomerDAO.class).insertTranferByAuto(vo);
    }
    
    // 자동이체 납부(AutoTransfer_list 테이블에 내역추가)
    public int insertAutoTransferList(Map<String, Object> map) {
        return sqlSession.getMapper(CustomerDAO.class).insertAutoTransferList(map);
    }

    // 자동이체 실패 -> 자동이체리스트 테이블에 내역추가
    public int failAutoTransferList(int auto_id) {
        return sqlSession.getMapper(CustomerDAO.class).failAutoTransferList(auto_id);
    }
    
    // 자동이체 결과 내계좌에 반영
    public int updateAccountAutoTransfer(Map<String, Object> map) {
        return sqlSession.getMapper(CustomerDAO.class).updateAccountAutoTransfer(map);
    }
    
    // 오늘날짜가 자동이체 만기일을 지났을시 자동으로 만기상태로 바꿔주기
    public int exitAutoTransfer() {
        return sqlSession.getMapper(CustomerDAO.class).exitAutoTransfer();
    }

    // 가계부에 가져올 자동이체일 조회
    public ArrayList<AccountBookVO> myAccountAutoTransfer(String member_id) {
        return sqlSession.getMapper(CustomerDAO.class).myAccountAutoTransfer(member_id);
    }

}
