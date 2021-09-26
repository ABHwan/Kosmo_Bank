package com.spring.bank.user.vo;

import java.util.Date;

public class MyDepositVO {
	
	/* 적금은?
	 * saving_id
	 * saving_product_name
	 * account_id
	 * saving_joinDate
	 * saving_rate
	 * saving_money
	 * saving_endDate
	 * 
	 * 연금은?
	 * irp_id
	 * irp_product_name
	 * account_id
	 * irp_joinDate
	 * irp_rate
	 * irp_money
	 * irp_endDate
	 */

	// 상품이름, 계좌번호, 은행명, 가입날짜, 상태, 금리, 금액, 만기일
	// 예금 테이블
	private int deposit_id;					// 예금번호
	private String deposit_product_name;	// 상품이름
	private String account_id;				// 계좌번호
	private Date deposit_joinDate;			// 가입날짜
	private int deposit_state;				// 예금상태
	private int deposit_rate;				// 예금금리
	private int deposit_balance;			// 예금금액
	private Date deposit_endDate;			// 예금만기일
	
	// 참조 테이블
	private int deposit_product_bankCode;	// 은행명코드
	
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
	
	public int getDeposit_rate() {
		return deposit_rate;
	}
	
	public void setDeposit_rate(int deposit_rate) {
		this.deposit_rate = deposit_rate;
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
	
	public int getDeposit_product_bankCode() {
		return deposit_product_bankCode;
	}
	
	public void setDeposit_product_bankCode(int deposit_product_bankCode) {
		this.deposit_product_bankCode = deposit_product_bankCode;
	}
}
