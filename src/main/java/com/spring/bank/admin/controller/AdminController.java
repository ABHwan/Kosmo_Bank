package com.spring.bank.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.bank.HomeController;
import com.spring.bank.admin.service.AdminServiceImpl;
import com.spring.bank.util.ImageUploaderHandler;



//@WebServlet("시작url") : 웹브라우저의 모든 요청은 하나의 서블릿에서 처리한다. 즉 모든 요청의 단일 진입점에서 시작 url을 지정
/*
Servlet => 클라이언트의 요청을 받아서 비즈니스 로직 처리, DB에 접근 등의 요청을 처리한 후, 
                 다시 사용자에게 응답하는 것이 주 역할임.
@WebServlet("시작url") : 웹브라우저의 모든 요청은 하나의 서블릿에서 처리한다. 
                                            즉 모든 요청의 단일 진입점에서 시작 url을 지정
@WebServlet의 속성 값을 통해 해당 Servlet과 매핑될 URL 패턴을 지정한다.
@WebServlet("/URL")의 URL 주소로 접속하면 톰켓 서버의 컨테이너가 매핑된 서블릿을 찾아 실행해 줍니다. 
*/
//http://localhost/jsp_mvcCustomer/*.do

//maxFileSize
//파일 1개당 최대 파일 크기입니다.
//
//maxRequestSize
//전체 요청의 크기 크기입니다.
//
//location
//기본값은 해당 자바가 실행되는 temp 폴더입니다.
//(정확히 알수 없다면 정해주는 편이 좋습니다.)
//
//fileSizeThreshold
//입력하지 않을 경우 기본값은 0 입니다.
//여기서 설정한 용량을 넘어갈 경우 location 에 upload_e1969376_b006_4781_b1cc_006e6e948798_00000074.tmp 같은형태로 저장됩니다.
//ref : https://gs.saro.me/dev?tn=131

