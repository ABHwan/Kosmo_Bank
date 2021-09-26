package com.spring.bank.user.vo;

import java.sql.Date;

public class CustomerAccountVO {
	/*
	select 
	m.member_name as member_name,  			고객이름 String 
	m.member_birth as member_birth,			고객생년월일 date
 	a.account_bankCode as account_bankCode, 계좌은행코드 int
	a.account_id as account_id, 			계좌번호 String
	a.account_type as account_type,			계좌종류 int
	a.account_state as account_state, 		계좌상태 int
	a.account_stateContent as account_stateContent 계좌설명 String
	  from members m, account a
	 WHERE m.member_id = a.member_id;
	 */
	private String member_name;
	private Date member_birth;
	private int account_bankCode; //0:미기재, 1:국민, 2:우리, 3:농협, 4:신한, 5:하나, 6:코스모 
	private String account_id;
	private int account_type;
	private int account_state;
	private String account_stateContent;
	
	public CustomerAccountVO() {}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public Date getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}

	public int getAccount_bankCode() {
		return account_bankCode;
	}

	public void setAccount_bankCode(int account_bankCode) {
		this.account_bankCode = account_bankCode;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public int getAccount_type() {
		return account_type;
	}

	public void setAccount_type(int account_type) {
		this.account_type = account_type;
	}

	public int getAccount_state() {
		return account_state;
	}

	public void setAccount_state(int account_state) {
		this.account_state = account_state;
	}

	public String getAccount_stateContent() {
		return account_stateContent;
	}

	public void setAccount_stateContent(String account_stateContent) {
		this.account_stateContent = account_stateContent;
	}
	
	
}
