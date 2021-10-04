package com.spring.bank.user.vo;

import java.sql.Date;

public class AccountBookVO {
	
	private String member_id;
	private int accountbook_id;
	private int income;
	private int expense;
	private String register_date;
	private int total;
	
	// 자동이체내역 추가 변수
	private String auto_inplace; // 자동이체 기관(내용)
	private Date auto_date;		 // 자동이체 납부일
	private int auto_money;		 // 자동이체 금액
	private int sum_auto_money;  // 해당날짜 자동이체총금액
	
	
	public int getSum_auto_money() {
		return sum_auto_money;
	}
	public void setSum_auto_money(int sum_auto_money) {
		this.sum_auto_money = sum_auto_money;
	}
	public int getAuto_money() {
		return auto_money;
	}
	public void setAuto_money(int auto_money) {
		this.auto_money = auto_money;
	}
	public String getAuto_inplace() {
		return auto_inplace;
	}
	public void setAuto_inplace(String auto_inplace) {
		this.auto_inplace = auto_inplace;
	}
	public Date getAuto_date() {
		return auto_date;
	}
	public void setAuto_date(Date auto_date) {
		this.auto_date = auto_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getAccountbook_id() {
		return accountbook_id;
	}
	public void setAccountbook_id(int accountbook_id) {
		this.accountbook_id = accountbook_id;
	}
	public int getIncome() {
		return income;
	}
	public void setIncome(int income) {
		this.income = income;
	}
	public int getExpense() {
		return expense;
	}
	public void setExpense(int expense) {
		this.expense = expense;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
