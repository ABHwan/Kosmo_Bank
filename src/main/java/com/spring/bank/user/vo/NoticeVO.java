package com.spring.bank.user.vo;

import java.sql.Date;

public class NoticeVO {

	private int notice_num;			// 공지사항고유번호
	private String notice_writer;	// 공지사항작성자	// 관리자
	private String notice_subject;	// 공지사항제목		// 관리자 + 고객
	private String notice_password;	// 공지사항비밀번호	// 관리자
	private String notice_content;	// 공지사항글		// 관리자  + 고객
	private String notice_readCnt;	// 공지사항조회수	// 관리자
	private Date notice_date;		// 공지사항작성일	// 관리자 + 고객
	
	public int getNotice_num() {
		return notice_num;
	}
	
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	
	public String getNotice_writer() {
		return notice_writer;
	}
	
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	
	public String getNotice_subject() {
		return notice_subject;
	}
	
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	
	public String getNotice_password() {
		return notice_password;
	}
	
	public void setNotice_password(String notice_password) {
		this.notice_password = notice_password;
	}
	
	public String getNotice_content() {
		return notice_content;
	}
	
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	public String getNotice_readCnt() {
		return notice_readCnt;
	}
	
	public void setNotice_readCnt(String notice_readCnt) {
		this.notice_readCnt = notice_readCnt;
	}
	
	public Date getNotice_date() {
		return notice_date;
	}
	
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
}