@MultipartConfig(location = "C:\\dev88\\workspace\\SPRING_PJ_ABH\\src\\main\\webapp\\resources\\images\\upload", fileSizeThreshold = 1024
* 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@Controller
@RequestMapping("manager")
public class AdminController {
	private static final String IMG_UPLOAD_DIR = "C:\\\\dev88\\\\workspace\\\\SPRING_PJ_ABH\\\\src\\\\main\\\\webapp\\\\resources\\\\images\\\\upload";
    private ImageUploaderHandler uploader;
	
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
	@Autowired
	private AdminServiceImpl service;
	
	/*
	// 스케쥴링 테스트
	@Scheduled(fixedDelay=60000)
    public void TestScheduler(){
		Date date = new Date();
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
        System.out.println("스케줄링 테스트(600000ms -> 10분마다 테스트) 시간 -> " + format2.format(date));
    }*/
	
	// 관리자 페이지
	@RequestMapping("index")
	public String index(HttpServletRequest req, Model model) {
		System.out.println("[index.ad]");
		
		// 이동할 페이지
		return "index(manager)";
	}

	// 관리자 페이지
	@RequestMapping("mngPage.do")
	public String mngPage(HttpServletRequest req, Model model) {
		System.out.println("[mngPage.ad]");
		
		// 이동할 페이지
		return "manager/mngPage"; 
	}
	
	// 관리자 페이지
	@RequestMapping("mngImg.do")
	public String mngImg(HttpServletRequest req, Model model) {
		System.out.println("[mngImg.ad]");
		
		// 이동할 페이지
		return "manager/account/mngImg";
	}
		
	// 로그인 페이지
	@RequestMapping("mngLogin.do")
	public String loginform(HttpServletRequest req, Model model) {
		
		System.out.println("[url ==> /mngLogin.ad]");
		
		// 이동할 페이지
		return "manager/account/mngLogin";
	}
		
	// 로그아웃 페이지
	@RequestMapping("logoutAction.do")
	public String logout(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /logout.ad]");
	
		// 이동할 페이지
		return "/customer/account/logOutAction";
	}
			
	// 파일업로드
	@RequestMapping(value = "fileupload1")
    public String requestupload1(MultipartHttpServletRequest mRequest) {
        String src = mRequest.getParameter("src");
        MultipartFile mf = mRequest.getFile("file");

        String path = "G:\\dev88\\workspace\\SPRING_PJ_ABH\\src\\main\\webapp\\resources\\images\\upload\\";

        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        long fileSize = mf.getSize(); // 파일 사이즈

        System.out.println("originFileName : " + originFileName);
        System.out.println("fileSize : " + fileSize);

        String safeFile = path + originFileName;

        try {
            mf.transferTo(new File(safeFile));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:/";
    }
		
	// 관리자 - 회원관리 - 개인정보 상세관리
	@RequestMapping("customerInfo")
	public String customerInfo(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /customerInfo]");
		
		service.customerList(req, model);
		return "manager/customerInfo/customerInfo";
	}//지호바보
	
	// 관리자 - 회원관리 - 회원검색
	@RequestMapping("customerSearch")
	public String customerSearch(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /customerSearch]");
		
		service.searchCustomer(req, model);
		return "manager/customerInfo/customerSearch";
	}

	// 관리자 - 회원관리 - 회원삭제
	@RequestMapping("customerDelete")
	public String customerDelete(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /customerDelete]");
		service.deleteCustomer(req, model);
		service.customerList(req, model);
		return "manager/customerInfo/customerInfo";
	}
	
	// 관리자 - 예금관리 - 상품등록페이지
	@RequestMapping("depositProductInsert")
	public String depositProductInsert(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /depositProductInsert]");
		
		return "manager/depositProduct/depositProductInsert";
	}
	
	// 관리자 - 예금관리 - 상품등록Action
	@RequestMapping("depositProductInsertAction")
	public String depositProductInsertAction(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /depositProductInsertAction]");
		
		service.insertDepositProduct(req, model);
		return "manager/depositProduct/depositProductInsertAction";
	}
		
	// 관리자 - 예금관리 - 상품조회페이지
	@RequestMapping("depositProductList")
	public String depositProductList(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /depositProductList]");
		service.selectDepositProduct(req, model);
		return "manager/depositProduct/depositProductList";
	}
	
	// 관리자 - 예금관리 - 상품검색
	@RequestMapping("depositProductSearch")
	public String depositProductSearch(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /depositProductSearch]");
		service.searchDepositProduct(req, model);
		return "manager/depositProduct/depositProductSearch";
	}
	
	// 관리자 - 예금 관리 - 상품삭제
	@RequestMapping("depositProductDelete")
	public String depositProductDelete(HttpServletRequest req, Model model) {
		System.out.println("[url ==> /depositProductDelete]");
		service.deleteDepositProduct(req, model);
		service.selectDepositProduct(req, model);
		return "manager/depositProduct/depositProductList";
	}
	
	
	//qnalist 회원이 작성한것 리스트 가져오기(지현)
	@RequestMapping("qnaList_mng")
	public String qnaList_mng(HttpServletRequest req,Model model) {
		logger.info("url => qnaList_mng");
		
		//회원qna리스트 출력 메서드 service
		service.qnaList_mng(req, model);
		return"manager/qna/qnaList_mng";
	}
	
	//qna 답변달기(지현)
	@RequestMapping("qnaAnswer")
	public String qnaAnswer() {
		logger.info("url => qnaAnswer");
		
		return "manager/qna/qnaAnswer";
	}

	//FAQ 게시판 (지현)
	@RequestMapping("faq")
	public String faq(HttpServletRequest req, Model model) {
		logger.info("url => faq");
		
		service.faqList_mng(req, model);
		
		return "manager/qna/faq";
	}
	
	//FAQ 게시판 추가화면(지현)
	@RequestMapping("faqAdd")
	public String faqAdd(HttpServletRequest req, Model model) {
		logger.info("url => faqAdd");
		// 3단계. 신규 글- url으로부터 입력받은 값(get방식 값)을 받아온다.
		// boardWrite.bo?num=${dto.num}&pageNum=${pageNum}
		int faq_id = 0;
		int pageNum = 0;

		pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 3단계. 상세 페이지의 답글 쓰기 -url으로부터 입력받은 값(get방식 값)을 받아온다.
		// boardWrite.bo?num=${dto.num}&pageNum=${pageNum}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}'
		// 상세 페이지의 답글 쓰기 버튼 클릭시의 get방식의 url에서 값을 받는다.
		if (req.getParameter("inquiry_id") != null) {
			faq_id = Integer.parseInt(req.getParameter("faq_id"));
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		// 4단계jsp로 전달하기 위해 처리 결과 저장
		req.setAttribute("faq_id", faq_id);
		req.setAttribute("pageNum", pageNum);
		return "manager/qna/faqAdd";
	}
	
	//faq 게시판 추가 처리(지현)
	@RequestMapping("faqAddAction")
	public String faqAddAction(HttpServletRequest req, Model model) {
		logger.info("url=> faqAddAction");
		
		service.faqAdd(req, model);
		
		return "manager/qna/faqAddAction";
	}
	
	//faq 수정 (지현)
	@RequestMapping("faqModify")
	public String faqModify(HttpServletRequest req, Model model) {
		logger.info("ulr =>faqModify ");
		
		//수정 상세보기 
		service.faqModifyDetail(req, model);
		
		return "manager/qna/faqModifyDetail";
	}
	
	//faq 수정 처리(지현)
	@RequestMapping("faqModifyAction")
	public String faqModifyAction(HttpServletRequest req, Model model) {
		logger.info("url => faqModifyAction");
		
		service.faqModify(req, model);
		
		return "manager/qna/faqModifyAction"; 
	}
	
	//faq 삭제 (지현)
	@RequestMapping("faqDelete")
	public String faqDelete(HttpServletRequest req, Model model) {
		logger.info("url => faqDelete");
		
		service.faqDelete(req, model);
		
		return "manager/qna/faqDeleteAction";
	}

	// 회원별 계좌목록페이지
	@RequestMapping("customerAccountInfo")
	public String customerAccountInfo(HttpServletRequest req, Model model) {
		logger.info("url => customerAccountInfo");
		service.customerAccountList(req, model);
		return "manager/customerInfo/customerAccountInfo";
	}
	
	// 회원별 계좌목록 검색
	@RequestMapping("customerAccountSearch")
	public String customerAccountSearch(HttpServletRequest req, Model model) {
		logger.info("url => customerAccountSearch");
		service.searchCustomerAccountList(req, model);
		return "manager/customerInfo/customerAccountSearch";
	}		
}
