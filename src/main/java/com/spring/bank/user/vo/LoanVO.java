package com.spring.bank.user.vo;

import java.sql.Date;

public class LoanVO {
	private int loan_id;
	private String loan_product_name;
	private String member_id;
	private String account_id;
	private int loan_state;
	private Date loan_startDate;
	private Date loan_endDate;
	private int loan_month;
	private int loan_repaymentType;
	private float loan_rate;
	private long loan_monthlyRepayment;
	private long loan_amount;
	private long loan_balance;
	private int loan_interest;
	private long loan_tranAmount;
	private int loan_tranInterest;
	private long loan_delinquency;
	private float loan_prepaymentRate;
	
	public int getLoan_id() {
		return loan_id;
	}

	public void setLoan_id(int loan_id) {
		this.loan_id = loan_id;
	}

	public String getLoan_product_name() {
		return loan_product_name;
	}

	public void setLoan_product_name(String loan_product_name) {
		this.loan_product_name = loan_product_name;
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

	public int getLoan_state() {
		return loan_state;
	}

	public void setLoan_state(int loan_state) {
		this.loan_state = loan_state;
	}

	public Date getLoan_startDate() {
		return loan_startDate;
	}

	public void setLoan_startDate(Date loan_startDate) {
		this.loan_startDate = loan_startDate;
	}

	public Date getLoan_endDate() {
		return loan_endDate;
	}

	public void setLoan_endDate(Date loan_endDate) {
		this.loan_endDate = loan_endDate;
	}

	public int getLoan_month() {
		return loan_month;
	}

	public void setLoan_month(int loan_month) {
		this.loan_month = loan_month;
	}

	public int getLoan_repaymentType() {
		return loan_repaymentType;
	}

	public void setLoan_repaymentType(int loan_repaymentType) {
		this.loan_repaymentType = loan_repaymentType;
	}

	public float getLoan_rate() {
		return loan_rate;
	}

	public void setLoan_rate(float loan_rate) {
		this.loan_rate = loan_rate;
	}

	public long getLoan_monthlyRepayment() {
		return loan_monthlyRepayment;
	}

	public void setLoan_monthlyRepayment(long loan_monthlyRepayment) {
		this.loan_monthlyRepayment = loan_monthlyRepayment;
	}

	public long getLoan_amount() {
		return loan_amount;
	}

	public void setLoan_amount(long loan_amount) {
		this.loan_amount = loan_amount;
	}

	public long getLoan_balance() {
		return loan_balance;
	}

	public void setLoan_balance(long loan_balance) {
		this.loan_balance = loan_balance;
	}

	public int getLoan_interest() {
		return loan_interest;
	}

	public void setLoan_interest(int loan_interest) {
		this.loan_interest = loan_interest;
	}

	public long getLoan_tranAmount() {
		return loan_tranAmount;
	}

	public void setLoan_tranAmount(long loan_tranAmount) {
		this.loan_tranAmount = loan_tranAmount;
	}

	public int getLoan_tranInterest() {
		return loan_tranInterest;
	}

	public void setLoan_tranInterest(int loan_tranInterest) {
		this.loan_tranInterest = loan_tranInterest;
	}

	public long getLoan_delinquency() {
		return loan_delinquency;
	}

	public void setLoan_delinquency(long loan_delinquency) {
		this.loan_delinquency = loan_delinquency;
	}

	public float getLoan_prepaymentRate() {
		return loan_prepaymentRate;
	}

	public void setLoan_prepaymentRate(float loan_prepaymentRate) {
		this.loan_prepaymentRate = loan_prepaymentRate;
	}

	@Override
	public String toString() {
		return "LoanVO [loan_id=" + loan_id + ", loan_product_name=" + loan_product_name + ", member_id=" + member_id
				+ ", account_id=" + account_id + ", loan_state=" + loan_state + ", loan_startDate=" + loan_startDate
				+ ", loan_endDate=" + loan_endDate + ", loan_month=" + loan_month + ", loan_repaymentType="
				+ loan_repaymentType + ", loan_rate=" + loan_rate + ", loan_monthlyRepayment=" + loan_monthlyRepayment
				+ ", loan_amount=" + loan_amount + ", loan_balance=" + loan_balance + ", loan_interest=" + loan_interest
				+ ", loan_tranAmount=" + loan_tranAmount + ", loan_tranInterest=" + loan_tranInterest
				+ ", loan_delinquency=" + loan_delinquency + ", loan_prepaymentRate=" + loan_prepaymentRate + "]";
	}
	
}
