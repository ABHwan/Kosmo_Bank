package com.spring.bank.user.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class UserVO{

	// 멤버변수
	private String member_id; // PK
	private String member_password;
	private String member_name;
	private Date member_birth;
	private String member_hp;
	private String member_email;
	private int member_zipcode;
	private String member_addr1;
	private String member_addr2;
	private String member_addr3;
    private Timestamp member_indate;
    private int member_enabled;   		// 이메일 인증키
    private String member_authority; // 회원등급 코드
    
    // 본인인증 고유키
    private String unique_key;
    

	public UserVO() {}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

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

	public String getMember_hp() {
		return member_hp;
	}

	public void setMember_hp(String member_hp) {
		this.member_hp = member_hp;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(int member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_addr1() {
		return member_addr1;
	}

	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}

	public String getMember_addr2() {
		return member_addr2;
	}

	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}

	public String getMember_addr3() {
		return member_addr3;
	}

	public void setMember_addr3(String member_addr3) {
		this.member_addr3 = member_addr3;
	}

	public Timestamp getMember_indate() {
		return member_indate;
	}

	public void setMember_indate(Timestamp member_indate) {
		this.member_indate = member_indate;
	}

	public int getMember_enabled() {
		return member_enabled;
	}

	public void setMember_enabled(int member_enabled) {
		this.member_enabled = member_enabled;
	}

	public String getMember_authority() {
		return member_authority;
	}

	public void setMember_authority(String member_authority) {
		this.member_authority = member_authority;
	}

	public String getUnique_key() {
		return unique_key;
	}

	public void setUnique_key(String unique_key) {
		this.unique_key = unique_key;
	}

	
   
}
