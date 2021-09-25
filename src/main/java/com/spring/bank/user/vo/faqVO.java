package com.spring.bank.user.vo;

import java.util.Date;

public class faqVO {
	private int faq_id; // 게시글번호
	private String faq_title; // 제목
	private String faq_content; // 내용
	private Date faq_regDate; // 작성일

	public int getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public Date getFaq_regDate() {
		return faq_regDate;
	}

	public void setFaq_regDate(Date faq_regDate) {
		this.faq_regDate = faq_regDate;
	}

}
