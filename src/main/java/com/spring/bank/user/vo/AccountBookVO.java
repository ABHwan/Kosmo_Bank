package com.spring.bank.user.vo;

public class AccountBookVO {
	
	private String member_id;
	private int accountbook_id;
	private int income;
	private int expense;
	private String register_date;
	private int total;
	
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
