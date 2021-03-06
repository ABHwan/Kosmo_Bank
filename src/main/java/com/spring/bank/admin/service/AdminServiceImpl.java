package com.spring.bank.admin.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.bank.admin.dao.AdminDAOImpl;
import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.product.vo.FundProductVO;
import com.spring.bank.product.vo.IrpProductVO;
import com.spring.bank.product.vo.SavingProductVO;
import com.spring.bank.user.vo.AccountVO;
import com.spring.bank.user.vo.CustomerAccountVO;
import com.spring.bank.user.vo.DepositVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.user.vo.LoanProductVO;
import com.spring.bank.user.vo.LoanVO;
import com.spring.bank.user.vo.NoticeVO;
import com.spring.bank.user.vo.TransferVO;
import com.spring.bank.user.vo.UserVO;
import com.spring.bank.user.vo.faqVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAOImpl dao;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	// 관리자 페이지 회원목록 조회
	@Override
	public void customerList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 회원수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 회원수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5-1단계. 회원 수 조회
		cnt = dao.getCustomerCnt();
		System.out.println("회원 수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<UserVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getCustomerList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 회원 목록
		model.addAttribute("cnt", cnt); // 회원수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 회원번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 회원 검색
	@Override
	public void searchCustomer(HttpServletRequest req, Model model) {
		// 입력받은 검색어
		String search = req.getParameter("search");
		System.out.println("관리자 페이지 회원 검색어 : " + search);
		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 회원수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 회원수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5-1단계. 회원 수 조회
		cnt = dao.getCustomerSearchCnt(search);

		System.out.println("검색된 회원 수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);

		ArrayList<UserVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getCustomerSearchList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 회원 목록
		model.addAttribute("cnt", cnt); // 회원수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 회원번호
		model.addAttribute("search", search);
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 회원 삭제
	@Override
	public void deleteCustomer(HttpServletRequest req, Model model) {

		int deleteCnt = 0;
		String member_ids[] = req.getParameterValues("check");
		if (member_ids != null) {
			for (int i = 0; i < member_ids.length; i++) {
				deleteCnt = dao.deleteCustomer(member_ids[i]);
				System.out.println("삭제선택된 회원id: " + member_ids[i]);
			}
			System.out.println("삭제처리:" + deleteCnt + ", " + member_ids.length + "건 삭제처리 되었습니다.");
			model.addAttribute("msg", "회원삭제 처리되었습니다.");
		} else {
			model.addAttribute("msg", "삭제할 회원을 선택해주세요");
		}

		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 관리자 금융상품 조회
	@Override
	public void selectBanking(HttpServletRequest req, Model model) {

	}

	// 관리자 페이지 회원별 가입상품조회
	@Override
	public void selectCustomerProduct(HttpServletRequest req, Model model) {
		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 회원
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 회원수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5-1단계. 회원 수 조회
		cnt = dao.getCustomerProductCnt();
		System.out.println("회원 별 가입상품수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<AccountVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getCustomerProductList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 회원 목록
		model.addAttribute("cnt", cnt); // 회원수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 회원번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 회원별 가입상품검색
	public void searchCustomerProduct(HttpServletRequest req, Model model) {

		String search = req.getParameter("search");
		int pageSize = 10; // 한 페이지당 출력할 회원
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 회원수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5-1단계. 회원 수 조회
		cnt = dao.getSearchCustomerProductCnt(search);
		System.out.println("회원 별 가입상품수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);

		ArrayList<AccountVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getSearchCustomerProductList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 회원 목록
		model.addAttribute("cnt", cnt); // 회원수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 회원번호
		model.addAttribute("search", search);
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 예금 상품 등록
	@Override
	public void insertDepositProduct(HttpServletRequest req, Model model) {

		DepositProductVO vo = new DepositProductVO();
		vo.setDeposit_product_name(req.getParameter("deposit_product_name"));
		vo.setDeposit_product_summary(req.getParameter("deposit_product_summary"));
		vo.setDeposit_product_interRate(Float.parseFloat(req.getParameter("deposit_product_interRate")));
		vo.setDeposit_product_type(Integer.parseInt(req.getParameter("deposit_product_type")));
		vo.setDeposit_product_maxDate(Integer.parseInt(req.getParameter("deposit_product_maxDate")));
		vo.setDeposit_product_minDate(Integer.parseInt(req.getParameter("deposit_product_minDate")));
		vo.setDeposit_product_minPrice(Integer.parseInt(req.getParameter("deposit_product_minPrice")));
		vo.setDeposit_product_explanation(req.getParameter("deposit_product_explanation"));
		vo.setDeposit_product_notice(req.getParameter("deposit_product_notice"));
		vo.setDeposit_product_bankCode(Integer.parseInt(req.getParameter("deposit_product_bankCode")));

		int insertCnt = dao.insertDepositProduct(vo);
		System.out.println("예금상품등록 insertCnt : " + insertCnt);
		model.addAttribute("insertCnt", insertCnt);
	}

	// 관리자 페이지 예금 상품 상세 조회
	@Override
	public void getDepositProductInfo(HttpServletRequest req, Model model) {
		String deposit_product_name = req.getParameter("deposit_product_name");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		System.out.println(deposit_product_name + " 상품 상세조회");
		DepositProductVO vo = dao.getDepositProductInfo(deposit_product_name);
		model.addAttribute("vo", vo);
	}

	// 관리자 페이지 예금 상품 수정
	@Override
	public void updateDepositProduct(HttpServletRequest req, Model model) {

		DepositProductVO vo = new DepositProductVO();
		vo.setDeposit_product_name(req.getParameter("deposit_product_name"));
		vo.setDeposit_product_summary(req.getParameter("deposit_product_summary"));
		vo.setDeposit_product_interRate(Float.parseFloat(req.getParameter("deposit_product_interRate")));
		vo.setDeposit_product_type(Integer.parseInt(req.getParameter("deposit_product_type")));
		vo.setDeposit_product_maxDate(Integer.parseInt(req.getParameter("deposit_product_maxDate")));
		vo.setDeposit_product_minDate(Integer.parseInt(req.getParameter("deposit_product_minDate")));
		vo.setDeposit_product_minPrice(Integer.parseInt(req.getParameter("deposit_product_minPrice")));
		vo.setDeposit_product_explanation(req.getParameter("deposit_product_explanation"));
		vo.setDeposit_product_notice(req.getParameter("deposit_product_notice"));
		vo.setDeposit_product_bankCode(Integer.parseInt(req.getParameter("deposit_product_bankCode")));

		int updateCnt = dao.updateDepositProduct(vo);
		System.out.println("예금 상품 updateCnt : " + updateCnt);
		model.addAttribute("updateCnt", updateCnt);

	}

	// 관리자 페이지 예금 상품 삭제
	@Override
	public void deleteDepositProduct(HttpServletRequest req, Model model) {

		int deleteCnt = 0;
		String deposit_product_names[] = req.getParameterValues("check");
		if (deposit_product_names != null) {
			for (int i = 0; i < deposit_product_names.length; i++) {
				deleteCnt = dao.deleteDepositProduct(deposit_product_names[i]);
				System.out.println("삭제선택된 예금상품명: " + deposit_product_names[i]);
			}
			// String deposit_product_name = String.join(",", deposit_product_names);
			// System.out.println("선택된 상품들: " + deposit_product_name);
			model.addAttribute("msg", "예금상품 삭제처리되었습니다");
		} else {
			model.addAttribute("msg", "삭제하실 상품을 선택해주세요.");
		}
		System.out.println("예금상품 삭제여부 : " + deleteCnt);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 관리자 페이지 적금 상품 등록 처리
	@Override
	public void savingProductInsertAction(HttpServletRequest req, Model model) {
		SavingProductVO vo = new SavingProductVO();
		vo.setSaving_product_name(req.getParameter("saving_product_name"));
		vo.setSaving_product_summary(req.getParameter("saving_product_summary"));
		vo.setSaving_product_interRate(Float.parseFloat(req.getParameter("saving_product_interRate")));
		vo.setSaving_product_type(Integer.parseInt(req.getParameter("saving_product_type")));
		vo.setSaving_product_maxDate(Integer.parseInt(req.getParameter("saving_product_maxDate")));
		vo.setSaving_product_minDate(Integer.parseInt(req.getParameter("saving_product_minDate")));
		vo.setSaving_product_minPrice(Integer.parseInt(req.getParameter("saving_product_minPrice")));
		vo.setSaving_product_explanation(req.getParameter("saving_product_explanation"));
		vo.setSaving_product_notice(req.getParameter("saving_product_notice"));
		vo.setSaving_product_bankCode(Integer.parseInt(req.getParameter("saving_product_bankCode")));

		int insertCnt = dao.insertSavingProduct(vo);
		System.out.println("적금상품등록 insertCnt : " + insertCnt);
		model.addAttribute("insertCnt", insertCnt);
	}

	// 관리자 페이지 적금 상품 조회
	@Override
	public void selectSavingProduct(HttpServletRequest req, Model model) {
		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 적금상품
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 적금상품 수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 적금상품 수 조회
		cnt = dao.getSavingProductCnt();
		System.out.println("등록 된 적금 상품 수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<SavingProductVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.selectSavingProduct(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 적금 상품 목록
		model.addAttribute("cnt", cnt); // 적금 상품 수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 적금 상품 검색
	@Override
	public void searchSavingProduct(HttpServletRequest req, Model model) {
		// 입력받은 검색어
		String search = req.getParameter("search");
		System.out.println("관리자 페이지 회원 검색어 : " + search);

		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 적금상품
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 적금상품 수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 검색 된 적금 상품 수 조회
		cnt = dao.getSavingProductSearchCnt(search);
		System.out.println("검색 된 적금 상품 수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);

		ArrayList<SavingProductVO> dtos = null;
		if (cnt > 0) {

			dtos = dao.searchSavingProduct(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 검색된 적금 상품 목록
		model.addAttribute("cnt", cnt); // 적금 상품 수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 번호
		model.addAttribute("search", search); // 검색어
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 적금 상품 상세 조회
	@Override
	public void getSavingProductInfo(HttpServletRequest req, Model model) {
		String saving_product_name = req.getParameter("saving_product_name");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		System.out.println("req.getParameter('pageNum')" + req.getParameter("pageNum"));
		System.out.println(saving_product_name + " 상품 상세조회");
		SavingProductVO vo = dao.getSavingProductInfo(saving_product_name);
		model.addAttribute("vo", vo);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 페이지 적금 상품 수정
	@Override
	public void updateSavingProduct(HttpServletRequest req, Model model) {

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		SavingProductVO vo = new SavingProductVO();
		vo.setSaving_product_name(req.getParameter("saving_product_name"));
		vo.setSaving_product_summary(req.getParameter("saving_product_summary"));
		vo.setSaving_product_interRate(Float.parseFloat(req.getParameter("saving_product_interRate")));
		vo.setSaving_product_type(Integer.parseInt(req.getParameter("saving_product_type")));
		vo.setSaving_product_maxDate(Integer.parseInt(req.getParameter("saving_product_maxDate")));
		vo.setSaving_product_minDate(Integer.parseInt(req.getParameter("saving_product_minDate")));
		vo.setSaving_product_minPrice(Integer.parseInt(req.getParameter("saving_product_minPrice")));
		vo.setSaving_product_explanation(req.getParameter("saving_product_explanation"));
		vo.setSaving_product_notice(req.getParameter("saving_product_notice"));
		vo.setSaving_product_bankCode(Integer.parseInt(req.getParameter("saving_product_bankCode")));

		int updateCnt = dao.updateSavingProduct(vo);
		System.out.println("적금 상품 updateCnt : " + updateCnt);
		System.out.println("pageNum : " + pageNum);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 페이지 적금 상품 삭제
	@Override
	public void deleteSavingProduct(HttpServletRequest req, Model model) {
		int deleteCnt = 0;
		String saving_product_names[] = req.getParameterValues("check");
		if (saving_product_names != null) {
			for (int i = 0; i < saving_product_names.length; i++) {
				deleteCnt = dao.deleteSavingProduct(saving_product_names[i]);
				System.out.println("삭제선택된 적금상품명: " + saving_product_names[i]);
			}
			model.addAttribute("msg", "적금상품 삭제처리되었습니다");
		} else {
			model.addAttribute("msg", "삭제하실 상품을 선택해주세요.");
		}
		System.out.println("적금상품 삭제여부 : " + deleteCnt);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 관리자 페이지 연금 상품 등록(지현)
	@Override
	public void insertIrpProduct(HttpServletRequest req, Model model) {
		IrpProductVO vo = new IrpProductVO();
		vo.setIrp_product_name(req.getParameter("irp_product_name"));
		vo.setIrp_product_summary(req.getParameter("irp_product_summary"));
		System.out.println("rateart" + req.getParameter("irp_product_bankCode"));
		vo.setIrp_product_interRate(Float.parseFloat(req.getParameter("irp_product_interRate")));
		vo.setIrp_product_expiryTerm(Integer.parseInt(req.getParameter("irp_product_expiryTerm")));
		vo.setIrp_product_explanation(req.getParameter("irp_product_explanation"));
		vo.setIrp_product_notice(req.getParameter("irp_product_notice"));
		vo.setIrp_product_bankCode(Integer.parseInt(req.getParameter("irp_product_bankCode")));
		vo.setIrp_product_money(Integer.parseInt(req.getParameter("irp_product_money")));

		int insertCnt = dao.insertIrpProduct(vo);
		System.out.println("연금상품등록 insertCnt : " + insertCnt);
		model.addAttribute("insertCnt", insertCnt);

	}

	// 관리자 페이지 연금 상품 조회(지현)
	@Override
	public void selectIrpProduct(HttpServletRequest req, Model model) {
		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 예금상품
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 예금상품 수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 예금상품 수 조회
		cnt = dao.getIrpProductCnt();
		System.out.println("등록 된 연금 상품 수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<IrpProductVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.selectIrpProduct(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 예금 상품 목록
		model.addAttribute("cnt", cnt); // 예금 상품 수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 연금 상품 검색(지현)
	@Override
	public void searchIrpProduct(HttpServletRequest req, Model model) {

		// 입력받은 검색어
		String search = req.getParameter("search");
		System.out.println("관리자 페이지 회원 검색어 : " + search);

		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 예금상품
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 예금상품 수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 검색 된 예금 상품 수 조회
		cnt = dao.getIrpProductSearchCnt(search);
		System.out.println("검색 된 연금 상품 수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);

		ArrayList<IrpProductVO> dtos = null;
		if (cnt > 0) {

			dtos = dao.searchIrpProduct(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 검색된 예금 상품 목록
		model.addAttribute("cnt", cnt); // 예금 상품 수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 번호
		model.addAttribute("search", search); // 검색어
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 연금 상품 상세 조회(지현)
	@Override
	public void getIrpProductInfo(HttpServletRequest req, Model model) {
		String irp_product_name = req.getParameter("irp_product_name");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		System.out.println(irp_product_name + " 상품 상세조회");
		IrpProductVO vo = dao.getIrpProductInfo(irp_product_name);
		model.addAttribute("vo", vo);
		model.addAttribute("pageNum", pageNum);

	}

	// 관리자 페이지 연금 상품 수정(지현)
	@Override
	public void updateIrpProduct(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		IrpProductVO vo = new IrpProductVO();
		vo.setIrp_product_name(req.getParameter("irp_product_name"));
		vo.setIrp_product_summary(req.getParameter("irp_product_summary"));
		vo.setIrp_product_interRate(Float.parseFloat(req.getParameter("irp_product_interRate")));
		vo.setIrp_product_expiryTerm(Integer.parseInt(req.getParameter("irp_product_expiryTerm")));
		vo.setIrp_product_explanation(req.getParameter("irp_product_explanation"));
		vo.setIrp_product_money(Integer.parseInt(req.getParameter("irp_product_money")));
		vo.setIrp_product_notice(req.getParameter("irp_product_notice"));
		vo.setIrp_product_bankCode(Integer.parseInt(req.getParameter("irp_product_bankCode")));

		int updateCnt = dao.updateIrpProduct(vo);
		System.out.println("연금 상품 updateCnt : " + updateCnt);
		System.out.println("pageNum : " + pageNum);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 페이지 연금 상품 삭제(지현)
	@Override
	public void deleteIrpProduct(HttpServletRequest req, Model model) {
		int deleteCnt = 0;
		String irp_product_names[] = req.getParameterValues("check");
		if (irp_product_names != null) {
			for (int i = 0; i < irp_product_names.length; i++) {
				deleteCnt = dao.deleteIrpProduct(irp_product_names[i]);
				System.out.println("삭제선택된 연금상품명: " + irp_product_names[i]);
			}
			// String deposit_product_name = String.join(",", deposit_product_names);
			// System.out.println("선택된 상품들: " + deposit_product_name);
			model.addAttribute("msg", "연금상품 삭제처리되었습니다");
		} else {
			model.addAttribute("msg", "삭제하실 상품을 선택해주세요.");
		}
		System.out.println("연금상품 삭제여부 : " + deleteCnt);
		model.addAttribute("deleteCnt", deleteCnt);
	}


	// 관리자 페이지 펀드 상품 등록 처리
	@Override
	public void fundProductInsertAction(HttpServletRequest req, Model model) {
		FundProductVO vo = new FundProductVO();

		vo.setFund_title(req.getParameter("fund_title"));
		vo.setFund_content(req.getParameter("fund_content"));
		vo.setFund_summary(req.getParameter("fund_summary"));
		vo.setFund_start_date(Date.valueOf(req.getParameter("fund_start_date")));
		vo.setFund_end_date(Date.valueOf(req.getParameter("fund_end_date")));
		vo.setFund_goal_money(Integer.parseInt(req.getParameter("fund_goal_money")));
		vo.setFund_category(req.getParameter("fund_category"));
		vo.setFund_approve(req.getParameter("saving_product_explanation"));
		vo.setFund_mem_name(req.getParameter("fund_mem_name"));

		String hp1 = req.getParameter("fund_mem_hp1");
		String hp2 = req.getParameter("fund_mem_hp2");
		String hp3 = req.getParameter("fund_mem_hp3");

		String hp = hp1 + "-" + hp2 + "-" + hp3;
		vo.setFund_mem_hp(hp);

		String email1 = req.getParameter("fund_mem_email1");
		String email2 = req.getParameter("fund_mem_email2");

		String email = email1 + "@" + email2;
		vo.setFund_mem_email(email);

		vo.setFund_bank_code(Integer.parseInt(req.getParameter("fund_bank_code")));
		System.out.println("req.getParameter('fund_bank_code') : " + req.getParameter("fund_bank_code"));
		vo.setFund_account(req.getParameter("fund_account"));
		String img = "../resources/images/admin/upload/" + req.getParameter("fund_filename");
		vo.setFund_filename(img);

		int insertCnt = dao.insertFundProduct(vo);
		System.out.println("펀드상품등록 insertCnt : " + insertCnt);
		model.addAttribute("insertCnt", insertCnt);
	}

	// 관리자 페이지 펀드 상품 조회
	@Override
	public void selectFundProduct(HttpServletRequest req, Model model) {
		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 펀드상품
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 펀드상품 수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 펀드상품 수 조회
		cnt = dao.getFundProductCnt();
		System.out.println("등록 된 펀드 상품 수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<FundProductVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.selectFundProduct(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 펀드 상품 목록
		model.addAttribute("cnt", cnt); // 펀드 상품 수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 펀드 상품 검색
	@Override
	public void searchFundProduct(HttpServletRequest req, Model model) {
		// 입력받은 검색어
		String search = req.getParameter("search");
		System.out.println("관리자 페이지 회원 검색어 : " + search);

		// 페이징
		int pageSize = 10; // 한 페이지당 출력할 펀드상품
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 펀드상품 수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 검색 된 펀드 상품 수 조회
		cnt = dao.getSavingProductSearchCnt(search);
		System.out.println("검색 된 펀드 상품 수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);

		ArrayList<SavingProductVO> dtos = null;
		if (cnt > 0) {

			dtos = dao.searchSavingProduct(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 검색된 펀드 상품 목록
		model.addAttribute("cnt", cnt); // 펀드 상품 수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 번호
		model.addAttribute("search", search); // 검색어
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 펀드 상품 상세 조회
	@Override
	public void getFundProductInfo(HttpServletRequest req, Model model) {
		String fund_title = req.getParameter("fund_title");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		System.out.println("req.getParameter('pageNum')" + req.getParameter("pageNum"));
		System.out.println(fund_title + " 상품 상세조회");
		FundProductVO vo = dao.getFundProductInfo(fund_title);
		model.addAttribute("vo", vo);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 페이지 펀드 상품 수정
	@Override
	public void updateFundProduct(HttpServletRequest req, Model model) {

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		FundProductVO vo = new FundProductVO();

		vo.setFund_title(req.getParameter("fund_title"));
		vo.setFund_content(req.getParameter("fund_content"));
		vo.setFund_summary(req.getParameter("fund_summary"));
		vo.setFund_start_date(Date.valueOf(req.getParameter("fund_start_date")));
		vo.setFund_end_date(Date.valueOf(req.getParameter("fund_end_date")));
		vo.setFund_goal_money(Integer.parseInt(req.getParameter("fund_goal_money")));
		vo.setFund_category(req.getParameter("fund_category"));
		vo.setFund_approve(req.getParameter("saving_product_explanation"));
		vo.setFund_mem_name(req.getParameter("fund_mem_name"));

		String hp1 = req.getParameter("fund_mem_hp1");
		String hp2 = req.getParameter("fund_mem_hp2");
		String hp3 = req.getParameter("fund_mem_hp3");

		String hp = hp1 + "-" + hp2 + "-" + hp3;
		vo.setFund_mem_hp(hp);

		String email1 = req.getParameter("fund_mem_email1");
		String email2 = req.getParameter("fund_mem_email2");

		String email = email1 + "@" + email2;
		vo.setFund_mem_email(email);

		vo.setFund_bank_code(Integer.parseInt(req.getParameter("fund_bank_code")));
		System.out.println("req.getParameter('fund_bank_code') : " + req.getParameter("fund_bank_code"));
		vo.setFund_account(req.getParameter("fund_account"));
		String img = "../resources/images/admin/upload/" + req.getParameter("fund_filename");
		vo.setFund_filename(img);

		int updateCnt = dao.updateFundProduct(vo);
		System.out.println("펀드 상품 updateCnt : " + updateCnt);
		System.out.println("pageNum : " + pageNum);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 페이지 펀드 상품 삭제
	@Override
	public void deleteFundProduct(HttpServletRequest req, Model model) {
		int deleteCnt = 0;
		String fund_title[] = req.getParameterValues("check");
		if (fund_title != null) {
			for (int i = 0; i < fund_title.length; i++) {
				deleteCnt = dao.deleteFundProduct(fund_title[i]);
				System.out.println("삭제선택된 펀드상품명: " + fund_title[i]);
			}
			model.addAttribute("msg", "펀드상품 삭제처리되었습니다");
		} else {
			model.addAttribute("msg", "삭제하실 상품을 선택해주세요.");
		}
		System.out.println("펀드상품 삭제여부 : " + deleteCnt);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// qna 조회(지현)
	@Override
	public void qnaList_mng(HttpServletRequest req, Model model) {
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

	// faq 게시글 조회(지현)
	@Override
	public void faqList_mng(HttpServletRequest req, Model model) {
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

	// faq 게시글 추가(지현)
	@Override
	public void faqAdd(HttpServletRequest req, Model model) {
		int insertCnt = 0;

		faqVO vo = new faqVO();
		// 3-1단계. 화면으로부터 입력받은 값(hidden값)을 받아온다.
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 3-2단계. 화면으로부터 입력받은 값(input 값 = 작성자, 비밀번호, 글제목, 글내용)을 받아와서 바구니에 담는다
		vo.setFaq_title(req.getParameter("faq_title"));
		vo.setFaq_content(req.getParameter("faq_content"));

		// 5단계. 게시글 작성
		insertCnt = dao.faqAdd(vo);
		System.out.println("insertCnt : " + insertCnt);

		// 6단계
		req.setAttribute("insertCnt", insertCnt);
		req.setAttribute("pageNum", pageNum);

	}

	// faq 수정 상세(지현)
	@Override
	public void faqModifyDetail(HttpServletRequest req, Model model) {
		int faq_id = Integer.parseInt(req.getParameter("faq_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 5-2 단계. 상세페이지 조회
		faqVO vo = dao.getFaqDetail(faq_id);

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("dto", vo);
		req.setAttribute("faq_id", faq_id);
		req.setAttribute("pageNum", pageNum);
	}

	// faq 수정 처리(지현)
	@Override
	public void faqModify(HttpServletRequest req, Model model) {

		System.out.println(req.getParameter("faq_id"));
		int faq_id = Integer.parseInt(req.getParameter("faq_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// QnaVO바구니 생성
		// 화면으로부터 입력받은 값(input값 - 작성자,비밀번호, 제목, 내용), num을 받아온다.
		faqVO vo = new faqVO();
		vo.setFaq_title(req.getParameter("faq_title"));
		vo.setFaq_content(req.getParameter("faq_content"));
		vo.setFaq_id(faq_id);

		// 5단계. 게시글 수정처리
		int updateCnt = dao.updateFaq(vo);
		System.out.println("updateCnt : " + updateCnt);

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("updateCnt", updateCnt);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("faq_id", faq_id);
	}

	// faq 삭제(지현)
	@Override
	public void faqDelete(HttpServletRequest req, Model model) {
		System.out.println("삭제처리 아이디 : " + req.getParameter("faq_id"));
		int faq_id = Integer.parseInt(req.getParameter("faq_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 5단계. 게시글 수정처리
		int deleteCnt = dao.deleteFaq(faq_id);
		System.out.println("deleteCnt : " + deleteCnt);

		// 6단계. jsp로 전달하기 위해 request나 session에 처리 결과를 저장
		req.setAttribute("deleteCnt", deleteCnt);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("faq_id", faq_id);
	}

	// 관리자 페이지 회원계좌목록
	public void customerAccountList(HttpServletRequest req, Model model) {
		int pageSize = 10; // 한 페이지당 출력할 수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 회원계좌 수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 예금상품 수 조회
		cnt = dao.getCustomerAccountCnt();
		System.out.println("등록 된 회원별 계좌수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<CustomerAccountVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getCustomerAccountList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 예금 상품 목록
		model.addAttribute("cnt", cnt); // 예금 상품 수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 회원계좌검색목록
	public void searchCustomerAccountList(HttpServletRequest req, Model model) {
		String search = req.getParameter("search");

		int pageSize = 10; // 한 페이지당 출력할 수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 회원계좌 수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 예금상품 수 조회
		cnt = dao.getSerachCustomerAccountCnt(search);
		System.out.println("검색된 회원별 계좌수 : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		// 상품 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (회원수 30건 / 한 페이지당 10개) + 나머지0
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재 페이지 시작 글 번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1 - 1) * 10 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 시작 글 번호(페이지별)
		// end = start + pageSize - 1;
		// 10 = 1 + 10 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글 번호
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage);

		System.out.println("===================================");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);

		ArrayList<CustomerAccountVO> dtos = null;
		if (cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getSearchCustomerAccountList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos); // 예금 상품 목록
		model.addAttribute("cnt", cnt); // 예금 상품 수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 번호
		model.addAttribute("search", search); // 검색어
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 관리자 페이지 TEST계좌생성(복환)
	@Override
	public int insertTestAccount(HttpServletRequest req, Model model) {
		System.out.println("Service => insertTestAccount");

		String account_bankCode = req.getParameter("account_bankCode");
		String account_id = createAccountId(Integer.parseInt(account_bankCode));
		String account_password = req.getParameter("account_password");
		String account_balance = req.getParameter("account_balance");
		String account_type = req.getParameter("account_type");
		String account_state = req.getParameter("account_state");
		String account_stateContent = req.getParameter("account_stateContent");
		String account_limit = req.getParameter("account_limit");
		String unique_key = req.getParameter("unique_key");

		AccountVO vo = new AccountVO();

		vo.setAccount_bankCode(Integer.parseInt(account_bankCode));
		vo.setAccount_id(account_id);
		vo.setAccount_password(account_password);
		vo.setAccount_balance(Integer.parseInt(account_balance));
		vo.setAccount_type(Integer.parseInt(account_type));
		vo.setAccount_state(Integer.parseInt(account_state));
		vo.setAccount_stateContent(account_stateContent);
		vo.setAccount_limit(Integer.parseInt(account_limit));
		vo.setUnique_key(unique_key);

		return dao.insertTestAccount(vo);
	}

	// 계좌 생성 Method
	public String createAccountId(int account_type) {
		String account_id = "";

		if (account_type == 1) {
			// 국민(14) > 6 - 2 - 6
			String st1 = String.format("%06d", (int) (Math.random() * 1000000));
			String st2 = String.format("%02d", (int) (Math.random() * 100));
			String st3 = String.format("%06d", (int) (Math.random() * 1000000));

			account_id = st1 + "-" + st2 + "-" + st3;

			System.out.println("account_id : " + account_id);

		} else if (account_type == 2) {
			// 우리(13) > 4 - 3 - 6
			String st1 = String.format("%04d", (int) (Math.random() * 10000));
			String st2 = String.format("%03d", (int) (Math.random() * 1000));
			String st3 = String.format("%06d", (int) (Math.random() * 1000000));

			account_id = st1 + "-" + st2 + "-" + st3;

			System.out.println("account_id : " + account_id);

		} else if (account_type == 3) {
			// 농협(13) > 3 - 4 - 4 - 2
			String st1 = String.format("%03d", (int) (Math.random() * 1000));
			String st2 = String.format("%04d", (int) (Math.random() * 10000));
			String st3 = String.format("%04d", (int) (Math.random() * 10000));
			String st4 = String.format("%02d", (int) (Math.random() * 100));

			account_id = st1 + "-" + st2 + "-" + st3 + "-" + st4;

			System.out.println("account_id : " + account_id);

		} else if (account_type == 4) {
			// 신한(12) > 3 - 3 - 6
			String st1 = String.format("%03d", (int) (Math.random() * 1000));
			String st2 = String.format("%03d", (int) (Math.random() * 1000));
			String st3 = String.format("%06d", (int) (Math.random() * 1000000));

			account_id = st1 + "-" + st2 + "-" + st3;

			System.out.println("account_id : " + account_id);

		} else if (account_type == 5) {
			// 하나(14) > 3 - 6 - 5
			String st1 = String.format("%03d", (int) (Math.random() * 1000));
			String st2 = String.format("%06d", (int) (Math.random() * 1000000));
			String st3 = String.format("%05d", (int) (Math.random() * 100000));

			account_id = st1 + "-" + st2 + "-" + st3;

			System.out.println("account_id : " + account_id);

		}

		return account_id;
	}

	// 공지사항 쓰기 처리(민재)
	@Override
	public void mngNoticeWriteAction(HttpServletRequest req, Model model) {
		System.out.println("여기들어와?");
		NoticeVO vo = new NoticeVO();

		// 히든값 받아오기 -> 바구니에 넣기
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		vo.setNotice_writer(req.getParameter("notice_writer"));

		// input값 받아오기 -> 바구니에 넣기
		vo.setNotice_subject(req.getParameter("notice_subject"));
		vo.setNotice_password(req.getParameter("notice_password"));
		vo.setNotice_content(req.getParameter("notice_content"));

		// 작성일
		// vo.setNotice_date(new Date());

		// insert
		int insertCnt = dao.mngNoticeWriteAction(vo);
		System.out.println("insertCnt : " + insertCnt);

		// jsp로 insertCnt값 넘기기
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("pageNum", pageNum);
	}



	// 공지사항 수정인증(민재)
	@Override
	public void mngNoticeModifyDetail(HttpServletRequest req, Model model) {

		// 히든값
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int notice_num = Integer.parseInt(req.getParameter("notice_num"));

		String rawPwd = (String) req.getParameter("notice_password");

		// 암호화된 비밀번호 가져오기
		String bCryptPasswordEncoderPwd = dao.noticePWDCheck(notice_num);

		int selectCnt = 0;
		boolean result = bCryptPasswordEncoder.matches(rawPwd, bCryptPasswordEncoderPwd);

		// 비밀번호 인증
		// 인증성공 :: selectCnt = 1, 인증실패 :: selectCnt = 0
		if (result == true) {
			selectCnt = 1;
		}

		System.out.println("공지사항 수정인증 selectCnt : " + selectCnt);
		// 상세페이지 조회
		NoticeVO vo = dao.getNoticeDetail(notice_num);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("vo", vo);

	}

	// 공지사항 수정처리(민재)
	@Override
	public void mngNoticeModifyAction(HttpServletRequest req, Model model) {

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		NoticeVO vo = new NoticeVO();

		vo.setNotice_num(Integer.parseInt(req.getParameter("notice_num")));
		vo.setNotice_subject(req.getParameter("notice_subject"));
		vo.setNotice_password(req.getParameter("notice_password"));
		vo.setNotice_content(req.getParameter("notice_content"));

		int updateCnt = dao.noticeModifyAction(vo);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("updateCnt", updateCnt);
	}

	// 공지사항 삭제처리(민재)
	@Override
	public void mngNoticeDeleteAction(HttpServletRequest req, Model model) {

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int notice_num = (Integer.parseInt(req.getParameter("notice_num")));

		String rawPwd = (String) req.getParameter("notice_password");

		// 암호화된 비밀번호 가져오기
		String bCryptPasswordEncoderPwd = dao.noticePWDCheck(notice_num);

		int deleteCnt = 0;
		boolean result = bCryptPasswordEncoder.matches(rawPwd, bCryptPasswordEncoderPwd);

		// 비밀번호 인증
		// 인증성공 :: selectCnt = 1, 인증실패 :: selectCnt = 0
		if (result == true) {
			deleteCnt = dao.noticeDeleteAction(notice_num);
		}

		System.out.println("공지사항 삭제인증 deleteCnt : " + deleteCnt);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	// 대출 상품 목록
	public void loanProductList(HttpServletRequest req, Model model) { // 지은
		System.out.println("[AdminService => loanProductList()]");

		// 페이징
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		cnt = dao.getLoanProductCnt();
		System.out.println("cnt : " + cnt);

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6= (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5; // 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
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

		System.out.println("==============================================");

		ArrayList<LoanProductVO> loanProducts = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		if (cnt > 0) {
			// 5-2 게시글 목록 조회
			loanProducts = dao.getLoanProductList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("loanProducts", loanProducts); // 게시글 목록
		model.addAttribute("cnt", cnt); // 게시글 갯수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

	}

	// 대출 해지 목록
	public void loanCancelList(HttpServletRequest req, Model model) { // 지은
		System.out.println("[AdminService => loanCancelList()]");
		// 페이징
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		cnt = dao.getLoanCancelCnt();
		System.out.println("cnt : " + cnt);

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6= (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5; // 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
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

		System.out.println("==============================================");

		ArrayList<LoanProductVO> loanProducts = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		if (cnt > 0) {
			// 5-2 게시글 목록 조회
			loanProducts = dao.getLoanCancelList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("loanProducts", loanProducts); // 게시글 목록
		model.addAttribute("cnt", cnt); // 게시글 갯수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

	}
	
	// 대출 상품 검색
	public void searchLoanProductList(HttpServletRequest req, Model model) { // 지은
		System.out.println("[AdminService => loanProductList()]");

		// 페이징
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		String keyword = (String) req.getParameter("keyword");

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		cnt = dao.getSearchLoanProductCnt(keyword);
		System.out.println("cnt : " + cnt);

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6= (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5; // 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
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

		System.out.println("==============================================");

		ArrayList<LoanProductVO> loanProducts = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);

		if (cnt > 0) {
			// 5-2 게시글 목록 조회
			loanProducts = dao.searchLoanProductList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("loanProducts", loanProducts); // 게시글 목록
		model.addAttribute("cnt", cnt); // 게시글 갯수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("keyword", keyword); // keyword

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

	}

	// 대출 상품 삭제
	public void loanProductDelete(HttpServletRequest req, Model model) { // 지은
		String loan_product_name = req.getParameter("loan_product_name");
		int deleteCnt = dao.loanProductDelete(loan_product_name);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 대출 상품 수정 처리
	public void loanProductUpdateAction(HttpServletRequest req, Model model) { // 지은
		String loan_product_name = req.getParameter("loan_product_name");
		float loan_product_rate = (float) Double.parseDouble((String) req.getParameter("loan_product_rate"));
		String loan_product_summary = req.getParameter("loan_product_summary");
		int loan_product_minPrice = Integer.parseInt((String) req.getParameter("loan_product_minPrice"));
		long loan_product_maxPrice = Long.parseLong((String) req.getParameter("loan_product_maxPrice"));
		int loan_product_minDate = Integer.parseInt((String) req.getParameter("loan_product_minDate"));
		int loan_product_maxDate = Integer.parseInt((String) req.getParameter("loan_product_maxDate"));
		int loan_product_bankCode = Integer.parseInt((String) req.getParameter("loan_product_bankCode"));
		float loan_product_prepaymentRate = (float) Double
				.parseDouble((String) req.getParameter("loan_product_prepaymentRate"));
		String pre_loan_product_name = req.getParameter("pre_loan_product_name");

		LoanProductVO l = new LoanProductVO();
		l.setLoan_product_name(loan_product_name);
		l.setPre_loan_product_name(pre_loan_product_name);
		l.setLoan_product_rate(loan_product_rate);
		l.setLoan_product_summary(loan_product_summary);
		l.setLoan_product_minPrice(loan_product_minPrice);
		l.setLoan_product_maxPrice(loan_product_maxPrice);
		l.setLoan_product_minDate(loan_product_minDate);
		l.setLoan_product_maxDate(loan_product_maxDate);
		l.setLoan_product_bankCode(loan_product_bankCode);
		l.setLoan_product_prepaymentRate(loan_product_prepaymentRate);

		int updateCnt = dao.loanProductUpdate(l);
		model.addAttribute("updateCnt", updateCnt);
	}

	// 대출 상품 수정 폼
	public void loanProductUpdate(HttpServletRequest req, Model model) { // 지은
		LoanProductVO loanProduct = dao.getLoanProductInfo(req.getParameter("loan_product_name"));
		model.addAttribute("loanProduct", loanProduct);
	}

	// 대출 상품 등록 처리
	public void loanProductInsertAction(HttpServletRequest req, Model model) { // 지은
		String loan_product_name = req.getParameter("loan_product_name");
		float loan_product_rate = (float) Double.parseDouble((String) req.getParameter("loan_product_rate"));
		String loan_product_summary = req.getParameter("loan_product_summary");
		int loan_product_minPrice = Integer.parseInt((String) req.getParameter("loan_product_minPrice"));
		int loan_product_maxPrice = Integer.parseInt((String) req.getParameter("loan_product_maxPrice"));
		int loan_product_minDate = Integer.parseInt((String) req.getParameter("loan_product_minDate"));
		int loan_product_maxDate = Integer.parseInt((String) req.getParameter("loan_product_maxDate"));
		int loan_product_bankCode = Integer.parseInt((String) req.getParameter("loan_product_bankCode"));
		float loan_product_prepaymentRate = (float) Double
				.parseDouble((String) req.getParameter("loan_product_prepaymentRate"));

		LoanProductVO l = new LoanProductVO();
		l.setLoan_product_name(loan_product_name);
		l.setLoan_product_rate(loan_product_rate);
		l.setLoan_product_summary(loan_product_summary);
		l.setLoan_product_minPrice(loan_product_minPrice);
		l.setLoan_product_maxPrice(loan_product_maxPrice);
		l.setLoan_product_minDate(loan_product_minDate);
		l.setLoan_product_maxDate(loan_product_maxDate);
		l.setLoan_product_bankCode(loan_product_bankCode);
		l.setLoan_product_prepaymentRate(loan_product_prepaymentRate);

		int insertCnt = dao.loanProductInsert(l);
		model.addAttribute("insertCnt", insertCnt);
	}

	// 대출 요청 목록
	public void loanRequestList(HttpServletRequest req, Model model) { // 지은
		System.out.println("[AdminService => loanRequestList()]");

		// 페이징
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		cnt = dao.getLoanRequestCnt();
		System.out.println("cnt : " + cnt);

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6= (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5; // 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
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

		System.out.println("==============================================");

		ArrayList<LoanVO> loans = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		if (cnt > 0) {
			// 5-2 게시글 목록 조회
			loans = dao.getLoanRequestList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("loans", loans); // 게시글 목록
		model.addAttribute("cnt", cnt); // 게시글 갯수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	// 대출 목록
	public void loanList(HttpServletRequest req, Model model) { // 지은
		System.out.println("[AdminService => loanList()]");

		// 페이징
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		cnt = dao.getLoanCnt();
		System.out.println("cnt : " + cnt);

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6= (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5; // 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
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

		System.out.println("==============================================");

		ArrayList<LoanVO> loans = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		if (cnt > 0) {
			// 5-2 게시글 목록 조회
			loans = dao.getLoanList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("loans", loans); // 게시글 목록
		model.addAttribute("cnt", cnt); // 게시글 갯수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	// 대출 승인
	public void loanRequestAction(HttpServletRequest req, Model model) { // 지은
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loan_id", req.getParameter("loan_id"));
		map.put("state", 2); // 승인
		int updateCnt = dao.loanRequestAction(map);

		if (updateCnt == 1) { // 승인 완료
			// 대출 정보 가져오기
			LoanVO loan = dao.getLoanInfo(map);
			System.out.println(loan);
			// bankCode 가져오기
			UserVO loanMember = dao.getUserInfo(loan.getMember_id());
			LoanProductVO loanProduct = dao.getLoanProductInfo(loan.getLoan_product_name());

			java.util.Date date = new java.util.Date();

			TransferVO trans = new TransferVO();
			trans.setAccount_id(loan.getAccount_id());
			trans.setTransfer_money((int) loan.getLoan_amount());
			trans.setTransfer_inOut("입금");
			trans.setTransfer_inComment(loan.getLoan_product_name() + " 승인 " + date);
			trans.setTransfer_senderName(loan.getLoan_product_name());
			trans.setTransfer_receiverName(loanMember.getMember_name());
			trans.setTransfer_bankCode(loanProduct.getLoan_product_bankCode());

			// 대출금 신청계좌로 이체
			int insertCnt = dao.transNewLoanAccount(trans);

			if (insertCnt == 1) {
				// 신청계좌 잔고 갱신
				map.clear();
				map.put("loan_amount", loan.getLoan_amount());
				map.put("account_id", loan.getAccount_id());
				int updateCnt2 = dao.setNewLoanAccount(map);

				if (updateCnt2 == 0) {
					map.clear();
					map.put("loan_id", req.getParameter("loan_id"));
					map.put("state", 1); // 신청
					updateCnt = dao.loanRequestAction(map);
					updateCnt = 0;

					TransferVO trans2 = new TransferVO();
					trans2.setAccount_id(loan.getAccount_id());
					trans2.setTransfer_money(-(int) loan.getLoan_amount());
					trans2.setTransfer_inOut("입금정정");
					trans2.setTransfer_inComment(loan.getLoan_product_name() + " 입금정정 " + date);
					trans2.setTransfer_senderName(loan.getLoan_product_name());
					trans2.setTransfer_receiverName(loanMember.getMember_name());
					trans2.setTransfer_bankCode(loanProduct.getLoan_product_bankCode());

					dao.transNewLoanAccount(trans2);
				}

			} else {
				map.clear();
				map.put("loan_id", req.getParameter("loan_id"));
				map.put("state", 1); // 신청
				updateCnt = dao.loanRequestAction(map);
				updateCnt = 0;
			}

		}

		model.addAttribute("updateCnt", updateCnt);
	}

	// 대출 요청 목록 검색
	public void searchLoanRequestList(HttpServletRequest req, Model model) { // 지은
		System.out.println("[AdminService => searchLoanRequestList()]");

		// 페이징
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		String keyword = (String) req.getParameter("keyword");

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		cnt = dao.getSearchLoanRequestCnt(keyword);
		System.out.println("cnt : " + cnt);

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6= (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5; // 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
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

		System.out.println("==============================================");

		ArrayList<LoanVO> loans = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);

		if (cnt > 0) {
			// 5-2 게시글 목록 조회
			loans = dao.searchLoanRequestList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("loans", loans); // 게시글 목록
		model.addAttribute("cnt", cnt); // 게시글 갯수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("keyword", keyword); // keyword

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	// 대출 목록 검색
	public void searchLoanList(HttpServletRequest req, Model model) { // 지은
		System.out.println("[AdminService => searchLoanList()]");

		// 페이징
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글 번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		String keyword = (String) req.getParameter("keyword");

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		cnt = dao.getSearchLoanCnt(keyword);
		System.out.println("cnt : " + cnt);

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6= (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage - 1) * pageSize + 1;
		// 1 = (1-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재페이지 마지막 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5; // 1페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		// 시작 페이지
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

		System.out.println("==============================================");

		ArrayList<LoanVO> loans = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);

		if (cnt > 0) {
			// 5-2 게시글 목록 조회
			loans = dao.searchLoanList(map);
		}

		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("loans", loans); // 게시글 목록
		model.addAttribute("cnt", cnt); // 게시글 갯수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("keyword", keyword); // keyword

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	public void loanRefusalAction(HttpServletRequest req, Model model) { // 지은
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loan_id", req.getParameter("loan_id"));
		map.put("state", 3); // 거절
		int updateCnt = dao.loanRequestAction(map);
		model.addAttribute("updateCnt", updateCnt);
	}

	// 은행별 img
	public String getBankImg(int account_bankCode) {
		// 은행코드 0(미기재) 1(국민) 2(우리) 3(농협) 4(신한) 5(하나) 6(코스모)

		String bankImg = "";
		switch (account_bankCode) {
		case 1:
			bankImg = "/bank/resources/images/bank/gookminicon.jpg";
			break;

		case 2:
			bankImg = "/bank/resources/images/bank/uriicon.jpg";
			break;

		case 3:
			bankImg = "/bank/resources/images/bank/nhicon.png";
			break;

		case 4:
			bankImg = "/bank/resources/images/bank/shinhanicon.png";
			break;

		case 5:
			bankImg = "/bank/resources/images/bank/hanaicon.png";
			break;

		case 6:
			bankImg = "/bank/resources/images/bank/kosmoicon.png";
			break;

		}

		return bankImg;
	}

	@Override
	public ArrayList<DepositVO> selectDepositProduct() {

		System.out.println("탔어");

		return dao.selectDepositProduct();
	}

}
