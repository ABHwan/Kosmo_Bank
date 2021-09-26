package com.spring.bank.user.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.bank.customer.encrypt.UserAuthenticationService;
import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.user.dao.CustomerDAOImpl;
import com.spring.bank.user.vo.CrawlerVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.user.vo.UserVO;
import com.spring.bank.user.vo.faqVO;


@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAOImpl dao;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	JavaMailSender mailSender;
	
	// 아이디 중복확인
	@Override
	public int confirmIdAction(Map<String, Object> map) {
		
		System.out.println("[서비스 => ID 중복확인 처리]");
		
		System.out.println(map.get("member_id"));
		
		return dao.idCheck(map);
	}

	// 회원가입 처리
	@Override
	public void registerAction(HttpServletRequest req, Model model) {
		System.out.println("[서비스 => 회원가입 처리]");
		
		String access_token = req.getParameter("access_token");
		String refresh_token = req.getParameter("refresh_token");
		String user_seq_no = req.getParameter("user_seq_no");
		
		System.out.println("at : " + access_token);
		System.out.println("rt : " + refresh_token);
		System.out.println("usn : " + user_seq_no);
		
		
		// 3단계. 화면으로부터 입력 받은 값을 받아온다. 바구니에 담는다.
		UserVO vo = new UserVO();
		
		// String strID = req.getParameter("id");
		/*
		CREATE TABLE members(
		    id      VARCHAR2(20)    PRIMARY KEY,
		    password     VARCHAR2(20)    NOT NULL,                                              
		    name    VARCHAR2(20)     NOT NULL,
		    birth   DATE,
		    hp     NUMBER(11)      NOT NULL UNIQUE,
		    email   VARCHAR2(50)    UNIQUE,
		    zipcode NUMBER(5)       NOT NULL,
		    addr1 VARCHAR2(50)    NOT NULL,
		    addr2 VARCHAR2(50),
		    addr3 VARCHAR2(50),
		    indate    DATE          DEFAULT SYSDATE
		);
		*/
		String strPassword = bCryptPasswordEncoder.encode(req.getParameter("password"));
		
		String hp = "";
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		
		// hp가 필수가 아니므로 null 값이 들어올 수 있으므로 값이 존재할 때만 처리
		if(!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		
		email = email1 + "@" + email2;
		
		String zipcode= req.getParameter("address_zipcode");
		/*
		 * if(zipcode.length() == 4 ) { zipcode = "0" + zipcode; }
		 */
		
		vo.setMember_id(req.getParameter("id"));
		vo.setMember_password(strPassword);
		vo.setMember_name(req.getParameter("name"));
		vo.setMember_birth(Date.valueOf(req.getParameter("birth")));
		vo.setMember_hp(hp);
		vo.setMember_email(email);
		vo.setMember_zipcode(Integer.parseInt(zipcode));
		vo.setMember_addr1(req.getParameter("address_addr1"));
		vo.setMember_addr2(req.getParameter("address_addr2"));
		vo.setMember_addr3(req.getParameter("address_addr3"));
		vo.setAccess_token(req.getParameter("access_token"));
		vo.setRefresh_token(req.getParameter("refresh_token"));
		vo.setUser_seq_no(req.getParameter("user_seq_no"));
		
		// regDate는 입력값이 없으면 defalut가 sysdate
		vo.setMember_indate(new Timestamp(System.currentTimeMillis()));
		
		// CustomerDAOImpl dao = new CustomerDAOImpl();
		// 4단계. 싱글톤 방식으로 dao 객체 생성
		
		// 5단계. 회원가입 처리
		int insertCnt = dao.insertUser(vo);
		System.out.println("insertCnt : " + insertCnt);
		
		// 6단계. jsp로 결과 전달(request나 session으로 처리 결과를 저장 후)
		req.setAttribute("insertCnt", insertCnt);
		model.addAttribute("selectCnt", insertCnt);
		// 이메일 인증
		req.setAttribute("email", email);
	}
	
	// 이메일 인증 성공 처리
//	@Override
//	public void emailSuccess(HttpServletRequest req, Model model) {
//		String email = req.getParameter("email");
//		
//		UserVO vo = new UserVO();
//		
//		vo.setEmail(email);
//		vo.setKey(1);
//		
//		dao.emailSuccess(vo);
//		
//	}

	@Override
	public void deleteCustomerAction(HttpServletRequest req, Model model) {
		System.out.println("[서비스 => 회원탈퇴 처리]");
		
		// 3단계. 화면으로부터 입력 받은 값을 가져오기
		String id = (String) req.getSession().getAttribute("userID");
		
		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		// 5-1단계. 회원탈퇴 인증 처리
		int deleteCnt = 0;
		
		// 5-2단계. 인증성공 시 탈퇴처리
		if(id != null) {
			deleteCnt = dao.deleteUser(id);
			System.out.println("deleteCnt : " + deleteCnt);
		}
		
		// 6단계. jsp로 결과 전달(request나 session으로 처리 결과를 저장 후)
		req.setAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void modifyDetailAction(HttpServletRequest req, Model model) {
		
		System.out.println("[서비스 => 회원수정 인증 및 상세화면]");
		
		String id = (String) req.getSession().getAttribute("userID");
		
		UserAuthenticationService confirm = new UserAuthenticationService(sqlSession);
		
		// 3단계. 화면으로부터 입력 받은 값을 가져오기
		
		System.out.println("세션 아이디 : " + id);
		String password = req.getParameter("password");
		
		String ecPassword = confirm.loadUserByUsername(id).getPassword();
		
		
		String encodePassword = ecPassword.replace("{bcrypt}", "");
		
		boolean chk = bCryptPasswordEncoder.matches(password, encodePassword);
		
		System.out.println(chk);
		
		System.out.println("password : " + password);
		System.out.println("ecPassword : " + ecPassword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", encodePassword);
		
		
		// 5-1단계. 회원수정 인증 처리
		int idPwdChkCnt = dao.idPasswordChk(map);
		
		// 5-2단계. 인증성공 시 상세 정보 조회
		UserVO vo = null;
		if(chk) {
			vo = dao.getUserInfo(id);
			System.out.println("타니?");
		}
		
		System.out.println("vo : " + vo.getMember_name());
		System.out.println("vo : " + vo.getMember_birth());
		System.out.println("vo : " + vo.getMember_id());
		System.out.println("vo : " + vo.getMember_hp());
		System.out.println("vo : " + vo.getMember_email());
		System.out.println("vo : " + vo.getMember_zipcode());
		System.out.println("vo : " + vo.getMember_addr1());
		System.out.println("vo : " + vo.getMember_addr2());
		System.out.println("vo : " + vo.getMember_addr3());
		System.out.println("vo : " + vo.getMember_indate());
		
		
		System.out.println("idPwdChkCnt : " + idPwdChkCnt);
		
		// 6단계. jsp로 결과 전달(request나 session으로 처리 결과를 저장 후)
		req.setAttribute("selectCnt", idPwdChkCnt);
		req.setAttribute("vo", vo);
		
	}

	@Override
	public void modifyCustomerAction(HttpServletRequest req, Model model) {
		System.out.println("[서비스 => 회원수정 처리]");
		
		// 3단계. 화면으로부터 입력 받은 값을 가져오기
		String strId = (String) req.getSession().getAttribute("userID");
		String strPassword = req.getParameter("password");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", strId);
		map.put("password", strPassword);
		
		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		int idPwdCheck = dao.idPasswordChk(map);
		
		// id, password, name, hp, email
		UserVO vo = new UserVO();
		
		String hp = "";
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		// hp가 필수가 아니므로 null 값이 들어올 수 있으므로 값이 존재할 때만 처리
		if(!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String email = email1 + "@" + email2;
		
		
		String password = "";
		String passwordChange = req.getParameter("password_change");
		String enPasswordChange= bCryptPasswordEncoder.encode(passwordChange);
		
		
		if(idPwdCheck == 1) {
			// 비밀번호 변경 값이 존재하지 않을 때
			if(passwordChange == "") {
				// 기존 비밀번호 유지
				password = req.getParameter("password");
				
			// 비밀번호 변경 값이 존재할 때
			} else {
				// 비밀번호 변경 값으로 변경
				password = enPasswordChange;
			}
		}
		
		vo.setMember_name(req.getParameter("name"));
		vo.setMember_birth(Date.valueOf(req.getParameter("birth")));
		vo.setMember_id((String)req.getSession().getAttribute("userID"));
		vo.setMember_password(password);
		vo.setMember_hp(hp);
		vo.setMember_email(email);
		vo.setMember_zipcode(Integer.parseInt(req.getParameter("address_zipcode")));
		vo.setMember_addr1(req.getParameter("address_addr1"));
		vo.setMember_addr2(req.getParameter("address_addr2"));
		vo.setMember_addr3(req.getParameter("address_addr3"));
		
		
		// 5단계. 회원수정 인증 처리
		int updateCnt = dao.updateUser(vo);
		System.out.println("updateCnt : " + updateCnt);
		
		// 6단계. jsp로 결과 전달(request나 session으로 처리 결과를 저장 후)
		req.setAttribute("updateCnt", updateCnt);
	}

	// 회원 인증 화면
	@Override
	public void confirmAction(HttpServletRequest req, Model model) {
		
		System.out.println("[서비스 => 회원 인증 화면]");
		
		// 3단계. 화면으로부터 입력 받은 값을 가져오기
		String strId = (String) req.getSession().getAttribute("userID");
		String strPassword = req.getParameter("password");
		
		System.out.println("strId : " + strId);
		System.out.println("strPassword : " + strPassword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", strId);
		map.put("password", strPassword);
		
		// 4단계. 싱글톤 방식으로 dao 객체 생성, 다형성 적용
		int idPwdChkCnt = dao.idPasswordChk(map);
		
		System.out.println("idPwdChkCnt : " + idPwdChkCnt);
		// 6단계. jsp로 결과 전달(request나 session으로 처리 결과를 저장 후)
		req.setAttribute("selectCnt", idPwdChkCnt);
		
	}

	// id 찾기
	@Override
	public void idFindAction(HttpServletRequest req, Model model) {
		String member_name = req.getParameter("member_name");
		String member_email = req.getParameter("member_email");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_name", member_name);
		map.put("member_email", member_email);
		
		// id 찾기 처리
		UserVO vo = dao.idFind(map);
		if(vo != null) {
			System.out.println("찾은 id : " + vo.getMember_id());
		}
		
		// jsp로 결과 전달
		model.addAttribute("vo", vo);
	}

	// 임시비밀번호로 변경하고 이메일 전송
	@Override
	public void sendEmail(Map<String, Object> map) {
		try{
			
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "KOSMO BANK 임시비밀번호 전송메일입니다. <br/>" 
            		+ "임시비밀번호 : " + (String)map.get("member_password")
            		+ "<br/> 해당 비밀번호로 로그인 하시고 비밀번호 변경해주세요~!";
            message.setSubject("KOSMO BANK 임시비밀번호 전송메일입니다");
            message.setText(txt, "UTF-8", "html");
            message.setFrom(new InternetAddress("xkrrhsdl7@gmail.com")); // 보내는사람
            message.addRecipient(RecipientType.TO, new InternetAddress((String)map.get("member_email"))); // 받는사람
            mailSender.send(message);

      }catch(Exception e){
          e.printStackTrace();
      }
	}

	// 임시비밀번호로 재설정
	@Override
	public void pwFindAction(HttpServletRequest req, Model model) {
		// 입력한 정보로 멤버 정보 구해오기
		String member_name = req.getParameter("member_name");
		String member_email = req.getParameter("member_email");
		String member_id = req.getParameter("member_id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_name", member_name);
		map.put("member_email", member_email);
		map.put("member_id", member_id);
		
		UserVO vo = dao.customerFind(map);
		System.out.print("vo : " + vo);
		int updateCnt = 0;
				
		if(vo == null) {
			System.out.println("입력하신 정보로 회원정보를 찾을 수 없습니다.");
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			// 메일은 임시비밀번호 자체를 보내고
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("member_id", vo.getMember_id());
			sendMap.put("member_password", pw);
			sendMap.put("member_email", member_email);
			System.out.println("설정한 임시비밀번호 : " + pw);
			
			// 저장은 임시비밀번호를 암호화해서 저장한다.
			vo.setMember_password(bCryptPasswordEncoder.encode(pw));
			
			// 비밀번호 변경
			updateCnt = dao.updatePassword(vo);
			
			// 비밀번호 변경 메일 발송(아이디와 암호화되기전 비밀번호를 보낸다)
			sendEmail(sendMap);

		}
		System.out.println("updateCnt: " + updateCnt);
		model.addAttribute("updateCnt", updateCnt);
	}
	
	//문의내역 List
	@Override
	public void inquiryList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 5; // 한페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블록당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재페이지 시작 글 번호
		int end = 0; // 현재페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막페이지

		// 5-1단계. 게시글 갯수 조회
		cnt = dao.getInquiryCnt();

		System.out.println("cnt ==> " + cnt);

		// 5-2단계. 게시글 목록 조회
		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1페이지

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize +1;
		// 1 = (1 - 1 )* 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5 //1페이지
		// number = cnt- (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		System.out.println("--------------------------");

		List<InquiryVO> dtos = null;

		if (cnt > 0) {
			// 5-2단계. 게시글 목록 조회
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.getInquiryList(map);
		
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("dtos", dtos); // 게시글 목록
		req.setAttribute("cnt", cnt); // 글개수
		req.setAttribute("pageNum", pageNum); // 페이지 번호
		req.setAttribute("number", number); // 출력용 글번호

		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 한블럭당 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}

	}
	
	//QNA 글쓰기 처리
	@Override
	public void inquiryWriteAction(HttpServletRequest req, Model model) {
		int insertCnt = 0;
		
		InquiryVO vo = new InquiryVO();

		// 3-1단계. 화면으로부터 입력받은 값(hidden값)을 받아온다.
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 3-2단계. 화면으로부터 입력받은 값(input 값 = 작성자, 비밀번호, 글제목, 글내용)을 받아와서 바구니에 담는다
		vo.setMember_id(req.getParameter("customerID"));
		vo.setInquiry_title(req.getParameter("inquiry_title"));
		vo.setInquiry_content(req.getParameter("inquiry_content"));

		// 3-3단계. 작성일, IP
		vo.setInquiry_regDate(new Timestamp(System.currentTimeMillis()));
		// 화면실행시 url의 localhost 대신에 본인 IP를 넣으면 그 ip가 db에 insert된다.
		// 예)http://본인 ip/jsp_mvcQna_jjh/QnaList.bo
		/* vo.setIp(req.getRemoteAddr()); */

		// 5단계. 게시글 작성
		insertCnt = dao.insertInquiry(vo);
		System.out.println("insertCnt : " + insertCnt);

		// 6단계
		req.setAttribute("insertCnt", insertCnt);
		req.setAttribute("pageNum", pageNum);

	}

	//qna 상세보기 페이지
	@Override
	public void InquiryDetailAction(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// http://localhost/jsp_mvcBoard_jjh/boardDetail.bo?=num=30&pageNum=1&number=30
		int inquiry_id = Integer.parseInt(req.getParameter("inquiry_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));

		// 5-1단계. 조회수 증가
		// addReadCnt
		dao.addReadCnt(inquiry_id);

		// 5-2단계. 게시글 상세페이지 조회
		// getQnaDetail
		InquiryVO vo = dao.getQnaDetail(inquiry_id);

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("dto", vo);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("number", number);
	}
	
	//qna 수정 
	@Override
	public void InquiryModifyDetailAction(HttpServletRequest req, Model model) {

		int inquiry_id = Integer.parseInt(req.getParameter("inquiry_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		// 5-2 단계. 상세페이지 조회
		InquiryVO vo = dao.getQnaDetail(inquiry_id);

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("dto", vo);
		req.setAttribute("inquiry_id", inquiry_id);
		req.setAttribute("pageNum", pageNum);

	}
	
	//qna 수정 처리 
	@Override
	public void inquiryModifyAction(HttpServletRequest req, Model model) {

		System.out.println(req.getParameter("inquiry_id"));
		int inquiry_id = Integer.parseInt(req.getParameter("inquiry_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// QnaVO바구니 생성
		// 화면으로부터 입력받은 값(input값 - 작성자,비밀번호, 제목, 내용), num을 받아온다.
		InquiryVO vo = new InquiryVO();
		vo.setMember_id(req.getParameter("customerID"));
		vo.setInquiry_title(req.getParameter("inquiry_title"));
		vo.setInquiry_content(req.getParameter("inquiry_content"));
		vo.setInquiry_id(inquiry_id);

		// 5단계. 게시글 수정처리
		int updateCnt = dao.updateQna(vo);
		System.out.println("updateCnt : " + updateCnt);

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("updateCnt", updateCnt);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("inquiry_id", inquiry_id);
	}

	//수정, 삭제 할때 비밀번호 확인
	@Override
	public void QnaPasswordConfirm(HttpServletRequest req, Model model) {
		
		// 3단계. 화면으로부터 입력받은 값(input값)을 받아온다.
		String id = (String) req.getSession().getAttribute("customerID");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int inquiry_id = Integer.parseInt(req.getParameter("inquiry_id"));
		UserAuthenticationService confirm = new UserAuthenticationService(sqlSession);

		// 3단계. 화면으로부터 입력 받은 값을 가져오기

		System.out.println("세션 아이디 : " + id);
		String inquiry_password = req.getParameter("inquiry_password");

		String ecPassword = confirm.loadUserByUsername(id).getPassword();

		String encodePassword = ecPassword.replace("{bcrypt}", "");

		boolean chk = bCryptPasswordEncoder.matches(inquiry_password, encodePassword);
		
		int selectCnt =0;
		
		if(chk) {
			// QnaModify.bo?num=30&pageNum=1
			// hidden으로 넘어온 값(hidden 값) 받아온다.
			System.out.println(req.getParameter("inquiry_id"));
			// 5단계. 비밀번호 인증
			selectCnt = 1;
			System.out.println("qna 수정 , 삭제 시 비밀번호 확인 selectCnt = " + selectCnt);
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("inquiry_id",inquiry_id);
		model.addAttribute("pageNum", pageNum);
		
	}
	
	//qna 삭제 처리
	@Override
	public void inquiryDelete(HttpServletRequest req, Model model) {
		System.out.println("삭제처리 아이디 : " + req.getParameter("inquiry_id"));
		int inquiry_id = Integer.parseInt(req.getParameter("inquiry_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 5단계. 게시글 수정처리
		int deleteCnt = dao.deleteQna(inquiry_id);
		System.out.println("updateCnt : " + deleteCnt);

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("deleteCnt", deleteCnt);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("inquiry_id", inquiry_id);
	}

	//faq 조회
	@Override
	public void faqList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 8; // 한페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블록당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재페이지 시작 글 번호
		int end = 0; // 현재페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막페이지

		// 5-1단계. 게시글 갯수 조회
		cnt = dao.getFaqCnt();

		System.out.println("cnt ==> " + cnt);

		// 5-2단계. 게시글 목록 조회
		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1페이지

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize +1;
		// 1 = (1 - 1 )* 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5 //1페이지
		// number = cnt- (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		System.out.println("--------------------------");

		List<faqVO> dtos = null;

		if (cnt > 0) {
			// 5-2단계. 게시글 목록 조회
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.getFaqList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("dtos", dtos); // 게시글 목록
		req.setAttribute("cnt", cnt); // 글개수
		req.setAttribute("pageNum", pageNum); // 페이지 번호
		req.setAttribute("number", number); // 출력용 글번호

		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 한블럭당 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}

	}
	
	//예금 상품 조회
	@Override
	public void depositList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 8; // 한페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블록당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재페이지 시작 글 번호
		int end = 0; // 현재페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막페이지

		// 5-1단계. 게시글 갯수 조회
		cnt = dao.getDepositCnt();

		System.out.println("cnt ==> " + cnt);

		// 5-2단계. 게시글 목록 조회
		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1페이지

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize +1;
		// 1 = (1 - 1 )* 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5 //1페이지
		// number = cnt- (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		System.out.println("--------------------------");

		List<DepositProductVO> dtos = null;

		if (cnt > 0) {
			// 5-2단계. 게시글 목록 조회
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.getDepositList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("dtos", dtos); // 게시글 목록
		req.setAttribute("cnt", cnt); // 글개수
		req.setAttribute("pageNum", pageNum); // 페이지 번호
		req.setAttribute("number", number); // 출력용 글번호

		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 한블럭당 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}
	}
	
	//예금 상품 검색 
	@Override
	public void searchDepositProduct(HttpServletRequest req, Model model) {

		// 입력받은 검색어
		String search = req.getParameter("search");
		System.out.println("관리자 페이지 회원 검색어 : " + search);
		
		// 페이징
		int pageSize = 10;		// 한 페이지당 출력할 예금상품
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 예금상품 수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 검색 된 예금 상품 수 조회
		cnt = dao.getDepositProductSearchCnt(search);
		System.out.println("검색 된 예금 상품 수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫 페이지를 1페이지로 지정
		}
		
		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);	// 페이지 갯수 + 나머지가 있으면 1페이지 추가
		
		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;
		
		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1 ;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		// 출력용 글 번호
		//number = cnt - (currentPage - 1) * pageSize; 
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);
		
		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);
		
		System.out.println("===================================");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		
		ArrayList<DepositProductVO> dtos = null;
		if(cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.searchDepositProduct(map);
		}
		
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos);			// 검색된 예금 상품 목록
		model.addAttribute("cnt", cnt);				// 예금 상품 수
		model.addAttribute("pageNum", pageNum); 	// 페이지 번호
		model.addAttribute("number", number);		// 출력용 번호
		model.addAttribute("search", search);		// 검색어
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		// 시작 페이지
			model.addAttribute("endPage", endPage);			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);	// 현재 페이지
		}
	}
	
	//예금 상품 상세보기
	@Override
	public void depositDetail(HttpServletRequest req, Model model) {
		// http://localhost/jsp_mvcBoard_jjh/boardDetail.bo?=num=30&pageNum=1&number=30
		String deposit_product_name = req.getParameter("deposit_product_name");
		System.out.println("deposit_product_name : " + deposit_product_name);
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));

		// 5-2단계. 게시글 상세페이지 조회
		// getQnaDetail
		DepositProductVO vo = dao.getDepositDetail(deposit_product_name);

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("dto", vo);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("number", number);
	}
	
	//예금 신청 
	@Override
	public void insertDeposit(HttpServletRequest req, Model model) {
		String deposit_product_name = req.getParameter("deposit_product_name");
		
		//작은바구니 생성
		DepositProductVO vo = new DepositProductVO();
		
	}
	
	// 환율 데이터 입력 후 출력(지호)
	@Scheduled(cron = "0 0/5 9-17 * * *") // 9시부터 17시까지
	@Scheduled(fixedRate = 6000) // 1분마다 한번씩
	@Override
	public void exchanges(HttpServletRequest req, Model model) {
		
		String country ="";
		String strJson="";
		String rate="";
		String exchange_country="";
		JSONArray array = null;
		JSONObject obj = null;
		JSONObject obj2 = null;
		int num = 0;
		List<CrawlerVO> list = null;
		CrawlerVO vo = null;
		// db에 있는 환율 가져올 list
		//List<String> listRate =null;
		String listRate = "";
		try {
			strJson = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text().replaceAll("},] }", "} ]");
			// 0번째 부터 시작
			strJson = strJson.substring(strJson.indexOf("["));
			list = new ArrayList<CrawlerVO>();
			
			// JSONArray에 "리스트" : [] 출력
			array = new JSONArray(strJson);
			//System.out.println("array.length :" + array.length());	// 49
			// 환율 db체크
			obj2 = new JSONObject(array.get(1).toString());
			exchange_country = obj2.get("통화명").toString();
			num = dao.exchangeChk(exchange_country);
			System.out.println("num : " + num);
			
			// 환율 데이터 저장
			if(num != 1) {
				for(int i=0; i<array.length(); i++) {
					System.out.println("환율 데이터 저장");
					obj = new JSONObject(array.get(i).toString());
					country = obj.get("통화명").toString();
					rate = obj.get("매매기준율").toString();
					vo = new CrawlerVO(country, rate);
					dao.exchangeIn(vo);	
					
					// 화면 출력용
					if(i<6) {
						obj = new JSONObject(array.get(i).toString());
						country = obj.get("통화명").toString();
						rate = obj.get("매매기준율").toString();
						vo = new CrawlerVO(country, rate);
						list.add(vo);
					}
				
				}	
			}else {
				// 환율 최신화
				System.out.println("array.length :" + array.length());
				for(int i=0; i<array.length(); i++) {
					System.out.println("환율 최신화");
					obj = new JSONObject(array.get(i).toString());
					country = obj.get("통화명").toString();
					rate = obj.get("매매기준율").toString();
					vo = new CrawlerVO(country, rate);
					
					// 최신화 전 환율 비교
					listRate = dao.exchangeVary(country);
					
					//double lr = (((Double.parseDouble(rate)*100) / Double.parseDouble(listRate.get(i))) -100)*100;
					double lr = (((Double.parseDouble(rate)*100) / Double.parseDouble(listRate)) -100)*100;
					double compare = Math.round(lr*100)/100.0;
					System.out.println("lr : " + lr);
					// 최신화
					dao.exchangeUpd(vo);
					
					// 화면 출력용
					if(i<6) {
						obj = new JSONObject(array.get(i).toString());
						country = obj.get("통화명").toString();
						rate = obj.get("매매기준율").toString();
						vo = new CrawlerVO(country, rate, compare);
						list.add(vo);
					}
				}
			}
		}catch(Exception e) {
			
		}
		model.addAttribute("list", list);
	}
	
	//환율 목록 출력(지호)
	@Scheduled(cron = "0 0/5 9-17 * * *") // 9시부터 17시까지
	@Scheduled(fixedRate = 6000) // 1분마다 한번씩
	@Override
	public void exchangeList(HttpServletRequest req, Model model) {
		
		String strJson="";
		String exchange_country ="";
		String exchange_rate="";
		String exchange_buy="";
		String exchange_sell="";
		String exchange_transfer="";
		String exchange_recive="";
		JSONArray array = null;
		JSONObject obj = null;
		List<CrawlerVO> list = null;
		CrawlerVO vo = null;
		// db에 있는 환율 가져올 list
		try {
			strJson = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text().replaceAll("},] }", "} ]");
			// 0번째 부터 시작
			strJson = strJson.substring(strJson.indexOf("["));
			list = new ArrayList<CrawlerVO>();
			
			// JSONArray에 "리스트" : [] 출력
			array = new JSONArray(strJson);
			
			// 환율 데이터 저장
				for(int i=0; i<array.length(); i++) {
					System.out.println("환율 데이터 출력");
					obj = new JSONObject(array.get(i).toString());
					exchange_country = obj.get("통화명").toString();
					exchange_rate = obj.get("매매기준율").toString();
					exchange_buy = obj.get("현찰사실때").toString();
					exchange_sell = obj.get("현찰파실때").toString();
					exchange_transfer = obj.get("송금_전신환보내실때").toString();
					exchange_recive = obj.get("송금_전신환받으실때").toString();
					
					vo = new CrawlerVO(exchange_country, exchange_rate, exchange_buy, exchange_sell, exchange_transfer, exchange_recive);
					list.add(vo);
					
				}
		}catch(Exception e) {
			
		}
		model.addAttribute("list", list);
	}
}
