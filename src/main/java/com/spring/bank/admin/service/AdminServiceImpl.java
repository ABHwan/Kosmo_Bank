package com.spring.bank.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.bank.admin.dao.AdminDAOImpl;
import com.spring.bank.product.vo.DepositProductVO;
import com.spring.bank.product.vo.SavingProductVO;
import com.spring.bank.user.vo.CustomerAccountVO;
import com.spring.bank.user.vo.InquiryVO;
import com.spring.bank.user.vo.UserVO;
import com.spring.bank.user.vo.faqVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAOImpl dao;

	// 관리자 페이지 회원목록 조회
	@Override
	public void customerList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 10;		// 한 페이지당 출력할 회원수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 회원수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 5-1단계. 회원 수  조회
		cnt = dao.getCustomerCnt();
		System.out.println("회원 수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫 페이지를 1페이지로 지정
		}
		
		// 글 30건 기준
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
		
		ArrayList<UserVO> dtos = null;
		if(cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getCustomerList(map);
		}
		
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos);			// 회원 목록
		model.addAttribute("cnt", cnt);			// 회원수
		model.addAttribute("pageNum", pageNum); 	// 페이지 번호
		model.addAttribute("number", number);		// 출력용 회원번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		// 시작 페이지
			model.addAttribute("endPage", endPage);			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);	// 현재 페이지
		}
	}

	// 관리자 페이지 회원 검색
	@Override
	public void searchCustomer(HttpServletRequest req, Model model) {
		// 입력받은 검색어
		String search = req.getParameter("search");
		System.out.println("관리자 페이지 회원 검색어 : " + search);
		// 페이징
		int pageSize = 10;		// 한 페이지당 출력할 회원수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 회원수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 5-1단계. 회원 수  조회
		cnt = dao.getCustomerSearchCnt(search);
		
		System.out.println("검색된 회원 수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫 페이지를 1페이지로 지정
		}
		
		// 글 30건 기준
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
		
		ArrayList<UserVO> dtos = null;
		if(cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getCustomerSearchList(map);
		}
		
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos);			// 회원 목록
		model.addAttribute("cnt", cnt);			// 회원수
		model.addAttribute("pageNum", pageNum); 	// 페이지 번호
		model.addAttribute("number", number);		// 출력용 회원번호
		model.addAttribute("search", search);
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		// 시작 페이지
			model.addAttribute("endPage", endPage);			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);	// 현재 페이지
		}
	}

	// 관리자 페이지 회원 삭제
	@Override
	public void deleteCustomer(HttpServletRequest req, Model model) {
		
		int deleteCnt = 0;
		String member_ids[] = req.getParameterValues("check");
		if(member_ids != null) {
			for(int i=0; i<member_ids.length; i++) {
				deleteCnt = dao.deleteCustomer(member_ids[i]);
				System.out.println("삭제선택된 회원id: " + member_ids[i]);
			}
			System.out.println("삭제처리:" + deleteCnt +", "+  member_ids.length + "건 삭제처리 되었습니다.");
			model.addAttribute("msg", "회원삭제 처리되었습니다.");
		} else {
			model.addAttribute("msg", "삭제할 회원을 선택해주세요");
		}
		
		model.addAttribute("deleteCnt", deleteCnt);
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
	
	// 관리자 페이지 예금 상품 조회
	@Override
	public void selectDepositProduct(HttpServletRequest req, Model model) {
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
		
		// 예금상품 수  조회
		cnt = dao.getDepositProductCnt();
		System.out.println("등록 된 예금 상품 수 : " + cnt);
		
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
		
		ArrayList<DepositProductVO> dtos = null;
		if(cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.selectDepositProduct(map);
		}
		
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos);			// 예금 상품 목록
		model.addAttribute("cnt", cnt);				// 예금 상품 수
		model.addAttribute("pageNum", pageNum); 	// 페이지 번호
		model.addAttribute("number", number);		// 출력용 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		// 시작 페이지
			model.addAttribute("endPage", endPage);			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);	// 현재 페이지
		}
	}
		
	// 관리자 페이지 예금 상품검색
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
	
	// 관리자 페이지 예금 상품 상세 조회
	@Override
	public void getDepositProductInfo(HttpServletRequest req, Model model) {
		String deposit_product_name = req.getParameter("deposit_product_name");
		int pageNum= Integer.parseInt(req.getParameter("pageNum"));
		System.out.println(deposit_product_name+" 상품 상세조회");
		DepositProductVO vo = dao.getDepositProductInfo(deposit_product_name);
		model.addAttribute("vo", vo);
		model.addAttribute("pageNum", pageNum);
	}
		
	// 관리자 페이지 예금 상품 수정
	@Override
	public void updateDepositProduct(HttpServletRequest req, Model model) {

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
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
		System.out.println("pageNum : " + pageNum);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 페이지 예금 상품 삭제
	@Override
	public void deleteDepositProduct(HttpServletRequest req, Model model) {
		
		int deleteCnt = 0;
		String deposit_product_names[] = req.getParameterValues("check");
		if(deposit_product_names != null) {
			for(int i=0; i<deposit_product_names.length; i++) {
				deleteCnt = dao.deleteDepositProduct(deposit_product_names[i]);
				System.out.println("삭제선택된 예금상품명: " + deposit_product_names[i]);
			}
			//String deposit_product_name = String.join(",", deposit_product_names);
			//System.out.println("선택된 상품들: " + deposit_product_name);
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
				int pageSize = 10;		// 한 페이지당 출력할 적금상품
				int pageBlock = 3;		// 한 블럭당 페이지 갯수
				
				int cnt = 0;			// 적금상품 수
				int start = 0;			// 현재 페이지 시작 글 번호
				int end = 0;			// 현재 페이지 마지막 글 번호
				int number = 0;			// 출력용 글 번호
				String pageNum = "";	// 페이지 번호
				int currentPage = 0;	// 현재 페이지
				
				int pageCount = 0;		// 페이지 갯수
				int startPage = 0;		// 시작 페이지
				int endPage = 0;		// 마지막 페이지
				
				// 적금상품 수  조회
				cnt = dao.getSavingProductCnt();
				System.out.println("등록 된 적금 상품 수 : " + cnt);
				
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
				
				ArrayList<SavingProductVO> dtos = null;
				if(cnt > 0) {
					// 5-2단계. 회원수 조회
					dtos = dao.selectSavingProduct(map);
				}
				
				// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
				model.addAttribute("dtos", dtos);			// 적금 상품 목록
				model.addAttribute("cnt", cnt);				// 적금 상품 수
				model.addAttribute("pageNum", pageNum); 	// 페이지 번호
				model.addAttribute("number", number);		// 출력용 번호
				if(cnt > 0) {
					model.addAttribute("startPage", startPage);		// 시작 페이지
					model.addAttribute("endPage", endPage);			// 마지막 페이지
					model.addAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
					model.addAttribute("pageCount", pageCount);		// 페이지 갯수
					model.addAttribute("currentPage", currentPage);	// 현재 페이지
				}
	}

	// 관리자 페이지 적금 상품 검색
	@Override
	public void searchSavingProduct(HttpServletRequest req, Model model) {
		// 입력받은 검색어
		String search = req.getParameter("search");
		System.out.println("관리자 페이지 회원 검색어 : " + search);
		
		// 페이징
		int pageSize = 10;		// 한 페이지당 출력할 적금상품
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 적금상품 수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 검색 된 적금 상품 수 조회
		cnt = dao.getSavingProductSearchCnt(search);
		System.out.println("검색 된 적금 상품 수 : " + cnt);
		
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
		
		ArrayList<SavingProductVO> dtos = null;
		if(cnt > 0) {

			dtos = dao.searchSavingProduct(map);
		}
		
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos);			// 검색된 적금 상품 목록
		model.addAttribute("cnt", cnt);				// 적금 상품 수
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
	
	// 관리자 페이지 적금 상품 상세 조회
    @Override
    public void getSavingProductInfo(HttpServletRequest req, Model model) {
       String saving_product_name = req.getParameter("saving_product_name");
       int pageNum= Integer.parseInt(req.getParameter("pageNum"));
       System.out.println("req.getParameter('pageNum')" + req.getParameter("pageNum"));
       System.out.println(saving_product_name+" 상품 상세조회");
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
		if(saving_product_names != null) {
			for(int i=0; i<saving_product_names.length; i++) {
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


	
	//qna 조회(지현)
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
		
		//faq 게시글 조회(지현)
		@Override
		public void faqList_mng(HttpServletRequest req,Model model) {
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
		
		//faq 게시글 추가(지현)
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
		
		//faq 수정 상세(지현)
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

		//faq 수정 처리(지현)
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

		//faq 삭제(지현)
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
		int pageSize = 10;		// 한 페이지당 출력할 수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 회원계좌 수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 예금상품 수  조회
		cnt = dao.getCustomerAccountCnt();
		System.out.println("등록 된 회원별 계좌수 : " + cnt);
		
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
		
		ArrayList<CustomerAccountVO> dtos = null;
		if(cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getCustomerAccountList(map);
		}
		
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos);			// 예금 상품 목록
		model.addAttribute("cnt", cnt);				// 예금 상품 수
		model.addAttribute("pageNum", pageNum); 	// 페이지 번호
		model.addAttribute("number", number);		// 출력용 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		// 시작 페이지
			model.addAttribute("endPage", endPage);			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);	// 현재 페이지
		}
	}
		
	// 관리자 페이지 회원계좌검색목록
	public void searchCustomerAccountList(HttpServletRequest req, Model model) {
		String search = req.getParameter("search");
				
		int pageSize = 10;		// 한 페이지당 출력할 수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 회원계좌 수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 예금상품 수  조회
		cnt = dao.getSerachCustomerAccountCnt(search);
		System.out.println("검색된 회원별 계좌수 : " + cnt);
		
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
		
		ArrayList<CustomerAccountVO> dtos = null;
		if(cnt > 0) {
			// 5-2단계. 회원수 조회
			dtos = dao.getSearchCustomerAccountList(map);
		}
		
		// 6단계. jsp로 전달하기 위해 request나 session에 처리결과를 저장
		model.addAttribute("dtos", dtos);			// 예금 상품 목록
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
}
