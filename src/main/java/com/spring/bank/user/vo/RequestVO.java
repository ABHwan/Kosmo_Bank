package com.spring.bank.user.vo;

import java.util.Date;

public class RequestVO {

	// reqeust 테이블
	private int request_id; //
	private int state; // 계좌 상태 사용 휴면 해지
	private String product_name; // 금융상품 이름
	private double product_rate; // 금융상품 금리
	private int product_type; // 금융상태 타입 0(복리) 1(단리)
	private Date product_endDate; // 만기일
	private int request_type; // 승인 코드
	private Date product_startDate; // 상품 가입 날짜
	private String member_id; // 고객 아이디
	private String account_password;
	private int account_balance;
	private int account_type;
	private int account_bankCode;

	public int getRequest_id() {
		return request_id;
	}

	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public double getProduct_rate() {
		return product_rate;
	}

	public void setProduct_rate(double product_rate) {
		this.product_rate = product_rate;
	}

	public int getProduct_type() {
		return product_type;
	}

	public void setProduct_type(int product_type) {
		this.product_type = product_type;
	}

	public Date getProduct_endDate() {
		return product_endDate;
	}

	public void setProduct_endDate(Date product_endDate) {
		this.product_endDate = product_endDate;
	}

	public int getRequest_type() {
		return request_type;
	}

	public void setRequest_type(int request_type) {
		this.request_type = request_type;
	}

	public Date getProduct_startDate() {
		return product_startDate;
	}

	public void setProduct_startDate(Date product_startDate) {
		this.product_startDate = product_startDate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getAccount_password() {
		return account_password;
	}

	public void setAccount_password(String account_password) {
		this.account_password = account_password;
	}

	public int getAccount_balance() {
		return account_balance;
	}

	public void setAccount_balance(int account_balance) {
		this.account_balance = account_balance;
	}

	public int getAccount_type() {
		return account_type;
	}

	public void setAccount_type(int account_type) {
		this.account_type = account_type;
	}

	public int getAccount_bankCode() {
		return account_bankCode;
	}

	public void setAccount_bankCode(int account_bankCode) {
		this.account_bankCode = account_bankCode;
	}

	@Override
	public String toString() {
		return "RequestVO [request_id=" + request_id + ", state=" + state + ", product_name=" + product_name
				+ ", product_rate=" + product_rate + ", product_type=" + product_type + ", product_endDate="
				+ product_endDate + ", request_type=" + request_type + ", product_startDate=" + product_startDate + "]";
	}

}
