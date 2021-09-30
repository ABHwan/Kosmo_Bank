package com.spring.bank.user.vo;

import java.sql.Date;

public class UtilityVO {

	private int utility_num;
	private String utility_id;
	private String member_id;
	private String account_id;
	private int utility_money;
	private Date utility_date;
	private int utility_state;
	
	public int getUtility_num() {
		return utility_num;
	}
	public void setUtility_num(int utility_num) {
		this.utility_num = utility_num;
	}
	public String getUtility_id() {
		return utility_id;
	}
	public void setUtility_id(String utility_id) {
		this.utility_id = utility_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public int getUtility_money() {
		return utility_money;
	}
	public void setUtility_money(int utility_money) {
		this.utility_money = utility_money;
	}
	public Date getUtility_date() {
		return utility_date;
	}
	public void setUtility_date(Date utility_date) {
		this.utility_date = utility_date;
	}
	public int getUtility_state() {
		return utility_state;
	}
	public void setUtility_state(int utility_state) {
		this.utility_state = utility_state;
	}
	
}
