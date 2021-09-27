package com.spring.bank.user.vo;

import java.util.Date;

public class Auto_TransferVO {

	private int auto_id;
	private String account_id;
	private String auto_senderAccount;
	private int auto_type;
	private Date auto_outDate;
	private int auto_money;
	private String auto_cycle;
	private Date auto_registDate;
	private Date auto_expirationDate;
	private Date auto_cancle;
	private String auto_inPlace;
	private int auto_status;
	private Date auto_lastDay;
	
	int getAuto_id() {
		return auto_id;
	}
	void setAuto_id(int auto_id) {
		this.auto_id = auto_id;
	}
	String getAccount_id() {
		return account_id;
	}
	void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	String getAuto_senderAccount() {
		return auto_senderAccount;
	}
	void setAuto_senderAccount(String auto_senderAccount) {
		this.auto_senderAccount = auto_senderAccount;
	}
	int getAuto_type() {
		return auto_type;
	}
	void setAuto_type(int auto_type) {
		this.auto_type = auto_type;
	}
	Date getAuto_outDate() {
		return auto_outDate;
	}
	void setAuto_outDate(Date auto_outDate) {
		this.auto_outDate = auto_outDate;
	}
	int getAuto_money() {
		return auto_money;
	}
	void setAuto_money(int auto_money) {
		this.auto_money = auto_money;
	}
	String getAuto_cycle() {
		return auto_cycle;
	}
	void setAuto_cycle(String auto_cycle) {
		this.auto_cycle = auto_cycle;
	}
	Date getAuto_registDate() {
		return auto_registDate;
	}
	void setAuto_registDate(Date auto_registDate) {
		this.auto_registDate = auto_registDate;
	}
	Date getAuto_expirationDate() {
		return auto_expirationDate;
	}
	void setAuto_expirationDate(Date auto_expirationDate) {
		this.auto_expirationDate = auto_expirationDate;
	}
	Date getAuto_cancle() {
		return auto_cancle;
	}
	void setAuto_cancle(Date auto_cancle) {
		this.auto_cancle = auto_cancle;
	}
	String getAuto_inPlace() {
		return auto_inPlace;
	}
	void setAuto_inPlace(String auto_inPlace) {
		this.auto_inPlace = auto_inPlace;
	}
	int getAuto_status() {
		return auto_status;
	}
	void setAuto_status(int auto_status) {
		this.auto_status = auto_status;
	}
	Date getAuto_lastDay() {
		return auto_lastDay;
	}
	void setAuto_lastDay(Date auto_lastDay) {
		this.auto_lastDay = auto_lastDay;
	}
	
}
