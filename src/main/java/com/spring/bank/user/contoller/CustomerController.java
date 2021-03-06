package com.spring.bank.user.contoller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.spring.bank.user.service.CustomerServiceImpl;
import com.spring.bank.user.vo.AccountVO;

@Controller

@RequestMapping("customer")
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private CustomerServiceImpl service;

	@Inject
	private JavaMailSender javaMailSender;

	// 아임포트 client API
	private IamportClient api = new IamportClient("imp_apikey", "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f");
	
	// main 화면(크롤링, 지호)
	@RequestMapping("index.do")
	public String home(HttpServletRequest req, Model model) {
		System.out.println("url ==> index");
		
		//service.exchanges(model);
		
		// 로그인 시 계좌 불러오기
		String member_id = (String) req.getSession().getAttribute("customerID");
		if(member_id != null) {
			service.accountLoad(req, model);
		}
		
		return "index";
	}
	
	// 회원가입 페이지
	@RequestMapping("register.do")
	public String register(HttpServletRequest req, Model model) {


		return "customer/account/register";
	}

	// 회원가입 중복확인 페이지 confirmId.do
	@ResponseBody
	@RequestMapping(value = "confirmId.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int confirId(HttpServletRequest req, Model model) {
		System.out.println("[url => confirId]");

		String member_id = req.getParameter("member_id");

		System.out.println(member_id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);

		return service.confirmIdAction(map);
	}
	
	// 회원가입 본인인증 토큰생성
	@ResponseBody
	@RequestMapping(value="getToken.do", method= {RequestMethod.POST})
	public IamportResponse<AccessToken> getToken(HttpSession session, Model model) throws Exception {
		System.out.println("[url => getToken.do]");
		
		
		return api.getAuth();
	}
	
	// 회원가입 본인인증 후 결과 조회 및 삭제
	@ResponseBody
	@RequestMapping(value="certifications.do", method= {RequestMethod.GET})
	public String certifications(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		System.out.println("[url => certifications]");
		logger.info("[url => certifications]");
		
		StringBuffer result = new StringBuffer();

		req.setCharacterEncoding("UTF-8");
		
		// ajax 에서 받아온 값
		String imp_uid = req.getParameter("imp_uid");
		String access_token = req.getParameter("access_token");
		
		String urlstr = "https://api.iamport.kr/certifications/" + imp_uid
				+ "?_token=" + access_token; // 클라이언트가 요청을 보낼 서버의 URL 주소
		
		URL url = new URL(urlstr);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		// get 방식으로 전송
		urlconnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
		
		String returnLine;
		
		while((returnLine = br.readLine()) != null) {
			result.append(returnLine);
			System.out.println(br.readLine());
		}
		
		urlconnection.disconnect();
		
		System.out.println(result.toString());
		
		
		req.setAttribute("json", result);
		
		return result.toString();
		
	}
	
	// 회원가입 본인인증 토큰생성
	@ResponseBody
	@RequestMapping(value="duplicate.do", method= {RequestMethod.POST})
	public int duplicate(HttpServletRequest req, Model model) throws Exception {
		System.out.println("[url => duplicate]");
		
		String unique_key = req.getParameter("unique_key");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("unique_key", unique_key);
		
		return service.duplicateAction(map);
	}

	// 회원가입 처리 페이지
	@RequestMapping("registerAction.do")
	public String registerAction(HttpServletRequest req, Model model) {

		service.registerAction(req, model);

		return "customer/account/registerAction";
	}

	// 회원가입 성공
	@RequestMapping("mainSuccess.do")
	public String mainSuccess(HttpServletRequest req, Model model) {

		// mainSuccess.do?insertCnt=" + cnt
		int cnt = Integer.parseInt(req.getParameter("selectCnt"));
		req.setAttribute("selectCnt", cnt);

		return "customer/account/login";
	}

	// 이메일 인증 처리
	@ResponseBody
	@RequestMapping(value = "usermailCheck.do", method = RequestMethod.POST)
	public String usermailSending(HttpServletRequest req, Model model) throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)
		String setfrom = "xkrrhsdl7@gmail.com"; // 전송자 이메일

		String toEmail = req.getParameter("userEmail"); // 받는 사람 이메일

		System.out.println("email : " + toEmail);
		String title = "[본인인증]KOSMO BANK 회원가입 인증 이메일입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 -KOSMO BANK-를 찾아주셔서 감사합니다."

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"★★★★ 인증번호는 " + dice + " 입니다.★★★★ "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해주세요."; // 내용

		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(toEmail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			javaMailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		JSONObject jo = new JSONObject();
		jo.put("resutl", 1);
		jo.put("dice", dice);
		return jo.toJSONString();

	}

	// 로그인 페이지
	@RequestMapping("login")
	public String loginform(HttpServletRequest req, Model model) {
		System.out.println("url==>login");
		logger.info("url ==> login");

		return "/customer/account/login";
	}

	// 로그아웃 페이지
	@RequestMapping("logoutAction.do")
	public String logout(HttpServletRequest req, Model model) {
		System.out.println("url ==> logout");
		logger.info("url ==> logout");

		return "customer/account/logOutAction";
	}

	// 회원탈퇴 확인 팝업
	@RequestMapping("deleteCustomer")
	public String deletecustomer(HttpServletRequest req, Model model) {
		logger.info("[url ==> /deletecustomer.us]");

		// 이동할 페이지
		return "/customer/account/deletecustomer";
	}

	// 회원탈퇴 처리
	@RequestMapping("deleteCustomerAction")
	public String deletecustomerAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> /deletecustomerAction.us]");

		service.deleteCustomerAction(req, model);

		// 이동할 페이지
		return "/customer/account/deletecustomerAction";
	}

	// 회원수정 인증 페이지
	@RequestMapping("customerUpdate")
	public String customerUpdate(HttpServletRequest req, Model model) {
		logger.info("[url ==> /customerUpdate.us]");

		// 이동할 페이지
		return "/customer/account/customerUpdate";
	}

	// 회원수정 인증 처리 후 수정 페이지
	@RequestMapping("customerDetailAction")
	public String customerDetailAction(HttpServletRequest req, Model model) {

		logger.info("[url ==> /customerDetailAction]");

		service.modifyDetailAction(req, model);

		// 이동할 페이지
		return "/customer/account/customerDetailAction";
	}

	// 회원수정 처리 페이지
	@RequestMapping("customerUpdateAction")
	public String customerUpdateAction(HttpServletRequest req, Model model) {

		logger.info("[url ==> /customerUpdateAction.us]");

		service.modifyCustomerAction(req, model);

		// 이동할 페이지
		return "/customer/account/customerUpdateAction";
	}

	// 마이페이지(탁곤)
	@RequestMapping("myPage")
	public String mypage(HttpServletRequest req, Model model) {
		System.out.println("url ==> mypage");
		logger.info("url ==> mypage");

		return "customer/myPage";
	}

	// 아이디 찾기 페이지(탁곤)
	@RequestMapping("idFind.do")
	public String idFind(HttpServletRequest req, Model model) {
		System.out.println("url ==> idFind.do");
		logger.info("url ==> idFind.do");

		return "customer/account/idFind";
	}

	// 아이디 찾기 액션(탁곤)
	@RequestMapping("idFindAction.do")
	public String idFindAction(HttpServletRequest req, Model model) {
		System.out.println("url ==> idFindAction.do");
		logger.info("url ==> idFindAction.do");
		service.idFindAction(req, model);
		return "customer/account/idFindAction";
	}

	// 비밀번호 찾기 페이지(탁곤)
	@RequestMapping("pwFind.do")
	public String pwFind(HttpServletRequest req, Model model) {
		System.out.println("url ==> pwFind.do");
		logger.info("url ==> pwFind.do");

		return "customer/account/pwFind";
	}

	// 비밀번호 찾기 액션(탁곤)
	@RequestMapping("pwFindAction.do")
	public String pwFindAction(HttpServletRequest req, Model model) {
		System.out.println("url ==> pwFindAction.do");
		logger.info("url ==> pwFindAction.do");
		service.pwFindAction(req, model);
		return "customer/account/pwFindAction";
	}

	// 예금 상품 조회(지현) depositList
	@RequestMapping("depositList.do")
	public String depositList(HttpServletRequest req, Model model) {
		logger.info("url => depositList");

		service.depositList(req, model);

		return "customer/depositProduct/depositList";
	}

	// 예금상품검색(지현)
	@RequestMapping("depositProductSearch.do")
	public String depositProductSearch(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /depositProductSearch]");
		service.searchDepositProduct(req, model);
		return "customer/depositProduct/depositProductSearch";
	}

	// 예금 상품 상세 보기 (지현)
	@RequestMapping("depositDetail.do")
	public String depositDetail(HttpServletRequest req, Model model) {
		logger.info("url => depositDetail");

		service.depositDetail(req, model);

		return "customer/depositProduct/depositDetail";
	}

	//예금 상품 상세에서 신청하기 누르면  신청 화면 (지현)
	@RequestMapping("depositProductJoin")
	public String depositProductInsert(HttpServletRequest req, Model model) {
		logger.info("url => depositProductJoin");
		
		service.setDepositProductJoin(req, model);
		
		return "customer/depositProduct/depositProductJoin";
	}
	
	//예금 상품 신청 화면에서 확인 눌렀을때 -> account 계좌 생성 & deposit 테이블에 insert(지현)
	@RequestMapping("depositProductAction")
	public String depositAccess(HttpServletRequest req, Model model) {
		logger.info("url => depositAccess");
	      
		 //연금 용 계좌개설 insert account
         service.makeDepositAccount(req, model);
         
         System.out.println("계좌 개설 후 예금 테이블 insert service go ======");
         
         //예금 상품  insert
         service.insertDeposit(req, model);
         
		return "customer/depositProduct/depositAction";
	}
	
	//연금 상품 목록 (지현)
	@RequestMapping("irpProductList.do")
	public String irpProductList(HttpServletRequest req, Model model) {
		logger.info("url => irpProductList");
		
		service.irpList(req, model);
		
		return "customer/irp/irpProductList";
	}
	
	//연금 상품검색(지현) - 고객
	@RequestMapping("irpProductSearch.do")
	public String irpProductSearch(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /irpProductSearch]");
		
		service.irpProductSearch(req, model);
		
		return "customer/irp/irpProductSearch";
	}
	
	//연금 상품 상세 보기 (지현) -고객
	@RequestMapping("irpDetail.do")
	public String irpDetail(HttpServletRequest req, Model model) {
		logger.info("url => irpDetail");
		
		service.irpDetail(req, model);
		
		return "customer/irp/irpDetail";
	}
	
	//연금 상품 신청화면(지현) - 고객
	@RequestMapping("irpProductJoin")
	public String irpProductAction(HttpServletRequest req, Model model) {
		logger.info("url => irpProductJoin");
		
		service.irpProductJoin(req, model);
		
		return "customer/irp/irpProductJoin";
	}	
	
	//연금 상품 신청 화면에서 확인 눌렀을때 -> account 계좌 생성 & irp 테이블에 insert(지현)
	@RequestMapping("irpProductAction")
	public String irpAccess(HttpServletRequest req, Model model) {
		logger.info("url => irpProductAction");
	      
		 //연금용 계좌 개설 insert account
		service.makeIrpAccount(req, model);
         
         System.out.println("계좌 개설 후 예금 테이블 insert service go ======");
         
         //연금 상품  insert
         service.insertIrp(req, model);
         
		return "customer/irp/irpAction";
	}
		

	//적금 상품 조회(지호) - 고객
	@RequestMapping("savingList")
	public String savingList(HttpServletRequest req, Model model) {
		logger.info("url => savingList");
		
		service.savingList(req, model);
		
		return "customer/savingProduct/savingList";
	}
	
	//적금 상품검색(지호) - 고객
	@RequestMapping("savingProductSearch")
	public String savingProductSearch(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /savingProductSearch]");
		service.savingProductSearch(req, model);
		return "customer/savingProduct/savingProductSearch";
	}
	
	//적금 상품 상세 보기 (지호) -고객
	@RequestMapping("savingDetail")
	public String savingDetail(HttpServletRequest req, Model model) {
		logger.info("url => savingDetail");
		
		service.savingDetail(req, model);
		
		return "customer/savingProduct/savingDetail";
	}
	
	//적금 상품 신청(지호)
	@RequestMapping("savingProductInsert")
	public String savingProductInsert(HttpServletRequest req, Model model) {
		logger.info("url => savingProductInsert");
		
		service.savingProductAction(req, model);
		
		return "customer/savingProduct/savingProductJoin";
	}	
	
	// 적금 상품 신청 처리(지호) 해야함
	@RequestMapping("savingProductAction")
	public String savingProductAction(HttpServletRequest req, Model model) {
		logger.info("url => savingProductAction");
		
		return "customer/savingProduct/savingProductAction";
	}
	
	//예금 상품 상세에서 신청하기 누르면  신청 화면 (지현)
