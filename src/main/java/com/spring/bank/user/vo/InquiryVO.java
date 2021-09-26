package com.spring.bank.user.vo;

import java.util.Date;

public class InquiryVO {
	
	private int inquiry_id;				//분류번호
	private String inquiry_title;	 	//문의제목	
    private String inquiry_content;	 	//문의내용	
    private String member_id;	  		//고객 아이디	
    private int inquiry_ref;			//답글 여부	
    private Date inquiry_regDate;	 	//작성일	
    private String inquiry_password;	//비밀번호	
	
    
    public int getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public String getInquiry_title() {
		return inquiry_title;
	}
	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getInquiry_ref() {
		return inquiry_ref;
	}
	public void setInquiry_ref(int inquiry_ref) {
		this.inquiry_ref = inquiry_ref;
	}
	public Date getInquiry_regDate() {
		return inquiry_regDate;
	}
	public void setInquiry_regDate(Date inquiry_regDate) {
		this.inquiry_regDate = inquiry_regDate;
	}
	public String getInquiry_password() {
		return inquiry_password;
	}
	public void setInquiry_password(String inquiry_password) {
		this.inquiry_password = inquiry_password;
	}

    
    
}
