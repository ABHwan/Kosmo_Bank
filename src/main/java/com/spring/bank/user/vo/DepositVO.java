package com.spring.bank.user.vo;

import java.util.Date;

//신청한 예금 정보
public class DepositVO {

	private int deposit_id;	 				// 예금번호
	private String deposit_product_name; 	// 예금상품이름
	private String account_id; 				// 계좌번호
	private Date deposit_joinDate;			// 예금가입날짜
	private int deposit_state; 				// 예금상태
	private Float deposit_rate; 				// 예금금리
	private int deposit_type; 				// 예금종류(복/단)
	private int deposit_balance; 			// 예치금액
	private Date deposit_endDate; 			// 만기일
	private int account_bankCode;			// 은행 코드 0:미기재 1: 신한 2:국민 3:우리 4: 기업 5: 하나 
	
	public int getDeposit_id() {
		return deposit_id;
	}

	public void setDeposit_id(int deposit_id) {
		this.deposit_id = deposit_id;
	}

	public String getDeposit_product_name() {
		return deposit_product_name;
	}

	public void setDeposit_product_name(String deposit_product_name) {
		this.deposit_product_name = deposit_product_name;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public Date getDeposit_joinDate() {
		return deposit_joinDate;
	}

	public void setDeposit_joinDate(Date deposit_joinDate) {
		this.deposit_joinDate = deposit_joinDate;
	}

	public int getDeposit_state() {
		return deposit_state;
	}

	public void setDeposit_state(int deposit_state) {
		this.deposit_state = deposit_state;
	}

	public Float getDeposit_rate() {
		return deposit_rate;
	}

	public void setDeposit_rate(Float deposit_rate) {
		this.deposit_rate = deposit_rate;
	}

	public int getDeposit_type() {
		return deposit_type;
	}

	public void setDeposit_type(int deposit_type) {
		this.deposit_type = deposit_type;
	}

	public int getDeposit_balance() {
		return deposit_balance;
	}

	public void setDeposit_balance(int deposit_balance) {
		this.deposit_balance = deposit_balance;
	}

	public Date getDeposit_endDate() {
		return deposit_endDate;
	}

	public void setDeposit_endDate(Date deposit_endDate) {
		this.deposit_endDate = deposit_endDate;
	}

	public int getAccount_bankCode() {
		return account_bankCode;
	}

	public void setAccount_bankCode(int account_bankCode) {
		this.account_bankCode = account_bankCode;
	}

	
}
