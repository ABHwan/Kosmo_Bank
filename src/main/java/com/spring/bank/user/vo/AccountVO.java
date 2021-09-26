package com.spring.bank.user.vo;

import java.sql.Date;

public class AccountVO {

	private String account_id;
	private int account_password;
	private String member_id;
	private int account_balance;
	private int account_type;
	private int account_state;
	private String account_stateContent;
	private int account_limit;
	private Date account_deleteDate;
	private Date account_sleepDate;
	private Date account_newDate;
	private int account_bankCode;

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public int getAccount_password() {
		return account_password;
	}

	public void setAccount_password(int account_password) {
		this.account_password = account_password;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getAccount_balance() {
		return account_balance;
	}

	public void setAccount_balance(int account_balance) {
		this.account_balance = account_balance;
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

	public int getAccount_limit() {
		return account_limit;
	}

	public void setAccount_limit(int account_limit) {
		this.account_limit = account_limit;
	}

	public Date getAccount_deleteDate() {
		return account_deleteDate;
	}

	public void setAccount_deleteDate(Date account_deleteDate) {
		this.account_deleteDate = account_deleteDate;
	}

	public Date getAccount_sleepDate() {
		return account_sleepDate;
	}

	public void setAccount_sleepDate(Date account_sleepDate) {
		this.account_sleepDate = account_sleepDate;
	}

	public Date getAccount_newDate() {
		return account_newDate;
	}

	public void setAccount_newDate(Date account_newDate) {
		this.account_newDate = account_newDate;
	}

	public int getAccount_bankCode() {
		return account_bankCode;
	}

	public void setAccount_bankCode(int account_bankCode) {
		this.account_bankCode = account_bankCode;
	}

}
