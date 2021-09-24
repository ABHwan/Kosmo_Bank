package com.spring.bank.user.vo;

import java.sql.Date;

public class LoanProductVO {
	String loan_product_name;
	float loan_product_rate;
	String loan_product_summary;
	int loan_product_min_price;
	int loan_product_max_price;
	int loan_product_min_date;
	int loan_product_max_date;
	int loan_product_bankCode;
	Date loan_product_base_date;
	
	public String getloan_product_name() {
		return loan_product_name;
	}
	public void setloan_product_name(String loan_product_name) {
		this.loan_product_name = loan_product_name;
	}
	public float getloan_product_rate() {
		return loan_product_rate;
	}
	public void setloan_product_rate(float loan_product_rate) {
		this.loan_product_rate = loan_product_rate;
	}
	public String getloan_product_summary() {
		return loan_product_summary;
	}
	public void setloan_product_summary(String loan_product_summary) {
		this.loan_product_summary = loan_product_summary;
	}
	public int getloan_product_min_price() {
		return loan_product_min_price;
	}
	public void setloan_product_min_price(int loan_product_min_price) {
		this.loan_product_min_price = loan_product_min_price;
	}
	public int getloan_product_max_price() {
		return loan_product_max_price;
	}
	public void setloan_product_max_price(int loan_product_max_price) {
		this.loan_product_max_price = loan_product_max_price;
	}
	public int getloan_product_min_date() {
		return loan_product_min_date;
	}
	public void setloan_product_min_date(int loan_product_min_date) {
		this.loan_product_min_date = loan_product_min_date;
	}
	public int getloan_product_max_date() {
		return loan_product_max_date;
	}
	public void setloan_product_max_date(int loan_product_max_date) {
		this.loan_product_max_date = loan_product_max_date;
	}
	public int getloan_product_bankCode() {
		return loan_product_bankCode;
	}
	public void setloan_product_bankCode(int loan_product_bankCode) {
		this.loan_product_bankCode = loan_product_bankCode;
	}
	public Date getloan_product_base_date() {
		return loan_product_base_date;
	}
	public void setloan_product_base_date(Date loan_product_base_date) {
		this.loan_product_base_date = loan_product_base_date;
	}
	@Override
	public String toString() {
		return "LoanProductVO [loan_product_name=" + loan_product_name + ", loan_product_rate=" + loan_product_rate
				+ ", loan_product_summary=" + loan_product_summary + ", loan_product_min_price="
				+ loan_product_min_price + ", loan_product_max_price=" + loan_product_max_price
				+ ", loan_product_min_date=" + loan_product_min_date + ", loan_product_max_date="
				+ loan_product_max_date + ", loan_product_bankCode=" + loan_product_bankCode
				+ ", loan_product_base_date=" + loan_product_base_date + "]";
	}
	
	
}
