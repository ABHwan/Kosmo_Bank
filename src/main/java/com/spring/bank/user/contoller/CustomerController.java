package com.spring.bank.user.contoller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

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

import com.spring.bank.user.service.CustomerServiceImpl;

@Controller
@RequestMapping("customer")
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerServiceImpl service;
	
	@Inject
	private JavaMailSender javaMailSender;
	
	// main 화면(크롤링, 지호)
	@RequestMapping("index.do")
	public String home(HttpServletRequest req, Model model) {
		System.out.println("url ==> index");
		service.exchanges(req, model);
		return "index";
	}
	
	// 회원가입 페이지
	@RequestMapping("register.do")
	public String register(HttpServletRequest req, Model model) {
		
		return "customer/account/register";
	}
	
	// 회원가입 중복확인 페이지 confirmId.do
	@ResponseBody
	@RequestMapping(value="confirmId.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int confirId(HttpServletRequest req, Model model) {
		System.out.println("[url => confirId]");
		
		String member_id = req.getParameter("member_id");
		
		System.out.println(member_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		
		
		
		return service.confirmIdAction(map);
	}
	
	// 회원본인인증
	@RequestMapping(value="authResult.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String callAPIhttp(HttpServletRequest req, Model model) throws Exception {
		System.out.println("[url => authResult]");
		logger.info("[url => authResult]");
		
		StringBuffer result = new StringBuffer();
		
		req.setCharacterEncoding("UTF-8");
		
			String code = req.getParameter("code");
			
			String urlstr = "https://testapi.openbanking.or.kr/oauth/2.0/token?" + // 클라이언트가 요청을 보낼 서버의 URL 주소
				"code="+ code +"&" +
				"client_id=072579e4-c1b5-4ad1-a6a4-78c69cab659c&" +
				"client_secret=6e5b6b5d-4aa9-4a53-90a0-deeb196c10ee&" +
			    "redirect_uri=http://localhost/bank/customer/authResult.do&" +
			    "grant_type=authorization_code";
			
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("POST");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			String returnLine;
			
			while((returnLine = br.readLine()) != null) {
				result.append(returnLine);
				System.out.println(br.readLine());
			}
			
			urlconnection.disconnect();
			
			System.out.println(result.toString());
			
			req.setAttribute("json", result);
			
			return "customer/account/authToken";
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
	
	/*
	 * // 로그인 처리
	 * 
	 * @RequestMapping("loginAction") public String loginAction(HttpServletRequest
	 * req, Model model) { logger.info("url ==> loginAction");
	 * 
	 * service.loginAction(req, model);
	 * 
	 * return "customer/account/login"; }
	 */
		
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
		return  "/customer/account/deletecustomerAction";
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
	
	//예금 상품 조회(지현) depositList
	@RequestMapping("depositList.do")
	public String depositList(HttpServletRequest req, Model model) {
		logger.info("url => depositList");
		
		service.depositList(req, model);
		
		return "customer/depositProduct/depositList";
	}
	
	//예금상품검색(지현)
	@RequestMapping("depositProductSearch.do")
	public String depositProductSearch(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /depositProductSearch]");
		service.searchDepositProduct(req, model);
		return "customer/depositProduct/depositProductSearch";
	}
	
	//예금 상품 상세 보기 (지현)
	@RequestMapping("depositDetail.do")
	public String depositDetail(HttpServletRequest req, Model model) {
		logger.info("url => depositDetail");
		
		service.depositDetail(req, model);
		
		return "customer/depositProduct/depositDetail";
	}
	
	//예금 상품 신청(지현)
	@RequestMapping("depositProductAction")
	public String depositProductInsert(HttpServletRequest req, Model model) {
		logger.info("url => depositProductInsert");
		
		service.insertDeposit(req, model);
		
		return "customer/depositProduct/depositProductAction";
	}
	
	//qna 게시판(지현)
	@RequestMapping("qnaList")
	public String qnaList(HttpServletRequest req, Model model) {
		logger.info("url => qnaList");
		
		//회원qna리스트 출력 메서드 service
		service.inquiryList(req, model);
		
		return "customer/qna/qnaList";
	}
	
	//qna 작성 게시판 (지현)
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
	
	//qna 작성 처리페이지(지현)
	@RequestMapping("qnaWriteAction")
	public String qnaWriteAction(HttpServletRequest req, Model model) {
		logger.info("url => qnaWriteAction");
		
		service.inquiryWriteAction(req, model);
		
		return "customer/qna/qnaWriteAction";
	}
	
	//qna 상세보기 (지현)
	@RequestMapping("qnaDetail")
	public String qnaDetail(HttpServletRequest req, Model model) {
		logger.info("url => qnaDetail");
		
		service.InquiryDetailAction(req, model);
		
		return "customer/qna/qnaDetail";
	}
	
	//qna 비밀번호 check(지현)
	@RequestMapping("qnaModifyCheck")
	public String qnaModifyCheck(HttpServletRequest req, Model model) {
		logger.info("url => qnaModifyCheck");
		
		int inquiry_id = Integer.parseInt(req.getParameter("inquiry_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		//4단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("inquiry_id", inquiry_id);
		req.setAttribute("pageNum", pageNum);
		
		return "customer/qna/qnaModifyCheck";
	}
	
	//qna 수정 상세 페이지 (지현)
	@RequestMapping("qnaModifyDetail")
	public String qnaModifyDetail(HttpServletRequest req, Model model) {
		logger.info("url => qnaModifyDetail");
		
		service.InquiryModifyDetailAction(req, model);
		
		return "customer/qna/qnaModifyDetail";
		
	}
	
	//수정비밀번호 (지현)
	@RequestMapping("qnaConfirm")
	public String qnaConfirm(HttpServletRequest req, Model model) {
		
		service.QnaPasswordConfirm(req, model);
		
		return "customer/qna/qnaConfirm";
	}
	
	//qna 수정 처리 페이지 (지현)
	@RequestMapping("qnaModifyAction")
	public String qnaModifyAction(HttpServletRequest req, Model model) {
		logger.info("url => qnaModifyAction");
		
		service.inquiryModifyAction(req, model);
		
		return "customer/qna/qnaModifyAction";
	}
	
	
	//삭제 처리 (지현)
	@RequestMapping("qnaDeleteAction")
	public String qnaDeleteAction(HttpServletRequest req, Model model) {
		logger.info("url => qnaDeleteAction");
		
		service.inquiryDelete(req, model);
		
		return "customer/qna/qnaDeleteAction";
	}
	
	//자주묻는 질문 (지현)
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
		
		service.exchangeList(req, model);
		
		return "exchangeList";
	}
	
	// 환전하기 (지호)
	@RequestMapping("exchange.do")
	public String exchange(HttpServletRequest req, Model model) {
		System.out.println("url ==> exchange.do");
		
		return "exchange";
	}	

}
