package com.spring.bank.product.vo;

import java.sql.Date;

public class LoanProductVO {
	private String loan_product_name;
	private float loan_product_rate;
	private String loan_product_summary;
	private int loan_product_minPrice;
	private long loan_product_maxPrice;
	private int loan_product_minDate;
	private int loan_product_maxDate;
	private int loan_product_bankCode;
	private Date loan_product_baseDate;
	private float loan_product_prepaymentRate;
	
	private String pre_loan_product_name; // pk가 얘라서 수정할때 where절로 이전 pk값을 찾아줘야함
	
	public String getLoan_product_name() {
		return loan_product_name;
	}
	public void setLoan_product_name(String loan_product_name) {
		this.loan_product_name = loan_product_name;
	}
	public float getLoan_product_rate() {
		return loan_product_rate;
	}
	public void setLoan_product_rate(float loan_product_rate) {
		this.loan_product_rate = loan_product_rate;
	}
	public String getLoan_product_summary() {
		return loan_product_summary;
	}
	public void setLoan_product_summary(String loan_product_summary) {
		this.loan_product_summary = loan_product_summary;
	}
	public int getLoan_product_minPrice() {
		return loan_product_minPrice;
	}
	public void setLoan_product_minPrice(int loan_product_minPrice) {
		this.loan_product_minPrice = loan_product_minPrice;
	}
	public long getLoan_product_maxPrice() {
		return loan_product_maxPrice;
	}
	public void setLoan_product_maxPrice(long loan_product_maxPrice) {
		this.loan_product_maxPrice = loan_product_maxPrice;
	}
	public int getLoan_product_minDate() {
		return loan_product_minDate;
	}
	public void setLoan_product_minDate(int loan_product_minDate) {
		this.loan_product_minDate = loan_product_minDate;
	}
	public int getLoan_product_maxDate() {
		return loan_product_maxDate;
	}
	public void setLoan_product_maxDate(int loan_product_maxDate) {
		this.loan_product_maxDate = loan_product_maxDate;
	}
	public int getLoan_product_bankCode() {
		return loan_product_bankCode;
	}
	public void setLoan_product_bankCode(int loan_product_bankCode) {
		this.loan_product_bankCode = loan_product_bankCode;
	}
	public Date getLoan_product_baseDate() {
		return loan_product_baseDate;
	}
	public void setLoan_product_baseDate(Date loan_product_baseDate) {
		this.loan_product_baseDate = loan_product_baseDate;
	}
	public float getLoan_product_prepaymentRate() {
		return loan_product_prepaymentRate;
	}
	public void setLoan_product_prepaymentRate(float loan_product_prepaymentRate) {
		this.loan_product_prepaymentRate = loan_product_prepaymentRate;
	}
	@Override
	public String toString() {
		return "LoanProductVO [loan_product_name=" + loan_product_name + ", loan_product_rate=" + loan_product_rate
				+ ", loan_product_summary=" + loan_product_summary + ", loan_product_minPrice=" + loan_product_minPrice
				+ ", loan_product_maxPrice=" + loan_product_maxPrice + ", loan_product_minDate=" + loan_product_minDate
				+ ", loan_product_maxDate=" + loan_product_maxDate + ", loan_product_bankCode=" + loan_product_bankCode
				+ ", loan_product_baseDate=" + loan_product_baseDate + ", loan_product_prepaymentRate="
				+ loan_product_prepaymentRate + "]";
	}
	public String getPre_loan_product_name() {
		return pre_loan_product_name;
	}
	public void setPre_loan_product_name(String pre_loan_product_name) {
		this.pre_loan_product_name = pre_loan_product_name;
	}
	
	
}
