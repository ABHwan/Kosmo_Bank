package com.spring.bank.user.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.user.vo.CrawlerVO;
import com.spring.bank.user.vo.InquiryVO;
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

	//문의사항 갯수
	public int getInquiryCnt();
	
	//문의사항 조회
	public List<InquiryVO> getInquiryList(Map<String, Integer> map);

	//문의사항 추가 처리
	public int insertInquiry(InquiryVO vo);
	
	//문의사항 조회수 증가
	public int addReadCnt(int inquiry_id);
	
	//문의사항 상세페이지 조회
	public InquiryVO getQnaDetail(int inquiry_id);

//			//qna 게시글 비밀번호 인증,(수정, 삭제 )
//			public int numPasswordCheck(Map<String, Object> map);
	//	
	//qna 수정 처리 
	public int updateQna(InquiryVO vo);
	
	//qna 삭제 처리
	public int deleteQna(int inquiry_id);
		
	//faq 갯수 구하기
	public int getFaqCnt();
	
	//faq 조회
	public List<faqVO> getFaqList(Map<String, Integer> map);
	
	//예금 상품갯수
	public int getDepositCnt();

	//예금 상품 조회
	public List<DepositProductVO> getDepositList(Map<String, Integer> map);
	
	// 관리자 페이지 예금 상품 수(검색결과수)
	public int getDepositProductSearchCnt(String search);
	
	// 관리자 페이지 예금 상품 검색(입력받아서 검색)
	public ArrayList<DepositProductVO> searchDepositProduct(Map<String, Object> map);
	
	//예금 상품 상세 보기
	public DepositProductVO getDepositDetail(String deposit_product_name);

	// 환율 저장 후 출력
	public int exchangeIn(CrawlerVO vo);
	
	// 환율 체크
	public int exchangeChk(String exchange_country);
	
	// 환율 최신화
	public int exchangeUpd(CrawlerVO vo);
	
	// 환율 증감식 -> db에 있는 정보 출력
	public String exchangeVary(String country);	
}
