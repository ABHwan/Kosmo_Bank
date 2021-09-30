package com.spring.bank.user.vo;

import oracle.sql.DATE;

public class AccountVO {

	int account_bankCode;
	String account_id;
	String account_password;
	String member_id;
	int account_balance;
	int account_type;
	int account_state;
	String account_stateContent;
	int account_limit;
	DATE account_deleteDate;
	DATE account_sleepDate;
	DATE account_newDate;
	String unique_key;
	int account_default;
	int account_linked;

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

	public String getAccount_password() {
		return account_password;
	}

	public void setAccount_password(String account_password) {
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

	public DATE getAccount_deleteDate() {
		return account_deleteDate;
	}

	public void setAccount_deleteDate(DATE account_deleteDate) {
		this.account_deleteDate = account_deleteDate;
	}

	public DATE getAccount_sleepDate() {
		return account_sleepDate;
	}

	public void setAccount_sleepDate(DATE account_sleepDate) {
		this.account_sleepDate = account_sleepDate;
	}

	public DATE getAccount_newDate() {
		return account_newDate;
	}

	public void setAccount_newDate(DATE account_newDate) {
		this.account_newDate = account_newDate;
	}

	public String getUnique_key() {
		return unique_key;
	}

	public void setUnique_key(String unique_key) {
		this.unique_key = unique_key;
	}

	public int getAccount_default() {
		return account_default;
	}

	public void setAccount_default(int account_default) {
		this.account_default = account_default;
	}

	public int getAccount_linked() {
		return account_linked;
	}

	public void setAccount_linked(int account_linked) {
		this.account_linked = account_linked;
	}

}