//	@RequestMapping("depositProductJoin")
//	public String depositProductInsert(HttpServletRequest req, Model model) {
//		logger.info("url => depositProductJoin");
//		
//		service.setDepositProductJoin(req, model);
//		
//		return "customer/depositProduct/depositProductJoin";
//	}
	
	//
	// 펀드 상품 조회(지호) - 고객
	@RequestMapping("fundList")
	public String fundList(HttpServletRequest req, Model model) {
		logger.info("url => fundList");
		
		service.fundList(req, model);
		
		return "customer/fundProduct/fundList";
	}
	
	// 펀드 상품검색(지호) - 고객
	@RequestMapping("fundProductSearch")
	public String fundProductSearch(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /fundProductSearch]");
		service.fundProductSearch(req, model);
		return "customer/fundProduct/fundProductSearch";
	}
	
	// 펀드 상품 상세 보기 (지호) -고객
	@RequestMapping("fundDetail")
	public String fundDetail(HttpServletRequest req, Model model) {
		logger.info("url => savingDetail");
		
		service.fundDetail(req, model);
		
		return "customer/fundProduct/fundDetail";
	}
	
	// 펀드 상품 신청(지호)
	@RequestMapping("fundProductInsert")
	public String fundProductInsert(HttpServletRequest req, Model model) {
		logger.info("url => fundProductInsert");
		
		service.fundProductAction(req, model);
		
		return "customer/fundProduct/fundProductInsert";
	}	
	
	// 펀드 상품 신청 처리(지호) 해야함
	@RequestMapping("fundProductAction")
	public String fundProductAction(HttpServletRequest req, Model model) {
		logger.info("url => fundProductAction");
		
		return "customer/fundProduct/fundProductAction";
	}
	
	//qna 게시판(지현)
	@RequestMapping("qnaList")
	public String qnaList(HttpServletRequest req, Model model) {
		logger.info("url => qnaList");

		// 회원qna리스트 출력 메서드 service
		service.inquiryList(req, model);

		return "customer/qna/qnaList";
	}

	// qna 작성 게시판 (지현)
	@RequestMapping("qnaWrite")
	public String qnaWrite(HttpServletRequest req, Model model) {
		logger.info("url => qnaWrite");
		// 3단계. 신규 글- url으로부터 입력받은 값(get방식 값)을 받아온다.
		// boardWrite.bo?num=${dto.num}&pageNum=${pageNum}
		int inquiry_id = 0;
		int pageNum = 0;
		int inquiry_ref = 0;

		pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 3단계. 상세 페이지의 답글 쓰기 -url으로부터 입력받은 값(get방식 값)을 받아온다.
		// boardWrite.bo?num=${dto.num}&pageNum=${pageNum}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}'
		// 상세 페이지의 답글 쓰기 버튼 클릭시의 get방식의 url에서 값을 받는다.
		if (req.getParameter("inquiry_id") != null) {
			inquiry_id = Integer.parseInt(req.getParameter("inquiry_id"));
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		// 4단계jsp로 전달하기 위해 처리 결과 저장
		req.setAttribute("inquiry_id", inquiry_id);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("inquiry_ref", inquiry_ref);

		return "customer/qna/qnaWrite";
	}

	// qna 작성 처리페이지(지현)
	@RequestMapping("qnaWriteAction")
	public String qnaWriteAction(HttpServletRequest req, Model model) {
		logger.info("url => qnaWriteAction");

		service.inquiryWriteAction(req, model);

		return "customer/qna/qnaWriteAction";
	}

	// qna 상세보기 (지현)
	@RequestMapping("qnaDetail")
	public String qnaDetail(HttpServletRequest req, Model model) {
		logger.info("url => qnaDetail");

		service.InquiryDetailAction(req, model);

		return "customer/qna/qnaDetail";
	}

	// qna 비밀번호 check(지현)
	@RequestMapping("qnaModifyCheck")
	public String qnaModifyCheck(HttpServletRequest req, Model model) {
		logger.info("url => qnaModifyCheck");

		int inquiry_id = Integer.parseInt(req.getParameter("inquiry_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 4단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("inquiry_id", inquiry_id);
		req.setAttribute("pageNum", pageNum);

		return "customer/qna/qnaModifyCheck";
	}

	// qna 수정 상세 페이지 (지현)
	@RequestMapping("qnaModifyDetail")
	public String qnaModifyDetail(HttpServletRequest req, Model model) {
		logger.info("url => qnaModifyDetail");

		service.InquiryModifyDetailAction(req, model);

		return "customer/qna/qnaModifyDetail";

	}

	// 수정비밀번호 (지현)
	@RequestMapping("qnaConfirm")
	public String qnaConfirm(HttpServletRequest req, Model model) {

		service.QnaPasswordConfirm(req, model);

		return "customer/qna/qnaConfirm";
	}

	// qna 수정 처리 페이지 (지현)
	@RequestMapping("qnaModifyAction")
	public String qnaModifyAction(HttpServletRequest req, Model model) {
		logger.info("url => qnaModifyAction");

		service.inquiryModifyAction(req, model);

		return "customer/qna/qnaModifyAction";
	}

	// 삭제 처리 (지현)
	@RequestMapping("qnaDeleteAction")
	public String qnaDeleteAction(HttpServletRequest req, Model model) {
		logger.info("url => qnaDeleteAction");

		service.inquiryDelete(req, model);

		return "customer/qna/qnaDeleteAction";
	}

	// 자주묻는 질문 (지현)
	@RequestMapping("faqList.do")
	public String faqList(HttpServletRequest req, Model model) {
		logger.info("url => faqList");

		service.faqList(req, model);

		return "customer/qna/faqList";
	}

	// 환율 리스트 출력(지호)
	@RequestMapping("exchangeList.do")
	public String exchangeList(HttpServletRequest req, Model model) {
		System.out.println("url ==> exchangeList.do");

		//service.exchangeList(req, model);

		return "exchangeList";
	}

	// 환전하기 (지호)
	@RequestMapping("exchange.do")
	public String exchange(HttpServletRequest req, Model model) {
		System.out.println("url ==> exchange.do");

		return "exchange";
	}

	// 회원 이체(계좌 찾기)(유성)
	@RequestMapping("transfer")
	public String transfer(HttpServletRequest req, Model model) {
		System.out.println("ulr ==> transfer");
		logger.info("url ==> transfer");

		service.getAccount(req, model);

		return "customer/bank/transfer";
	}

	// 회원 이체(계좌 비밀번호 인증)(유성)
	@RequestMapping("account_confirm")
	public String account_password(HttpServletRequest req, Model model) {
		System.out.println("ulr ==> account_confirm");
		logger.info("url ==> account_confirm");

		// service.accountPwdConfirm(req, model);

		return "customer/bank/account_confirm";
	}
	
	//!!!!!!!!!!지은!!!!!!!!!!!
	
	//대출 납입 목록(지현)
	@RequestMapping("loanHistoryList.do")
	public String loanHistoryList(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanHistoryList]");
		service.loanHistoryList(req, model);
		
		return "customer/loan/loanHistoryList";
	}

	// 대출중인 상품 목록
	@RequestMapping("loanAccountList.do")
	public String loanAccountList(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanAccountList]");
		service.loanList(req, model);
		return "customer/loan/loanAccountList";
	}

	// 대출 계좌 거래내역
	@RequestMapping("loanAccountDetail.do")
	public String loanAccountDetail(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanAccountDetail]");
		return "customer/loan/loanAccountDetail";
	}

	// 대출 해지 목록
	@RequestMapping("loanCancelList.do")
	public String loanCancelList(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanCancelList]");
		service.loanCancelList(req, model);
		return "customer/loan/loanCancelList";
	}

	// 대출 해지 상세
	@RequestMapping("loanCancelDetail.do")
	public String loanCancelDetail(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanCancelDetail]");
		return "customer/loan/loanCancelDetail";
	}

	// 대출 자동이체
	@RequestMapping("loanDirectDebit.do")
	public String loanDirectDebit(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanDirectDebit]");
		return "customer/loan/loanDirectDebit";
	}

	// 대출 원금 목록
	@RequestMapping("loanPrincipalList.do")
	public String loanPrincipalList(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanPrincipalList]");
		return "customer/loan/loanPrincipalList";
	}
	
	// 대출 상환 예정표 
	@RequestMapping("loanPrincipalRateList.do")
	public String loanPrincipalRateList(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanPrincipalRateList]");
		service.loanPrincipalRateList(req, model);
		return "customer/loan/loanPrincipalRateList";
	}
	 
	// 나의 대출 상환 내역 상세 (진지현)
	@RequestMapping("myLoanList.do")
	public String myLoanList(HttpServletRequest req, Model model) {
		logger.info("[url => myLoanList]");
		
		service.myLoanList(req, model);
		System.out.println("wow");
		
		return "customer/loan/myLoanList";
	}

	// 대출 원금 상세
	@RequestMapping("loanPrincipalDetail.do")
	public String loanPrincipalDetail(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanPrincipalDetail]");
		return "customer/loan/loanPrincipalDetail";
	}

	// 대출 원금 납부
	@RequestMapping("loanPrincipalPayment.do")
	public String loanPrincipalPayment(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanPrincipalPayment]");
		return "customer/loan/loanPrincipalPayment";
	}

	// 대출 이자 목록
	@RequestMapping("loanRateList.do")
	public String loanRateList(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanRateList]");
		return "customer/loan/loanRateList";
	}

	// 대출 이자 상세
	@RequestMapping("loanRateDetail.do")
	public String loanRateDetail(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanRateDetail]");
		return "customer/loan/loanRateDetail";
	}

	// 대출 이자 납부
	@RequestMapping("loanRatePayment.do")
	public String loanRatePayment(HttpServletRequest req, Model model) {
		logger.info("[url ==> /loanRatePayment]");
		return "customer/loan/loanRatePayment";
	}

	// 대출 상품 목록
	@RequestMapping("newLoanList.do")
	public String newLoanList(HttpServletRequest req, Model model) {
		logger.info("[url ==> /newLoanList]");
		
		service.loanProductList(req, model);
		return "customer/loan/newLoanList";
	}

	// 대출 상품 상세
	@RequestMapping("newLoanDetail.do")
	public String newLoanDetail(HttpServletRequest req, Model model) {
		logger.info("[url ==> /newLoanDetail]");
		service.newLoanDetail(req, model);
		return "customer/loan/newLoanDetail";
	}

	// 신규대출폼
	@RequestMapping("newLoanSign.do")
	public String newLoanSign(HttpServletRequest req, Model model) {
		logger.info("[url ==> /newLoanSign]");
		service.signInfo(req, model);
		return "customer/loan/newLoanSign";
	}
	
	// 신규대출신청
	@RequestMapping("newLoanSignAction.do")
	public String newLoanSignAction(HttpServletRequest req, Model model) throws ParseException {
		logger.info("[url ==> /newLoanSign]");
		service.newLoanSignAction(req, model);
		return "customer/loan/newLoanSignAction";
	}

	// 대출약관
	@RequestMapping("terms.do")
	public String terms(HttpServletRequest req, Model model) {
		logger.info("[url ==> /terms]");
		return "customer/loan/terms";
	}

	@RequestMapping("searchLoanProductList.do")
	public String searchLoanProductList(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /searchLoanProductList]");
		service.searchLoanProductList(req, model);
		return "customer/loan/searchLoanProductList";
	}
	//!!!!!!!!!!지은!!!!!!!!!!!

	// 회원 자동 이체(유성)
	@RequestMapping("auto_transfer")
	public String auto_transfer(HttpServletRequest req, Model model) {
		System.out.println("ulr ==> auto_transfer");
		logger.info("url ==> auto_transfer");

		return "customer/bank/auto_transfer";
	}

	// 회원 다계좌 이체(유성)
	@RequestMapping("transfer_one_to_num")
	public String transfer_one_to_num(HttpServletRequest req, Model model) {
		System.out.println("ulr ==> transfer_one_to_num");
		logger.info("url ==> transfer_one_to_num");

		return "customer/bank/transfer_one_to_num";
	}

	
	// 예금리스트(민재)
	@RequestMapping("deposit.do")
	public String deposit(HttpServletRequest req, Model model) {
		
		logger.info("[url ==> /deposit.us]");
		
		service.myDepositList(req, model);
		
		// 이동할 페이지
		return "customer/myaccount/myDepositList";
	}
	
	// 예금서브리스트(민재)
	@RequestMapping("myDepositSubList.do")
	public String subList(HttpServletRequest req, Model model) {
		
		logger.info("[url ==> /myDepositSubList.us]");
		
		service.myDepositSubList(req, model);
		
		// 이동할 페이지
		return "customer/myaccount/myDepositSubList";
	}
	
	// 적금리스트(민재)
	@RequestMapping("saving.do")
	public String saving(HttpServletRequest req, Model model) {
		
		logger.info("[url ==> /saving.us]");
		
		service.mySavingList(req, model);
		
		// 이동할 페이지
		return "customer/myaccount/mySavingList";
	}
	
	// 적금서브리스트(민재)
	@RequestMapping("mySavingSubList.do")
	public String mySavingSubList(HttpServletRequest req, Model model) {
		
		logger.info("[url ==> /myDepositSubList.us]");
		
		service.mySavingSubList(req, model);
		
		// 이동할 페이지
		return "customer/myaccount/mySavingSubList";
	}
	
	// 연금리스트(민재)
	@RequestMapping("irp.do")
	public String irp(HttpServletRequest req, Model model) {
		
		logger.info("[url ==> /irp.us]");
		
		service.myIrpList(req, model);
		
		// 이동할 페이지
		return "customer/myaccount/myIRPList";
	} 
	
	// 공지사항리스트(민재)
	@RequestMapping("noticeList.do")
	public String noticeList(HttpServletRequest req, Model model) {
		
		logger.info("[url ==> /noticeList.us]");
		
		service.noticeList(req, model);
		
		// 이동할 페이지
		return "customer/notice/noticeList";
	}
	
	// 공지사항상세페이지(민재)
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(HttpServletRequest req, Model model) {
		
		logger.info("[url ==> /noticeList.us]");
		
		service.noticeDetailAction(req, model);
		
		// 이동할 페이지
		return "customer/notice/noticeDetail";
	}

	// 회원 이체(유성)
	@RequestMapping("transfer_confirm")
	public String transfer_confirm(HttpServletRequest req, Model model) {
		System.out.println("ulr ==> transfer_confirm");
		logger.info("url ==> transfer_confirm");

		return "customer/bank/transfer_confirm";
	}

	// 회원 이체 내역(유성)
	@RequestMapping("transfer_List")
	public String transfer_List(HttpServletRequest req, Model model) {
		System.out.println("ulr ==> transfer_List");
		logger.info("url ==> transfer_List");

		return "customer/bank/transfer_List";
	}

	// 회원 자동이체 내역(유성)
	@RequestMapping("auto_transfer_List")
	public String auto_transfer_List(HttpServletRequest req, Model model) {
		System.out.println("ulr ==> auto_transfer_List");
		logger.info("url ==> auto_transfer_List");

		return "customer/bank/auto_transfer_List";
	}

	// 가계부 페이지
	@RequestMapping("accountBook")
	public String accountBook(HttpServletRequest req, Model model) {
		System.out.println("url ==> accountBook");
		service.getAccountBook(req, model);
		return "customer/accountBook";
	}
	
	// 가계부 내역 추가
	@RequestMapping("insertAccountBook")
	public String insertAccountBook(HttpServletRequest req, Model model) {
		logger.info("url ==> insertAccountBook");
		
		service.insertAccountBook(req, model);
		
		return "redirect:accountBook";
	}
	
	// 가계부 내역 삭제
	@RequestMapping("deleteAccountBook")
	public String deleteAccountBook(HttpServletRequest req, Model model) {
		logger.info("url ==> deleteAccountBook");
		
		service.deleteAccountBook(req, model);
		
		return "redirect:accountBook";
	}
	
	// 은행별 계좌조회(복환)
	@RequestMapping("myAccountList")
	public String myAccountList(HttpServletRequest req, Model model) {
		
		
		return "customer/bank/myAccountList";
	}
	
	// 은행별 계좌조회(복환)
	@ResponseBody
	@RequestMapping("myAccountListSelect")
	public ArrayList<AccountVO> myAccountListSelect(HttpServletRequest req, Model model) {
		
		
		return service.getAccountList(req, model);
	}
	
	// 계좌연동확인
	@RequestMapping("accountConnect")
	public String accountConnect(HttpServletRequest req, Model model) {
		
		// 계좌 체크 후 뿌리기
		service.accountConnectCheck(req, model);
		
		return "customer/bank/accountConnect";
	}
	
	// 계좌연동하기
	@ResponseBody
	@RequestMapping("accountConnectAction")
	public int accountConnectAction(HttpServletRequest req, Model model) {
		// 계좌 연동
		return service.accountConnectAction(req, model);
	}
	
	// 계좌연동관리
	@RequestMapping("accountConnectedList")
	public String accountConnectedList(HttpServletRequest req, Model model) {
		// 계좌 연동관리
		service.accountConnectedList(req, model);
		
		return "customer/bank/myAccountConnect";
	}
	
	// 계좌연동하기
	@ResponseBody
	@RequestMapping("accountDisConnectAction")
	public int accountDisConnectAction(HttpServletRequest req, Model model) {
		
		// 계좌 연동
		return service.accountDisConnectAction(req, model);
	}
	
	// 중복로그인 감지
	@RequestMapping("sessionErr")
	public String SessionError(HttpServletRequest req, Model model) {
		
		return "common/sessionErr";
	}
	
	// 회원 - 자동이체 신청 페이지
	@RequestMapping("autoTransferInsert")
	public String autoTransferInsert(HttpServletRequest req, Model model) {
		logger.info("url ==> autoTransferInsert");
		service.accountLoad(req, model); // 회원연동계좌조회
		return "customer/bank/autoTransferInsert";
	}

	// 회원 - 자동이체 신청 액션
	@RequestMapping("autoTransferInsertAction")
	public String autoTransferInsertAction(HttpServletRequest req, Model model) {
		logger.info("url ==> autoTransferInsertAction");
		service.insertAutoTransfer(req, model);
		return "customer/bank/autoTransferInsertAction";
	}
		
	// 회원 - 자동이체 내역조회
	@RequestMapping("autoTransferList")
	public String autoTransferList(HttpServletRequest req, Model model) {
		logger.info("url ==> autoTransferList");
		service.getMyAutoTransfer(req, model);
		return "customer/bank/autoTransferList";
	}
	
	// 회원 - 자동이체 해지
	@RequestMapping("autoTransferDelete")
	public String autoTransferDelete(HttpServletRequest req, Model model) {
		logger.info("url ==> autoTransferDelete");
		service.deleteAutoTransfer(req, model);
		return "customer/bank/autoTransferDelete";
	}
}
