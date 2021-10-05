package com.spring.bank.user.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.product.vo.FundProductVO;
import com.spring.bank.product.vo.IrpProductVO;
import com.spring.bank.product.vo.SavingProductVO;
import com.spring.bank.user.vo.AccountBookVO;
import com.spring.bank.user.vo.AccountVO;
import com.spring.bank.user.vo.CrawlerVO;
import com.spring.bank.user.vo.DepositVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.user.vo.LoanHistoryVO;
import com.spring.bank.product.vo.LoanProductVO;
import com.spring.bank.user.vo.LoanVO;
import com.spring.bank.user.vo.MyDepositVO;
import com.spring.bank.user.vo.MyIRPVO;
import com.spring.bank.user.vo.MySavingVO;
import com.spring.bank.user.vo.NoticeVO;
import com.spring.bank.user.vo.TransferVO;
import com.spring.bank.user.vo.UserVO;
import com.spring.bank.user.vo.faqVO;

public interface CustomerDAO {

	// ID 중복확인 처리
	public int idCheck(Map<String, Object> map);
	
	// 명의 중복확인 처리
	public int duplicateCheck(Map<String, Object> map);
	
	// 회원가입 처리
	public int insertUser(UserVO vo);

	// 로그인 처리
	public int idPasswordChk(Map<String, Object> map);

	// 이메일 인증 성공 처리
	public int emailSuccess(UserVO vo);

	// 이메일 인증
	public int emailChk(String strId);

	// 회원정보 탈퇴 처리
	public int deleteUser(String strId);

	// 회원정보 상세 페이지 처리
	public UserVO getUserInfo(String strId);

	// 회원 정보 수정 처리
	public int updateUser(UserVO vo);

	// 아이디 찾기
	public UserVO idFind(Map<String, Object> map);

	// 비밀번호 찾기(입력받은 정보로 멤버 정보 가져오기) 이메일 발송 위해
	public UserVO customerFind(Map<String, Object> map);

	// 비밀번호 변경(재설정한 비밀번호 저장)
	public int updatePassword(UserVO vo);

	// 문의사항 갯수
	public int getInquiryCnt();

	// 문의사항 조회
	public List<InquiryVO> getInquiryList(Map<String, Integer> map);

	// 문의사항 추가 처리
	public int insertInquiry(InquiryVO vo);

	// 문의사항 조회수 증가
	public int addReadCnt(int inquiry_id);

	// 문의사항 상세페이지 조회
	public InquiryVO getQnaDetail(int inquiry_id);

//			//qna 게시글 비밀번호 인증,(수정, 삭제 )
//			public int numPasswordCheck(Map<String, Object> map);

	// qna 수정 처리
	public int updateQna(InquiryVO vo);

	// qna 삭제 처리
	public int deleteQna(int inquiry_id);

	// faq 갯수 구하기
	public int getFaqCnt();

	// faq 조회
	public List<faqVO> getFaqList(Map<String, Integer> map);

	// 예금 상품갯수
	public int getDepositCnt();

	//예금 상품 조회
	public List<DepositProductVO> getDepositList(Map<String, Object> map);
	
	// 관리자 페이지 예금 상품 수(검색결과수)
	public int getDepositProductSearchCnt(String search);

	// 관리자 페이지 예금 상품 검색(입력받아서 검색)
	public ArrayList<DepositProductVO> searchDepositProduct(Map<String, Object> map);

	// 예금 상품 상세 보기
	public DepositProductVO getDepositDetail(String deposit_product_name);
	
	// 연금 상품갯수
	public int getIrpCnt();

	// 연금 상품 조회
	public List<IrpProductVO> getIrpList(Map<String, Integer> map);
	
	// 연금 상품 수(검색결과수)
	public int getIrpProductSearchCnt(String search);
	
	// 연금 상품 검색(입력받아서 검색)
	public ArrayList<IrpProductVO> searchIrpProduct(Map<String, Object> map);
	
	// 연금 상품 상세 보기
	public IrpProductVO getIrpDetail(String irp_product_name);

	//연금 상품 신청하기 
//	public int irpInsert(IrpProductVO vo);
	
	// 적금 상품갯수
	public int getSavingCnt();

	// 적금 상품 조회
	public List<SavingProductVO> getSavingList(Map<String, Integer> map);
	
	// 적금 상품 수(검색결과수)
	public int getSavingProductSearchCnt(String search);
	
	// 적금 상품 검색(입력받아서 검색)
	public ArrayList<SavingProductVO> searchSavingProduct(Map<String, Object> map);
	
	// 적금 상품 상세 보기
	public SavingProductVO getSavingDetail(String saving_product_name);

	// 적금 신청
	public int savingProductAction(SavingProductVO vo);
	
	// 펀드 상품갯수
	public int getFundCnt();

	// 펀드 상품 조회
	public List<FundProductVO> getFundList(Map<String, Integer> map);
	
	// 펀드 상품 수(검색결과수)
	public int getFundProductSearchCnt(String search);
	
	// 펀드 상품 검색(입력받아서 검색)
	public ArrayList<FundProductVO> searchFundProduct(Map<String, Object> map);
	
