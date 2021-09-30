package com.spring.bank.product.vo;

import java.sql.Date;

public class SavingProductVO {

	private String saving_product_name;					// 적금 상품 이름
	private String saving_product_summary;				// 적금 상품 한줄 요약
	private Date saving_product_date;	//				// 적금 등록일
	private float saving_product_interRate;				// 금리
	private int saving_product_type;					// 적금 과목
	private int saving_product_maxDate;					// 최대 적금 기간
	private int saving_product_minDate;					// 최소 적금 기간
	private int saving_product_minPrice;				// 최소 금액
	private String saving_product_explanation;			// 적금 상품 설명
	private String saving_product_notice;				// 유의사항
	private int saving_product_bankCode;				// 은행코드
	
	public SavingProductVO() {}

	public String getSaving_product_name() {
		return saving_product_name;
	}

	public void setSaving_product_name(String saving_product_name) {
		this.saving_product_name = saving_product_name;
	}

	public String getSaving_product_summary() {
		return saving_product_summary;
	}

	public void setSaving_product_summary(String saving_product_summary) {
		this.saving_product_summary = saving_product_summary;
	}

	public Date getSaving_product_date() {
		return saving_product_date;
	}

	public void setSaving_product_date(Date saving_product_date) {
		this.saving_product_date = saving_product_date;
	}

	public float getSaving_product_interRate() {
		return saving_product_interRate;
	}

	public void setSaving_product_interRate(float saving_product_interRate) {
		this.saving_product_interRate = saving_product_interRate;
	}

	public int getSaving_product_type() {
		return saving_product_type;
	}

	public void setSaving_product_type(int saving_product_type) {
		this.saving_product_type = saving_product_type;
	}

	public int getSaving_product_maxDate() {
		return saving_product_maxDate;
	}

	public void setSaving_product_maxDate(int saving_product_maxDate) {
		this.saving_product_maxDate = saving_product_maxDate;
	}

	public int getSaving_product_minDate() {
		return saving_product_minDate;
	}

	public void setSaving_product_minDate(int saving_product_minDate) {
		this.saving_product_minDate = saving_product_minDate;
	}

	public int getSaving_product_minPrice() {
		return saving_product_minPrice;
	}

	public void setSaving_product_minPrice(int saving_product_minPrice) {
		this.saving_product_minPrice = saving_product_minPrice;
	}

	public String getSaving_product_explanation() {
		return saving_product_explanation;
	}

	public void setSaving_product_explanation(String saving_product_explanation) {
		this.saving_product_explanation = saving_product_explanation;
	}

	public String getSaving_product_notice() {
		return saving_product_notice;
	}

	public void setSaving_product_notice(String saving_product_notice) {
		this.saving_product_notice = saving_product_notice;
	}

	public int getSaving_product_bankCode() {
		return saving_product_bankCode;
	}

	public void setSaving_product_bankCode(int saving_product_bankCode) {
		this.saving_product_bankCode = saving_product_bankCode;
	}


}
