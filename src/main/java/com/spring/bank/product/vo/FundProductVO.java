package com.spring.bank.product.vo;

import java.util.Date;

public class FundProductVO {

	// fund 테이블
	private int fund_id;        	// 펀드번호
	private String fund_title;      // 펀딩제목 
	private String fund_content;   	// 펀딩 내용
	private String fund_category;   // 펀딩종목
	private String fund_mem_name;   // 등록자 이름
	private String fund_mem_hp;     // 등록자 연락처 
	private String fund_mem_email;  // 등록자 이메일
	private String fund_account;  	// 모금계좌
	private String fund_filename;   // 첨부파일
	private String fund_summary;   	// 펀딩 상품 한줄 요약
	private int fund_goal_money;  	// 목표금액
	private Date fund_start_date;   // 펀딩기간(시작)
	private Date fund_end_date;     // 펀딩기간(종료)
	private int fund_bank_code;     // 은행코드
	private int fund_price;         // 상품가격
	private int fund_current_money; // 현재금액
	
	// fund_investor 테이블(참조)
	private String member_id;      	// 멤버아이디
	private int fund_money;			// 매수금액
	private int fund_amount;		// 매수수량
	private String fund_my_account;	// 내 계좌
	
	// account 테이블(참조)
	private String account_bankCode;// 내 계좌 은행명
	
	// setter, getter
	public int getFund_id() {
		return fund_id;
	}
	
	public void setFund_id(int fund_id) {
		this.fund_id = fund_id;
	}
	
	public String getFund_title() {
		return fund_title;
	}
	
	public void setFund_title(String fund_title) {
		this.fund_title = fund_title;
	}
	
	public String getFund_content() {
		return fund_content;
	}
	
	public void setFund_content(String fund_content) {
		this.fund_content = fund_content;
	}
	
	public String getFund_category() {
		return fund_category;
	}
	
	public void setFund_category(String fund_category) {
		this.fund_category = fund_category;
	}
	
	public String getFund_mem_name() {
		return fund_mem_name;
	}
	
	public void setFund_mem_name(String fund_mem_name) {
		this.fund_mem_name = fund_mem_name;
	}
	
	public String getFund_mem_hp() {
		return fund_mem_hp;
	}
	
	public void setFund_mem_hp(String fund_mem_hp) {
		this.fund_mem_hp = fund_mem_hp;
	}
	
	public String getFund_mem_email() {
		return fund_mem_email;
	}
	
	public void setFund_mem_email(String fund_mem_email) {
		this.fund_mem_email = fund_mem_email;
	}
	
	public String getFund_account() {
		return fund_account;
	}
	
	public void setFund_account(String fund_account) {
		this.fund_account = fund_account;
	}
	
	public String getFund_filename() {
		return fund_filename;
	}
	
	public void setFund_filename(String fund_filename) {
		this.fund_filename = fund_filename;
	}
	
	public String getFund_summary() {
		return fund_summary;
	}
	
	public void setFund_summary(String fund_summary) {
		this.fund_summary = fund_summary;
	}
	
	public int getFund_goal_money() {
		return fund_goal_money;
	}
	
	public void setFund_goal_money(int fund_goal_money) {
		this.fund_goal_money = fund_goal_money;
	}
	
	public Date getFund_start_date() {
		return fund_start_date;
	}
	
	public void setFund_start_date(Date fund_start_date) {
		this.fund_start_date = fund_start_date;
	}
	
	public Date getFund_end_date() {
		return fund_end_date;
	}
	
	public void setFund_end_date(Date fund_end_date) {
		this.fund_end_date = fund_end_date;
	}
	
	public int getFund_bank_code() {
		return fund_bank_code;
	}
	
	public void setFund_bank_code(int fund_bank_code) {
		this.fund_bank_code = fund_bank_code;
	}
	
	public int getFund_price() {
		return fund_price;
	}
	
	public void setFund_price(int fund_price) {
		this.fund_price = fund_price;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public int getFund_money() {
		return fund_money;
	}
	
	public void setFund_money(int fund_money) {
		this.fund_money = fund_money;
	}
	
	public int getFund_amount() {
		return fund_amount;
	}
	
	public void setFund_amount(int fund_amount) {
		this.fund_amount = fund_amount;
	}

	public String getFund_my_account() {
		return fund_my_account;
	}

	public void setFund_my_account(String fund_my_account) {
		this.fund_my_account = fund_my_account;
	}

	public String getAccount_bankCode() {
		return account_bankCode;
	}

	public void setAccount_bankCode(String account_bankCode) {
		this.account_bankCode = account_bankCode;
	}

	public int getFund_current_money() {
		return fund_current_money;
	}

	public void setFund_current_money(int fund_current_money) {
		this.fund_current_money = fund_current_money;
	}
}
