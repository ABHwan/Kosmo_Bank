package com.spring.bank.user.vo;

import java.sql.Date;

public class LoanHistoryVO {
	private int loan_history_id;
	private int loan_id;
	private int transfer_id;
	private Date loan_history_date;
	private int loan_history_state;//1이자/2원금/3중도상환+수수료/4해지로 인한 원금 상환
	private int loan_history_amount;
	private int loan_history_tranAmount;
	private int loan_history_tranInterest;
	public int getLoan_history_id() {
		return loan_history_id;
	}
	public void setLoan_history_id(int loan_history_id) {
		this.loan_history_id = loan_history_id;
	}
	public int getLoan_id() {
		return loan_id;
	}
	public void setLoan_id(int loan_id) {
		this.loan_id = loan_id;
	}
	public int getTransfer_id() {
		return transfer_id;
	}
	public void setTransfer_id(int transfer_id) {
		this.transfer_id = transfer_id;
	}
	public Date getLoan_history_date() {
		return loan_history_date;
	}
	public void setLoan_history_date(Date loan_history_date) {
		this.loan_history_date = loan_history_date;
	}
	public int getLoan_history_state() {
		return loan_history_state;
	}
	public void setLoan_history_state(int loan_history_state) {
		this.loan_history_state = loan_history_state;
	}
	public int getLoan_history_amount() {
		return loan_history_amount;
	}
	public void setLoan_history_amount(int loan_history_amount) {
		this.loan_history_amount = loan_history_amount;
	}
	public int getLoan_history_tranAmount() {
		return loan_history_tranAmount;
	}
	public void setLoan_history_tranAmount(int loan_history_tranAmount) {
		this.loan_history_tranAmount = loan_history_tranAmount;
	}
	public int getLoan_history_tranInterest() {
		return loan_history_tranInterest;
	}
	public void setLoan_history_tranInterest(int loan_history_tranInterest) {
		this.loan_history_tranInterest = loan_history_tranInterest;
	}
	@Override
	public String toString() {
		return "LoanHistoryVO [loan_history_id=" + loan_history_id + ", loan_id=" + loan_id + ", transfer_id="
				+ transfer_id + ", loan_history_date=" + loan_history_date + ", loan_history_state="
				+ loan_history_state + ", loan_history_amount=" + loan_history_amount + ", loan_history_tranAmount="
				+ loan_history_tranAmount + ", loan_history_tranInterest=" + loan_history_tranInterest + "]";
	}
	
	
}