	// 펀드 상품 상세 보기
	public FundProductVO getFundDetail(String fund_title);

	// 펀드 신청
	public int fundProductAction(FundProductVO vo);

	//예금 신청 처리 insert 
	public int insertDeposit(DepositVO vo);
	
	//멤버의 unique_key가져오기
	public String getUniqueKey(String id);
	
	//예금 신청 시 계좌 생성
	public int insertAccount(AccountVO vo);
	
	// 환율 저장 후 출력
	public int exchangeIn(CrawlerVO vo);

	// 환율 체크
	public int exchangeChk(String exchange_country);

	// 환율 최신화
	public int exchangeUpd(CrawlerVO vo);

	// 환율 증감식 -> db에 있는 정보 출력
	public String exchangeVary(String country);

	// 회원 계좌 찾기
	public List<AccountVO> accountFind(String strId);

	// 회원 계좌 비밀번호 확인
	public int account_pwd(String strId);

	// 회원 이체 확인
	public int transfer_confirm(TransferVO vo);

	// 회원 이체(보낸 사람 이체 정보 추가)
	public int transferSenderConfirm(TransferVO vo);

	// 받는 사람 이체 정보 추가
	public int transferReceiverConfirm(TransferVO vo);

	// 보낸사람 계좌 정보 변경(금액)
	public int transfer_sender(AccountVO vo);

	// 받는사람 계좌 정보 변경(금액)
	public int transfer_receiver(AccountVO vo);
	
	// json db에 넣기
	//public int jsonIn(List<String> list);
	
	// 가계부 내역추가
	public int insertAccountBook(AccountBookVO vo);
	
	// 가계부 내역삭제
	public int deleteAccountBook(AccountBookVO vo);
	
	// 가계부 조회
	public ArrayList<AccountBookVO> getAccountBook(String member_id);

	// 가계부 통계조회
	public ArrayList<AccountBookVO> getAccountBookReport(String member_id);

	public ArrayList<LoanProductVO> loanList();

	public Date getLoanDate();
	
	public ArrayList<LoanVO> getLoanCancelList(Map<String, Object> map);

	public int getLoanCancelCnt(String member_id);

	public ArrayList<LoanProductVO> getLoanList(Map<String, Object> map);

	public int getLoanCnt(Map<String, Object> map);

	public ArrayList<LoanProductVO> searchLoanProductList(Map<String, Object> map);

	public int getSearchLoanProductCnt(String keyword);

	public ArrayList<LoanProductVO> getLoanProductList(Map<String, Object> map);

	public int getLoanProductCnt();

	public LoanProductVO getLoanProductInfo(String loan_product_name);

	public ArrayList<LoanHistoryVO> getLoanHistoryList(Map<String, Object> map);

	public int getLoanHistoryCnt(String member_id);
 
	public int newLoanSignAction(LoanVO loan);

	public LoanVO getLoanInfo(Map<String, Object> map);

	// 회원이름 불러오기(민재)
	public String getName(String strId);
	
	// 예금리스트 불러오기(민재)
	public List<MyDepositVO> depositList(Map<String, Object> map);

	// 예금서브리스트 불러오기(민재)
	public List<MyDepositVO> depositSubList(Map<String, Object> map);
	
	// 적금리스트 불러오기(민재)
	public List<MySavingVO> savingList(Map<String, Object> map);

	// 적금서브리스트 불러오기(민재)
	public List<MySavingVO> savingSubList(Map<String, Object> map);
	
	// 연금리스트 불러오기(민재)
	public List<MyIRPVO> irpList(Map<String, Object> map);

	// 공지사항 글 개수 구하기(민재)
	public int getNoticeCnt();
	
	// 공지사항 리스트 불러오기(민재)
	public List<NoticeVO> getNoticeList(Map<String, Integer> map); 
	
	// 공지사항 조회수 증가(민재)
	public int addNoticeReadCnt(int notice_num);
	
	// 공지사항 상세 페이지(민재)
	public NoticeVO getNoticeDetail(int notice_num);
	
	// 대표 계좌 불러오기
	public AccountVO getAccountDefault(String unique_key);
	
	// 계좌 불러오기(연동 O)
	public List<AccountVO> getAccountLinked(String unique_key);
	
	// 계좌 불러오기(연동 X)
	public List<AccountVO> getAccountUnLinked(String unique_key);
	
	// 계좌 연동하기
	public int accountLinkAction(Map<String, Object> map);
	
	// 계좌 연동해지
	public int accountUnLinkAction(Map<String, Object> map);

	public int accountPayment(Map<String, Object> map);

	public AccountVO getAccountInfo(Map<String, Object> map);

	public int transferLoan(TransferVO trans);

	public Integer getTransID(TransferVO trans);

	public ArrayList<AccountVO> getAccountInfos(Map<String, Object> map);

	public int addLoanHistory(LoanHistoryVO history);

	public int updateLoanPayment(LoanVO loan);

	public int loanRequestAction(Map<String, Object> map);

	public int loanAccountState1(Map<String, Object> map);

	public int accountUniqueloan(Map<String, Object> map);


	// 대표 계좌 설정
	
}
