package com.spring.bank.product.vo;

import java.util.Date;

public class FundProductVO {
	
	private String fund_title;		// 펀딩제목 
	private String fund_content;	// 펀딩 내용
	private String fund_summary;	// 펀딩 상품 한줄 요약
	private Date fund_start_date;	// 펀딩기간(시작)
	private Date fund_end_date;		// 펀딩기간(종료)
	private int fund_goal_money;	// 목표금액
	private String fund_category;	// 펀딩종목
	private String fund_approve;	// 펀딩승인
	private String fund_mem_name;	// 등록자 이름
	private String fund_mem_hp;		// 등록자 연락처 
	private String fund_mem_email;	// 등록자 이메일
	private int fund_bank_code;		// 은행코드
	private String fund_account;	// 모금계좌
	private String fund_filename;	// 첨부파일
	
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
	
	public String getFund_summary() {
		return fund_summary;
	}
	
	public void setFund_summary(String fund_summary) {
		this.fund_summary = fund_summary;
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
	
	public int getFund_goal_money() {
		return fund_goal_money;
	}
	
	public void setFund_goal_money(int fund_goal_money) {
		this.fund_goal_money = fund_goal_money;
	}
	
	public String getFund_category() {
		return fund_category;
	}
	
	public void setFund_category(String fund_category) {
		this.fund_category = fund_category;
	}
	
	public String getFund_approve() {
		return fund_approve;
	}
	
	public void setFund_approve(String fund_approve) {
		this.fund_approve = fund_approve;
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
	
	public int getFund_bank_code() {
		return fund_bank_code;
	}

	public void setFund_bank_code(int fund_bank_code) {
		this.fund_bank_code = fund_bank_code;
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
	
	
}
