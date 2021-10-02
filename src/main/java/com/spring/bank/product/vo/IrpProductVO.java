package com.spring.bank.product.vo;

import java.util.Date;

//연금 상품 
public class IrpProductVO {

	private String irp_product_name; // 연금상품이름
	private String irp_product_summary; // 연금상품한줄요약
	private Date irp_product_date; // 연금등록일
	private float irp_product_interRate; // 연금금리
	private int irp_product_expiryTerm; //연금 납입기간
	private String irp_product_explanation; // 연금설명
	private String irp_product_notice; // 유의사항
	private int irp_product_money;     //연금 금액 
	private int irp_product_bankCode; // 은행코드

	public String getIrp_product_name() {
		return irp_product_name;
	}

	public void setIrp_product_name(String irp_product_name) {
		this.irp_product_name = irp_product_name;
	}

	public String getIrp_product_summary() {
		return irp_product_summary;
	}

	public void setIrp_product_summary(String irp_product_summary) {
		this.irp_product_summary = irp_product_summary;
	}

	public Date getIrp_product_date() {
		return irp_product_date;
	}

	public void setIrp_product_date(Date irp_product_date) {
		this.irp_product_date = irp_product_date;
	}

	public float getIrp_product_interRate() {
		return irp_product_interRate;
	}

	public void setIrp_product_interRate(float irp_product_interRate) {
		this.irp_product_interRate = irp_product_interRate;
	}

	public int getIrp_product_expiryTerm() {
		return irp_product_expiryTerm;
	}

	public void setIrp_product_expiryTerm(int irp_product_expiryTerm) {
		this.irp_product_expiryTerm = irp_product_expiryTerm;
	}

	public String getIrp_product_explanation() {
		return irp_product_explanation;
	}

	public void setIrp_product_explanation(String irp_product_explanation) {
		this.irp_product_explanation = irp_product_explanation;
	}

	public String getIrp_product_notice() {
		return irp_product_notice;
	}

	public void setIrp_product_notice(String irp_product_notice) {
		this.irp_product_notice = irp_product_notice;
	}
	
	public int getIrp_product_money() {
		return irp_product_money;
	}

	public void setIrp_product_money(int irp_product_money) {
		this.irp_product_money = irp_product_money;
	}

	public int getIrp_product_bankCode() {
		return irp_product_bankCode;
	}

	public void setIrp_product_bankCode(int irp_product_bankCode) {
		this.irp_product_bankCode = irp_product_bankCode;
	}

}
