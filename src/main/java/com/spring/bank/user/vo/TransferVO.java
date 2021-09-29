package com.spring.bank.user.vo;

import java.sql.Date;

public class TransferVO {
	private int transfer_id;
	private String account_id;
	private String member_id;
	private String transfer_senderAccount;
	private int transfer_money;
	private String transfer_inOut;
	private Date transfer_inOutDate;
	private String transfer_outComment;
	private String transfer_inComment;
	private String transfer_senderName;
	private String transfer_receiverName;
	private int transfer_bankCode;

	public int getTransfer_bankCode() {
		return transfer_bankCode;
	}

	public void setTransfer_bankCode(int transfer_bankCode) {
		this.transfer_bankCode = transfer_bankCode;
	}

	public int getTransfer_id() {
		return transfer_id;
	}

	public void setTransfer_id(int transfer_id) {
		this.transfer_id = transfer_id;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getTransfer_senderAccount() {
		return transfer_senderAccount;
	}

	public void setTransfer_senderAccount(String transfer_senderAccount) {
		this.transfer_senderAccount = transfer_senderAccount;
	}

	public int getTransfer_money() {
		return transfer_money;
	}

	public void setTransfer_money(int transfer_money) {
		this.transfer_money = transfer_money;
	}

	public String getTransfer_inOut() {
		return transfer_inOut;
	}

	public void setTransfer_inOut(String transfer_inOut) {
		this.transfer_inOut = transfer_inOut;
	}

	public Date getTransfer_inOutDate() {
		return transfer_inOutDate;
	}

	public void setTransfer_inOutDate(Date transfer_inOutDate) {
		this.transfer_inOutDate = transfer_inOutDate;
	}

	public String getTransfer_outComment() {
		return transfer_outComment;
	}

	public void setTransfer_outComment(String transfer_outComment) {
		this.transfer_outComment = transfer_outComment;
	}

	public String getTransfer_inComment() {
		return transfer_inComment;
	}

	public void setTransfer_inComment(String transfer_inComment) {
		this.transfer_inComment = transfer_inComment;
	}

	public String getTransfer_senderName() {
		return transfer_senderName;
	}

	public void setTransfer_senderName(String transfer_senderName) {
		this.transfer_senderName = transfer_senderName;
	}

	public String getTransfer_receiverName() {
		return transfer_receiverName;
	}

	public void setTransfer_receiverName(String transfer_receiverName) {
		this.transfer_receiverName = transfer_receiverName;
	}

}
