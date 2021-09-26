package com.spring.bank.user.vo;

import java.util.Date;

public class MyIRPVO {
	
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
	private int irp_id;					// 연금번호
	private String irp_product_name;	// 상품이름
	private String account_id;			// 계좌번호
	private Date irp_joinDate;			// 가입날짜
	private int irp_state;				// 연금상태
	private int irp_rate;				// 연금금리
	private int irp_money;				// 연금금액
	private Date irp_endDate;			// 연금만기일
	
	// 참조 테이블
	private int irp_product_bankCode;	// 은행명코드

	public int getIrp_id() {
		return irp_id;
	}

	public void setIrp_id(int irp_id) {
		this.irp_id = irp_id;
	}

	public String getIrp_product_name() {
		return irp_product_name;
	}

	public void setIrp_product_name(String irp_product_name) {
		this.irp_product_name = irp_product_name;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public Date getIrp_joinDate() {
		return irp_joinDate;
	}

	public void setIrp_joinDate(Date irp_joinDate) {
		this.irp_joinDate = irp_joinDate;
	}

	public int getIrp_state() {
		return irp_state;
	}

	public void setIrp_state(int irp_state) {
		this.irp_state = irp_state;
	}

	public int getIrp_rate() {
		return irp_rate;
	}

	public void setIrp_rate(int irp_rate) {
		this.irp_rate = irp_rate;
	}

	public int getIrp_money() {
		return irp_money;
	}

	public void setIrp_money(int irp_money) {
		this.irp_money = irp_money;
	}

	public Date getIrp_endDate() {
		return irp_endDate;
	}

	public void setIrp_endDate(Date irp_endDate) {
		this.irp_endDate = irp_endDate;
	}

	public int getIrp_product_bankCode() {
		return irp_product_bankCode;
	}

	public void setIrp_product_bankCode(int irp_product_bankCode) {
		this.irp_product_bankCode = irp_product_bankCode;
	}
	
	
}
