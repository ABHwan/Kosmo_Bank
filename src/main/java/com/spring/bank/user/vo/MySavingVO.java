package com.spring.bank.user.vo;

import java.util.Date;

public class MySavingVO {
	
	/* 적금은?
	 * saving_id
	 * saving_product_name
	 * account_id
	 * saving_joinDate
	 * saving_state
	 * saving_rate
	 * saving_money
	 * saving_endDate
	 * 
	 * 연금은?
	 * irp_id
	 * irp_product_name
	 * account_id
	 * irp_joinDate
	 * irp_state
	 * irp_rate
	 * irp_money
	 * irp_endDate
	 */

	// 상품이름, 계좌번호, 은행명, 가입날짜, 상태, 금리, 금액, 만기일
	// 예금 테이블
	private int saving_id;					// 적금번호
	private String saving_product_name;		// 상품이름
	private String account_id;				// 계좌번호
	private Date saving_joinDate;			// 가입날짜
	private int saving_state;				// 적금상태
	private int saving_rate;				// 적금금리
	private int saving_money;				// 적금금액
	private Date saving_endDate;			// 적금만기일
	
	// 참조 테이블
	private int saving_product_bankCode;	// 은행명코드

	public int getSaving_id() {
		return saving_id;
	}

	public void setSaving_id(int saving_id) {
		this.saving_id = saving_id;
	}

	public String getSaving_product_name() {
		return saving_product_name;
	}

	public void setSaving_product_name(String saving_product_name) {
		this.saving_product_name = saving_product_name;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public Date getSaving_joinDate() {
		return saving_joinDate;
	}

	public void setSaving_joinDate(Date saving_joinDate) {
		this.saving_joinDate = saving_joinDate;
	}

	public int getSaving_state() {
		return saving_state;
	}

	public void setSaving_state(int saving_state) {
		this.saving_state = saving_state;
	}

	public int getSaving_rate() {
		return saving_rate;
	}

	public void setSaving_rate(int saving_rate) {
		this.saving_rate = saving_rate;
	}

	public int getSaving_money() {
		return saving_money;
	}

	public void setSaving_money(int saving_money) {
		this.saving_money = saving_money;
	}

	public Date getSaving_endDate() {
		return saving_endDate;
	}

	public void setSaving_endDate(Date saving_endDate) {
		this.saving_endDate = saving_endDate;
	}

	public int getSaving_product_bankCode() {
		return saving_product_bankCode;
	}

	public void setSaving_product_bankCode(int saving_product_bankCode) {
		this.saving_product_bankCode = saving_product_bankCode;
	}
}
