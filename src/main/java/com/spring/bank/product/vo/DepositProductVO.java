package com.spring.bank.product.vo;

import java.sql.Date;

// 예금상품(deposit_product) 
public class DepositProductVO {
	/*
	deposit_product_name		VARCHAR2(50)		PK		예금상품이름	
	deposit_product_summary		VARCHAR2(1000)				예금상품한줄요약	
	deposit_product_date		DATE						예금등록일	
	deposit_product_interRate	NUMBER(5,2)					금리	
	deposit_product_type		NUMBER(1)					복리	예금종류(복리/단리)	(복리:0, 단리:1)
	deposit_product_maxDate		NUMBER(2)					최대예금기간	
	deposit_product_minDate		NUMBER(2)					최소예금기간	
	deposit_product_minPrice	NUMBER(20)					최소예치금액	
	deposit_product_maxPrice	NUMBER(20)					최대예치금액
	deposit_product_explanation	VARCHAR2(4000)				예금설명	
	deposit_product_notice		VARCHAR2(4000)				유의사항	
	deposit_product_bankCode	NUMBER(1)					0(미기재)	은행코드	
	 */
	
	private String deposit_product_name;
	private String deposit_product_summary;
	private Date deposit_product_date;
	private float deposit_product_interRate;
	private int deposit_product_type;
	private int deposit_product_maxDate;
	private int deposit_product_minDate;
	private int deposit_product_minPrice;
	private int deposit_product_maxPrice;
	private String deposit_product_explanation;
	private String deposit_product_notice;
	private int deposit_product_bankCode;
	
	private int rNum;
	
	public DepositProductVO() {}

	public String getDeposit_product_name() {
		return deposit_product_name;
	}

	public int getDeposit_product_maxPrice() {
		return deposit_product_maxPrice;
	}

	public void setDeposit_product_maxPrice(int deposit_product_maxPrice) {
		this.deposit_product_maxPrice = deposit_product_maxPrice;
	}

	public void setDeposit_product_name(String deposit_product_name) {
		this.deposit_product_name = deposit_product_name;
	}

	public String getDeposit_product_summary() {
		return deposit_product_summary;
	}

	public void setDeposit_product_summary(String deposit_product_summary) {
		this.deposit_product_summary = deposit_product_summary;
	}

	public Date getDeposit_product_date() {
		return deposit_product_date;
	}

	public void setDeposit_product_date(Date deposit_product_date) {
		this.deposit_product_date = deposit_product_date;
	}

	public float getDeposit_product_interRate() {
		return deposit_product_interRate;
	}

	public void setDeposit_product_interRate(float deposit_product_interRate) {
		this.deposit_product_interRate = deposit_product_interRate;
	}

	public int getDeposit_product_type() {
		return deposit_product_type;
	}

	public void setDeposit_product_type(int deposit_product_type) {
		this.deposit_product_type = deposit_product_type;
	}

	public int getDeposit_product_maxDate() {
		return deposit_product_maxDate;
	}

	public void setDeposit_product_maxDate(int deposit_product_maxDate) {
		this.deposit_product_maxDate = deposit_product_maxDate;
	}

	public int getDeposit_product_minDate() {
		return deposit_product_minDate;
	}

	public void setDeposit_product_minDate(int deposit_product_minDate) {
		this.deposit_product_minDate = deposit_product_minDate;
	}

	public int getDeposit_product_minPrice() {
		return deposit_product_minPrice;
	}

	public void setDeposit_product_minPrice(int deposit_product_minPrice) {
		this.deposit_product_minPrice = deposit_product_minPrice;
	}


	public String getDeposit_product_explanation() {
		return deposit_product_explanation;
	}

	public void setDeposit_product_explanation(String deposit_product_explanation) {
		this.deposit_product_explanation = deposit_product_explanation;
	}

	public String getDeposit_product_notice() {
		return deposit_product_notice;
	}

	public void setDeposit_product_notice(String deposit_product_notice) {
		this.deposit_product_notice = deposit_product_notice;
	}

	public int getDeposit_product_bankCode() {
		return deposit_product_bankCode;
	}

	public void setDeposit_product_bankCode(int deposit_product_bankCode) {
		this.deposit_product_bankCode = deposit_product_bankCode;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	
	
}
